import 'package:dio/dio.dart';

import '../models/add_car_model.dart';

abstract class GarageRemoteDataSource {
  Future<Response> getGarageCars();
  Future<Response> selectCar(int carId);
  Future<Response> addCar(AddCarModel car);
  Future<Response> removeCar(int carId);
}
