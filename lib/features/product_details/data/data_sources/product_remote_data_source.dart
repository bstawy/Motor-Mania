import 'package:dio/dio.dart';

abstract class ProductRemoteDataSource {
  Future<Response> getProductDetails(String id);
}
