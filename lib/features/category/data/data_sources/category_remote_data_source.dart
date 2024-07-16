import 'package:dio/dio.dart';

abstract class CategoryRemoteDataSource {
  Future<Response> getCategoryProducts(int categoryId);
}
