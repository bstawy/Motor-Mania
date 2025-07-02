import '../../../../core/networking/api_result.dart';
import '../../data/models/order_data_model.dart';
import '../repos/checkout_repo.dart';

class MakeOrderUseCase {
  final CheckoutRepo _checkoutRepo;

  MakeOrderUseCase(this._checkoutRepo);

  Future<ApiResult<void>> call(OrderDataModel orderData) async {
    return await _checkoutRepo.makeOrder(orderData);
  }
}
