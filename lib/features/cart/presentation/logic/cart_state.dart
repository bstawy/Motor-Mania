part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<CartProductEntity> cartProducts;

  CartLoaded(this.cartProducts);
}

final class CartEmpty extends CartState {}

final class AddToCartSuccess extends CartState {
  final String message;

  AddToCartSuccess(this.message);
}

final class RemoveFromCartSuccess extends CartState {
  final String message;

  RemoveFromCartSuccess(this.message);
}

final class CartError extends CartState {
  final ServerFailure failure;

  CartError(this.failure);
}

final class CouponApplied extends CartState {}

final class CouponRemoved extends CartState {}

final class CouponError extends CartState {
  final String message;

  CouponError(this.message);
}
