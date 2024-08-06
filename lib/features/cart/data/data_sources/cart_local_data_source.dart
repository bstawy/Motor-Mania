import 'package:flutter/material.dart';

import '../../../../core/caching/hive_manager.dart';
import '../../../../core/config/constants/caching_constants.dart';
import '../../domain/entities/cart_product_entity.dart';

class CartLocalDataSource {
  final HiveManager _hiveManager;

  CartLocalDataSource(this._hiveManager);

  Future<void> cacheCart(List<CartProductEntity> cartProduct) async {
    await _hiveManager.cacheDataList<CartProductEntity>(
      boxKey: HiveBoxKeys.cart,
      data: cartProduct,
    );
  }

  Future<void> cacheCartItem(CartProductEntity product) async {
    await _hiveManager.cacheDataItem<CartProductEntity>(
      boxKey: HiveBoxKeys.cart,
      data: product,
    );
  }

  Future<List<CartProductEntity>> getCachedCartList() async {
    List<CartProductEntity> list = [];
    list = await _hiveManager.retrieveData<CartProductEntity>(HiveBoxKeys.cart);
    debugPrint("getCachedCartList: $list");
    return list;
  }

  Future<void> removeProduct(String productId) async {
    final List<CartProductEntity> cart = await getCachedCartList();
    int index =
        cart.indexWhere((cartProduct) => cartProduct.product.id == productId);
    await _hiveManager.clearItem<CartProductEntity>(
      boxKey: HiveBoxKeys.cart,
      index: index,
    );
  }

  Future<void> updateProductQuantity(String productId, int newQuantity) async {
    final List<CartProductEntity> cart = await getCachedCartList();
    int index =
        cart.indexWhere((cartProduct) => cartProduct.product.id == productId);
    if (index != -1) {
      // final CartProductEntity cartProduct =
      //     cart[index].copyWith(quantity: newQuantity);
      final List<CartProductEntity> products = cart.map((element) {
        if (element.product.id == productId) {
          return element.copyWith(quantity: element.quantity + newQuantity);
        } else {
          return element;
        }
      }).toList();

      await _hiveManager.clearData<CartProductEntity>(HiveBoxKeys.cart);
      await _hiveManager.cacheDataList<CartProductEntity>(
        boxKey: HiveBoxKeys.cart,
        data: products,
      );
    }
  }

  Future<void> clearCart() async {
    await _hiveManager.clearData<CartProductEntity>(HiveBoxKeys.cart);
  }
}
