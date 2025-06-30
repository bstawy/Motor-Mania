import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../product_details/domain/entities/product_entity.dart';
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

    final response = await _getCartProductsUseCase();

    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);

        if (error.statusCode == 404) {
          emit(CartEmpty());
        } else {
          emit(CartError(error));
        }
      },
      (success) {
        cartProducts = success.data ?? [];

        if (cartProducts.isEmpty) {
          emit(CartEmpty());
        } else {
          quantity = cartProducts.length;
          calculateSubTotal(cartProducts);
          calculateTotal();

          emit(CartLoaded(cartProducts));
        }
      },
    );
  }

  void addProductToCart(ProductEntity product, int quantity) async {
    emit(AddToCartLoading());

    final response = await _addProductToCartUseCase(product, quantity);

    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);

        emit(AddToCartError(error));
      },
      (success) {
        emit(AddToCartSuccess());
        getCartProducts();
      },
    );
  }

  void removeProductFromCart(int productId) async {
    emit(RemoveFromCartLoading());

    final response = await _removeProductFromCartUseCase(productId);

    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);

        emit(RemoveFromCartError(error));
      },
      (success) {
        emit(RemoveFromCartSuccess());
        getCartProducts();
      },
    );
  }

  void applyCoupon(String couponCode, num cartTotal) async {
    emit(ApplyCouponLoading());

    final response =
        await _applyCouponUseCase(couponCode: couponCode, cartTotal: cartTotal);

    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);

        emit(ApplyCouponError(error));
      },
      (success) {
        couponData = success.data;
        discount = couponData?.discountAmount ?? 0.0;
        shippingFees = (couponData?.freeShipping ?? false) ? 0.0 : 10.0;
        calculateTotal();
        emit(ApplyCouponSuccess(couponData));
      },
    );
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
