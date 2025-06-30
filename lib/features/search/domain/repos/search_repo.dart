import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';

abstract class SearchRepo {
  Future<ApiResult<List<ProductEntity>?>> search(String query);
}
