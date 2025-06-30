import '../../../../core/networking/api_result.dart';
import '../entities/product_entity.dart';

abstract class ProductRepo {
  Future<ApiResult<ProductEntity?>> getProductDetails(int id);
}
