import '../../../../core/networking/api_result.dart';
import '../repos/cart_repo.dart';

class RemoveProductFromCartUseCase {
  final CartRepo _cartRepo;

  RemoveProductFromCartUseCase(this._cartRepo);

  Future<ApiResult<void>> call(int productId) async {
    return _cartRepo.removeProduct(productId);
  }
}
