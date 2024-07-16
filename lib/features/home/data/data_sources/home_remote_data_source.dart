import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource {
  Future<Response> getUserCar();
  Future<Response> getHomeCategories();
  Future<Response> getHomeProducts();
}
