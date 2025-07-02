part of 'checkout_cubit.dart';

sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class SelectedPaymentMethod extends CheckoutState {
  final PaymentMethodTypes paymentMethodType;

  SelectedPaymentMethod(this.paymentMethodType);
}

final class MakeOrderLoading extends CheckoutState {}

final class MakeOrderSuccess extends CheckoutState {}

final class MakeOrderFailure extends CheckoutState {
  final ApiErrorModel error;

  MakeOrderFailure(this.error);
}
