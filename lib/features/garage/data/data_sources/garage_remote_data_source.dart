import 'package:dio/dio.dart';

abstract class GarageRemoteDataSource {
  Future<Response> getGarageCars();
  Future<Response> selectCar(int carId);
}
