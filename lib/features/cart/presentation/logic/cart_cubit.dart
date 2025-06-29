import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../domain/entities/cart_product_entity.dart';
import '../../domain/entities/coupon_entity.dart';
import '../../domain/use_cases/add_product_to_cart_use_case.dart';
import '../../domain/use_cases/apply_coupon_use_case.dart';
import '../../domain/use_cases/get_cart_products_use_case.dart';
import '../../domain/use_cases/remove_product_from_cart_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartProductsUseCase _getCartProductsUseCase;
  final AddProductToCartUseCase _addProductToCartUseCase;
  final RemoveProductFromCartUseCase _removeProductFromCartUseCase;
  final ApplyCouponUseCase _applyCouponUseCase;

  List<CartProductEntity> cartProducts = [];
  CouponEntity? couponData;
  int quantity = 0;
  num total = 0.0;
  num subTotal = 0.0;
  num discount = 0.0;
  num shippingFees = 10.0;

  CartCubit(
    this._getCartProductsUseCase,
    this._addProductToCartUseCase,
    this._removeProductFromCartUseCase,
    this._applyCouponUseCase,
  ) : super(CartInitial());

  void getCartProducts() async {
    emit(CartLoading());
    final response = await _getCartProductsUseCase.execute();
    response.fold(
      (failure) => emit(CartError(failure)),
      (cartProducts) {
        if (cartProducts.isEmpty) {
          debugPrint('Cart is empty');
          emit(CartEmpty());
        } else {
          calculateSubTotal(cartProducts);
          calculateTotal();
          quantity = cartProducts.length;
          this.cartProducts = cartProducts;
          emit(CartLoaded(cartProducts));
        }
      },
    );
  }

  void addProductToCart(int productId, int quantity) async {
    emit(CartLoading());
    final response =
        await _addProductToCartUseCase.execute(productId, quantity);
    response.fold(
      (failure) => emit(CartError(failure)),
      (message) {
        emit(AddToCartSuccess(message));
        getCartProducts();
      },
    );
  }

  void removeProductFromCart(int productId) async {
    emit(CartLoading());
    final response = await _removeProductFromCartUseCase.execute(productId);
    response.fold(
      (failure) => emit(CartError(failure)),
      (message) {
        emit(RemoveFromCartSuccess(message));
        getCartProducts();
      },
    );
  }

  void applyCoupon(String couponCode, num cartTotal) async {
    emit(ApplyCouponLoading());
    final response = await _applyCouponUseCase.execute(
        couponCode: couponCode, cartTotal: cartTotal);

    response.fold((failure) {
      emit(ApplyCouponError(failure.message ?? 'An error occurred'));
    }, (success) {
      couponData = success;
      discount = success.discountAmount;
      shippingFees = success.freeShipping ? 0.0 : 10.0;
      calculateTotal();
      emit(ApplyCouponSuccess(success));
    });
  }

  void removeCoupon() {
    couponData = null;
    shippingFees = 10.0;
    discount = 0.0;
    calculateTotal();
    emit(RemoveCoupon());
  }

  void calculateSubTotal(List<CartProductEntity> cartProducts) {
    subTotal = 0.0;
    cartProducts.map((cartProduct) {
      subTotal += cartProduct.product.price! * cartProduct.quantity;
    }).toList();
  }

  void calculateTotal() {
    total = subTotal + shippingFees - discount;
  }
}
