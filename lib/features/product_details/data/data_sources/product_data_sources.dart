import 'package:dio/dio.dart';

abstract class ProductDataSources {
  Future<Response> getProductDetails(String id);
}
