import 'package:motor_mania/features/product_details/domain/entities/product_entity.dart';

import '../../../../core/networking/api_result.dart';
import '../repos/cart_repo.dart';

class AddProductToCartUseCase {
  final CartRepo _cartRepo;

  AddProductToCartUseCase(this._cartRepo);

  Future<ApiResult<void>> call(ProductEntity product, int quantity) async {
    return await _cartRepo.addProduct(product, quantity);
  }
}
