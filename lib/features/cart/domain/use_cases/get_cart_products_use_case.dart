import '../../../../core/networking/api_result.dart';
import '../entities/cart_product_entity.dart';
import '../repos/cart_repo.dart';

class GetCartProductsUseCase {
  final CartRepo _cartRepository;

  GetCartProductsUseCase(this._cartRepository);

  Future<ApiResult<List<CartProductEntity>?>> call() async {
    return await _cartRepository.getCartProducts();
  }
}
