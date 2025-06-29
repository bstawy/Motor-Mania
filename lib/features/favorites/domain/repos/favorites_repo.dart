import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';

abstract class FavoritesRepo {
  Future<ApiResult<List<ProductEntity>?>> getAllFavorites();
  Future<ApiResult<void>> addToFavorites(ProductEntity product);
  Future<ApiResult<void>> removeFromFavorites(int id);
}
