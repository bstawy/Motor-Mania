import '../../../../core/networking/api_result.dart';
import '../../data/models/order_data_model.dart';

abstract class CheckoutRepo {
  Future<ApiResult<void>> makeOrder(OrderDataModel orderData);
}
