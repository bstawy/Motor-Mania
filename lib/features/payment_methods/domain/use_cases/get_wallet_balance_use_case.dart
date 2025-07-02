import '../../../../core/networking/api_result.dart';
import '../repos/payment_methods_repo.dart';

class GetWalletBalanceUseCase {
  final PaymentMethodsRepo _repository;

  GetWalletBalanceUseCase(this._repository);

  Future<ApiResult<num>> call() async {
    return await _repository.getWalletBalance();
  }
}
