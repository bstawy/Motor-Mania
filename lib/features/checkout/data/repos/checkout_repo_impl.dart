import '../../../../core/networking/api_result.dart';
import '../../../cart/data/data_sources/cart_local_data_source.dart';
import '../../domain/repos/checkout_repo.dart';
import '../data_sources/checkout_remote_data_source.dart';
import '../models/order_data_model.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final CheckoutRemoteDataSource _remoteDataSource;
  final CartLocalDataSource _cartLocalDataSource;

  CheckoutRepoImpl(this._remoteDataSource, this._cartLocalDataSource);

  @override
  Future<ApiResult<void>> makeOrder(OrderDataModel orderData) async {
    final response = await _remoteDataSource.makeOrder(orderData);
    return response.fold(
      (failure) => Failure(failure.exception),
      (success) {
        // Clear the cart after a successful order
        _cartLocalDataSource.clearCart();
        return Success(null);
      },
    );
  }
}
