import 'package:dio/dio.dart';

abstract class CategoryDataSources {
  Future<Response> getCategoryProducts(int categoryId);
}
