import '../../../../core/networking/api_result.dart';
import '../entities/car_brand_model_entity.dart';
import '../repos/car_brands_repo.dart';

class GetCarBrandModelsUseCase {
  final CarBrandsRepo _carBrandRepo;

  GetCarBrandModelsUseCase(this._carBrandRepo);
  Future<ApiResult<List<CarBrandModelEntity>?>> call(int brandId) async {
    return await _carBrandRepo.getCarBrandModels(brandId);
  }
}
