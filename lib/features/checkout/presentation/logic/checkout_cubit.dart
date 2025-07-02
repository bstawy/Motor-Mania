import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../../core/helpers/enums/payment_method_types_enum.dart';
import '../../data/models/order_data_model.dart';
import '../../domain/use_cases/make_order_use_case.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final MakeOrderUseCase _makeOrderUseCase;

  CheckoutCubit(this._makeOrderUseCase) : super(CheckoutInitial());

  PaymentMethodTypes selectedPaymentMethodType = PaymentMethodTypes.wallet;
  num cashOnDeliveryFees = 20.00;

  void selectPaymentMethod(PaymentMethodTypes paymentMethodType) {
    selectedPaymentMethodType = paymentMethodType;
    emit(SelectedPaymentMethod(paymentMethodType));
  }

  Future<void> makeOrder({
    int? paymentMethodId,
    required String shippingAddress,
    String? couponCode,
  }) async {
    final orderData = OrderDataModel(
      paymentMethodType: selectedPaymentMethodType,
      paymentMethodId: paymentMethodId,
      shippingAddress: shippingAddress,
      couponCode: couponCode,
    );

    emit(MakeOrderLoading());

    final result = await _makeOrderUseCase(orderData);

    result.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(MakeOrderFailure(error));
      },
      (_) {
        emit(MakeOrderSuccess());
      },
    );
  }

  // Future<void> makeOrder({
  //   required String cardNumber,
  //   required String expiryMonth,
  //   required String expiryYear,
  //   required String cvv,
  // }) async {
  //   final paymentMethod = NewPaymentMethodModel(
  //     cardNumber: cardNumber,
  //     expiryMonth: expiryMonth,
  //     expiryYear: expiryYear,
  //     cvv: cvv,
  //   );

  //   emit(MakeOrderLoading());

  //   final result = await _addNewPaymentMethodUseCase(paymentMethod);

  //   result.fold(
  //     (failure) {
  //       final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
  //       emit(MakeOrderFailure(error));
  //     },
  //     (_) {
  //       emit(MakeOrderSuccess());
  //       getAllPaymentMethods();
  //     },
  //   );
  // }
}
