import 'package:dio/dio.dart';

abstract class ProductDataSources {
  Future<Response> getProductDetails(int id);
}
