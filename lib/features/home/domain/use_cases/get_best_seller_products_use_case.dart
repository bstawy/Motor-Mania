import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../repos/home_repo.dart';

class GetBestSellerProductsUseCase {
  final HomeRepo _homeRepo;

  GetBestSellerProductsUseCase(this._homeRepo);

  Future<ApiResult<List<ProductEntity>?>> call() async {
    return await _homeRepo.getBestSellerProducts();
  }
}
