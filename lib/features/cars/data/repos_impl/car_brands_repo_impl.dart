import '../../../../core/networking/api_result.dart';
import '../../domain/entities/car_brand_entity.dart';
import '../../domain/entities/car_brand_model_entity.dart';
import '../../domain/repos/car_brands_repo.dart';
import '../data_sources/car_brands_remote_data_source.dart';
import '../models/car_brand_model.dart';
import '../models/car_brand_model_model.dart';

class CarBrandsRepoImpl extends CarBrandsRepo {
  final CarsBrandsRemoteDataSource _remoteDataSource;

  CarBrandsRepoImpl(this._remoteDataSource);

  @override
  Future<ApiResult<List<CarBrandEntity>?>> getCarBrands() async {
    final response = await _remoteDataSource.getCarBrands();

    return response.fold(
      (failure) => Failure(failure.exception),
      (success) {
        final jsonBrands = success.data.data['data'];

        final List<CarBrandEntity> carBrands = (jsonBrands as List)
            .map((carBrand) => CarBrandModel.fromJson(carBrand))
            .toList();

        return Success(carBrands);
      },
    );
  }

  @override
  Future<ApiResult<List<CarBrandModelEntity>?>> getCarBrandModels(
      int brandId) async {
    final response = await _remoteDataSource.getCarBrandModels(brandId);

    return response.fold(
      (failure) => Failure(failure.exception),
      (success) {
        final jsonBrandModels = success.data.data['data'];

        final List<CarBrandModelEntity> brandModels = (jsonBrandModels as List)
            .map((carBrand) => CarBrandModelModel.fromJson(carBrand))
            .toList();

        return Success(brandModels);
      },
    );
  }
}
