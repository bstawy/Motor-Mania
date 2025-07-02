import '../../../../core/networking/api_result.dart';
import '../entities/payment_method_entity.dart';
import '../repos/payment_methods_repo.dart';

class GetAllPaymentMethodsUseCase {
  final PaymentMethodsRepo _repository;

  GetAllPaymentMethodsUseCase(this._repository);

  Future<ApiResult<List<PaymentMethodEntity>?>> call() async {
    return await _repository.getAllPaymentMethods();
  }
}
