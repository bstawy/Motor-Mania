import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';

abstract class CategoryRepository {
  Future<ApiResult<List<ProductEntity>?>> getCategoryProducts(int categoryId);
}
