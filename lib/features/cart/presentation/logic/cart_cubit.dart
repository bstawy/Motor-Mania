import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../domain/entities/cart_product_entity.dart';
import '../../domain/use_cases/add_product_to_cart_use_case.dart';
import '../../domain/use_cases/get_cart_products_use_case.dart';
import '../../domain/use_cases/remove_product_from_cart_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartProductsUseCase _getCartProductsUseCase;
  final AddProductToCartUseCase _addProductToCartUseCase;
  final RemoveProductFromCartUseCase _removeProductFromCartUseCase;
  num subTotal = 0.0;

  CartCubit(
    this._getCartProductsUseCase,
    this._addProductToCartUseCase,
    this._removeProductFromCartUseCase,
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
          emit(CartLoaded(cartProducts));
        }
      },
    );
  }

  void addProductToCart(String productId, int quantity) async {
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

  void removeProductFromCart(String productId) async {
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

  void calculateSubTotal(List<CartProductEntity> cartProducts) {
    subTotal = 0.0;
    cartProducts.map((cartProduct) {
      subTotal += cartProduct.product.price! * cartProduct.quantity;
    }).toList();
  }
}
