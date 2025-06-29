import '../../../../core/helpers/enums/switch_enum.dart';
import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../entities/car_entity.dart';
import '../entities/category_entity.dart';
import '../entities/offer_entity.dart';

abstract class HomeRepo {
  Future<ApiResult<CarEntity?>> getUserCar();
  Future<ApiResult<CarEntity?>> switchCar(SwitchEnum switchValue);
  Future<ApiResult<List<CategoryEntity>?>> getHomeCategories();
  Future<ApiResult<List<ProductEntity>?>> getHomeProducts();
  Future<ApiResult<List<OfferEntity>?>> getHomeOffers();
}
