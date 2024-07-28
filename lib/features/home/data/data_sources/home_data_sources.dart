import 'package:dio/dio.dart';

abstract class HomeDataSources {
  Future<Response> getUserCar();
  Future<Response> getHomeCategories();
  Future<Response> getHomeProducts();
}
