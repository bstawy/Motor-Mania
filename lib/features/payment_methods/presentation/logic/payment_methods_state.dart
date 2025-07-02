part of 'payment_methods_cubit.dart';

sealed class PaymentMethodsState {}

final class PaymentMethodsInitial extends PaymentMethodsState {}

final class GetPaymentMethodsLoading extends PaymentMethodsState {}

final class GetPaymentMethodsSuccess extends PaymentMethodsState {
  final List<PaymentMethodEntity>? paymentMethods;

  GetPaymentMethodsSuccess(this.paymentMethods);
}

final class GetPaymentMethodsFailure extends PaymentMethodsState {
  final ApiErrorModel error;

  GetPaymentMethodsFailure(this.error);
}

final class SelectDefaultPaymentMethod extends PaymentMethodsState {
  final String paymentMethodId;

  SelectDefaultPaymentMethod(this.paymentMethodId);
}

final class AddPaymentMethodLoading extends PaymentMethodsState {}

final class AddPaymentMethodSuccess extends PaymentMethodsState {}

final class AddPaymentMethodFailure extends PaymentMethodsState {
  final ApiErrorModel error;

  AddPaymentMethodFailure(this.error);
}

final class GetWalletBalanceLoading extends PaymentMethodsState {}

final class GetWalletBalanceSuccess extends PaymentMethodsState {
  final num balance;

  GetWalletBalanceSuccess(this.balance);
}

final class GetWalletBalanceFailure extends PaymentMethodsState {
  final ApiErrorModel error;

  GetWalletBalanceFailure(this.error);
}

final class DepositToWalletLoading extends PaymentMethodsState {}

final class DepositToWalletSuccess extends PaymentMethodsState {
  final num newBalance;

  DepositToWalletSuccess(this.newBalance);
}

final class DepositToWalletFailure extends PaymentMethodsState {
  final ApiErrorModel error;

  DepositToWalletFailure(this.error);
}
