import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../entities/car_brand_entity.dart';
import '../repos/car_brands_repo.dart';

class GetCarBrandsUseCase {
  final CarBrandsRepo _carBrandsRepo;

  GetCarBrandsUseCase(this._carBrandsRepo);

  Future<Either<ServerFailure, List<CarBrandEntity>>> call() async {
    return await _carBrandsRepo.getCarBrands();
  }
}
