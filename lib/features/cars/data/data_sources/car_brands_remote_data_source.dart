import 'package:dio/dio.dart';

abstract class CarBrandsRemoteDataSource {
  Future<Response> getCarBrands();
  Future<Response> getCarBrandModels(int brandId);
}
