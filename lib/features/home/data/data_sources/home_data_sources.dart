import 'package:dio/dio.dart';
import 'package:motor_mania/core/helpers/enums/switch_enum.dart';

abstract class HomeDataSources {
  Future<Response> getUserCar();
  Future<Response> switchCar(SwitchEnum switchValue);
  Future<Response> getHomeCategories();
  Future<Response> getHomeProducts();
  Future<Response> getHomeOffers();
}
