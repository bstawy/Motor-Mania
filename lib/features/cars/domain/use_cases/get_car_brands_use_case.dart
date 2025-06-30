import '../../../../core/networking/api_result.dart';
import '../entities/car_brand_entity.dart';
import '../repos/car_brands_repo.dart';

class GetCarBrandsUseCase {
  final CarBrandsRepo _carBrandsRepo;

  GetCarBrandsUseCase(this._carBrandsRepo);

  Future<ApiResult<List<CarBrandEntity>?>> call() async {
    return await _carBrandsRepo.getCarBrands();
  }
}
