import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../repos/home_repo.dart';

class GetRecommendedProductsUseCase {
  final HomeRepo _homeRepo;

  GetRecommendedProductsUseCase(this._homeRepo);

  Future<ApiResult<List<ProductEntity>?>> call() async {
    return await _homeRepo.getRecommendedProducts();
  }
}
