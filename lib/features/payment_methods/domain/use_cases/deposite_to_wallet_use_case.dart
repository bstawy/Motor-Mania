import '../../../../core/networking/api_result.dart';
import '../repos/payment_methods_repo.dart';

class DepositeToWalletUseCase {
  final PaymentMethodsRepo _repository;

  DepositeToWalletUseCase(this._repository);

  Future<ApiResult<num>> call(String paymentMethodId, num amount) async {
    return await _repository.depositeToWallet(paymentMethodId, amount);
  }
}
