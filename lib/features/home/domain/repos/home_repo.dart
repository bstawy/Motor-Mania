import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../entities/category_entity.dart';
import '../entities/offer_entity.dart';

abstract class HomeRepo {
  Future<ApiResult<List<CategoryEntity>?>> getHomeCategories();
  Future<ApiResult<List<ProductEntity>?>> getHomeProducts();
  Future<ApiResult<List<OfferEntity>?>> getHomeOffers();
}
