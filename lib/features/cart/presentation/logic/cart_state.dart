part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<CartProductEntity>? cartProducts;

  CartLoaded(this.cartProducts);
}

final class CartEmpty extends CartState {}

final class CartError extends CartState {
  final ApiErrorModel error;

  CartError(this.error);
}

final class AddToCartLoading extends CartState {}

final class AddToCartSuccess extends CartState {}

final class AddToCartError extends CartState {
  final ApiErrorModel error;

  AddToCartError(this.error);
}

final class RemoveFromCartLoading extends CartState {}

final class RemoveFromCartSuccess extends CartState {}

final class RemoveFromCartError extends CartState {
  final ApiErrorModel error;

  RemoveFromCartError(this.error);
}

final class ApplyCouponLoading extends CartState {}

final class ApplyCouponSuccess extends CartState {
  final CouponEntity? couponData;

  ApplyCouponSuccess(this.couponData);
}

final class ApplyCouponError extends CartState {
  final ApiErrorModel error;

  ApplyCouponError(this.error);
}

final class RemoveCoupon extends CartState {}
