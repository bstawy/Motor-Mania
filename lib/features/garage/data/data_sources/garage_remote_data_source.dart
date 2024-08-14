import 'package:dio/dio.dart';

abstract class GarageRemoteDataSource {
  Future<Response> getGarageCars();
}
