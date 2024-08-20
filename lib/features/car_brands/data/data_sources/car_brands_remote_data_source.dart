import 'package:dio/dio.dart';

import '../models/add_car_model.dart';

abstract class CarBrandsRemoteDataSource {
  Future<Response> getCarBrands();
  Future<Response> addCar(AddCarModel car);
}
