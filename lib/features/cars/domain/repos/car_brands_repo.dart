import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../entities/car_brand_entity.dart';

abstract class CarBrandsRepo {
  Future<Either<ServerFailure, List<CarBrandEntity>>> getCarBrands();
}
