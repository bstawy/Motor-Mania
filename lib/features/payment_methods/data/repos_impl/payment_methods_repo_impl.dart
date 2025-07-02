import '../../../../core/networking/api_result.dart';
import '../../domain/entities/payment_method_entity.dart';
import '../../domain/repos/payment_methods_repo.dart';
import '../data_sources/payment_methods_remote_data_source.dart';
import '../models/new_payment_method_model.dart';
import '../models/payment_method_model.dart';

class PaymentMethodsRepoImpl implements PaymentMethodsRepo {
  final PaymentMethodsRemoteDataSource _remoteDataSource;

  PaymentMethodsRepoImpl(this._remoteDataSource);

  @override
  Future<ApiResult<List<PaymentMethodEntity>?>> getAllPaymentMethods() async {
    final response = await _remoteDataSource.getAllPaymentMethods();

    return response.fold(
      (failure) => Failure(failure.exception),
      (success) {
        final jsonPaymentMethods = success.data.data['data'];

        final List<PaymentMethodEntity> paymentMethods =
            (jsonPaymentMethods as List)
                .map((json) => PaymentMethodModel.fromJson(json))
                .toList();

        return Success(paymentMethods);
      },
    );
  }

  @override
  Future<ApiResult<void>> addPaymentMethod(
      NewPaymentMethodModel newPaymentMethod) async {
    final response =
        await _remoteDataSource.addNewPaymentMethod(newPaymentMethod);

    return response.fold(
      (failure) => Failure(failure.exception),
      (success) => Success(null),
    );
  }

  @override
  Future<ApiResult<num>> getWalletBalance() async {
    final response = await _remoteDataSource.getWalletBalance();

    return response.fold(
      (failure) => Failure(failure.exception),
      (success) {
        final jsonWallet = success.data.data['data'];
        return Success(jsonWallet['balance'] as num);
      },
    );
  }

  @override
  Future<ApiResult<num>> depositeToWallet(
      String paymentMethodId, num amount) async {
    final response =
        await _remoteDataSource.depositeToWallet(paymentMethodId, amount);

    return response.fold(
      (failure) => Failure(failure.exception),
      (success) {
        final jsonWallet = success.data.data['data'];
        return Success(jsonWallet['new_balance'] as num);
      },
    );
  }
}
