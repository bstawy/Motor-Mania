import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../data/models/add_car_model.dart';
import '../entities/car_brand_entity.dart';

abstract class CarBrandsRepo {
  Future<Either<ServerFailure, List<CarBrandEntity>>> getCarBrands();
  Future<Either<ServerFailure, bool>> addCar(AddCarModel car);
}
