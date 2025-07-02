import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../data/models/new_payment_method_model.dart';
import '../../domain/entities/payment_method_entity.dart';
import '../../domain/use_cases/add_new_payment_method_use_case.dart';
import '../../domain/use_cases/deposite_to_wallet_use_case.dart';
import '../../domain/use_cases/get_all_payment_methods_use_case.dart';
import '../../domain/use_cases/get_wallet_balance_use_case.dart';

part 'payment_methods_state.dart';

class PaymentMethodsCubit extends Cubit<PaymentMethodsState> {
  final GetAllPaymentMethodsUseCase _getAllPaymentMethodsUseCase;
  final AddNewPaymentMethodUseCase _addNewPaymentMethodUseCase;
  final GetWalletBalanceUseCase _getWalletBalanceUseCase;
  final DepositeToWalletUseCase _depositeToWalletUseCase;

  PaymentMethodsCubit(
    this._getAllPaymentMethodsUseCase,
    this._addNewPaymentMethodUseCase,
    this._getWalletBalanceUseCase,
    this._depositeToWalletUseCase,
  ) : super(PaymentMethodsInitial());

  String selectedPaymentMethodId = "";
  List<PaymentMethodEntity> paymentMethods = [];

  Future<void> getAllPaymentMethods() async {
    emit(GetPaymentMethodsLoading());

    final result = await _getAllPaymentMethodsUseCase();

    result.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(GetPaymentMethodsFailure(error));
      },
      (success) {
        selectedPaymentMethodId = success.data?.isNotEmpty ?? false
            ? success.data?.firstWhere((e) => e.isDefault).id ?? ''
            : "";
        paymentMethods = success.data ?? [];
        emit(GetPaymentMethodsSuccess(success.data ?? []));
      },
    );
  }

  void selectPaymentMethod(String paymentMethodId) {
    selectedPaymentMethodId = paymentMethodId;
    emit(SelectDefaultPaymentMethod(paymentMethodId));
  }

  Future<void> addNewPaymentMethod({
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required String cvv,
  }) async {
    final paymentMethod = NewPaymentMethodModel(
      cardNumber: cardNumber,
      expiryMonth: expiryMonth,
      expiryYear: expiryYear,
      cvv: cvv,
    );

    emit(AddPaymentMethodLoading());

    final result = await _addNewPaymentMethodUseCase(paymentMethod);

    result.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(AddPaymentMethodFailure(error));
      },
      (_) {
        emit(AddPaymentMethodSuccess());
        getAllPaymentMethods();
      },
    );
  }

  Future<void> getWalletBalance() async {
    emit(GetWalletBalanceLoading());

    final result = await _getWalletBalanceUseCase();

    result.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(GetWalletBalanceFailure(error));
      },
      (success) => emit(GetWalletBalanceSuccess(success.data)),
    );
  }

  Future<void> depositToWallet(String paymentMethodId, double amount) async {
    emit(DepositToWalletLoading());

    final result = await _depositeToWalletUseCase(paymentMethodId, amount);

    result.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(DepositToWalletFailure(error));
      },
      (success) => emit(DepositToWalletSuccess(success.data)),
    );
  }

  void updateWalletBalance(num newBalance) {
    emit(GetWalletBalanceSuccess(newBalance));
  }
}
