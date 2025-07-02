import '../../../../core/networking/api_result.dart';
import '../../data/models/new_payment_method_model.dart';
import '../repos/payment_methods_repo.dart';

class AddNewPaymentMethodUseCase {
  final PaymentMethodsRepo _repository;

  AddNewPaymentMethodUseCase(this._repository);

  Future<ApiResult<void>> call(NewPaymentMethodModel newPaymentMethod) async {
    return await _repository.addPaymentMethod(newPaymentMethod);
  }
}
