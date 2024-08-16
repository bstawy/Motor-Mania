import 'package:dio/dio.dart';

import '../../../home/domain/entities/home_product_entity.dart';

abstract class FavoritesDataSources {
  Future<Response> getAllFavorites();
  Future<Response> addToFavorites(HomeProductEntity product);
  Future<Response> removeFromFavorites(String id);
}
