import 'package:dio/dio.dart';

abstract class FavoritesDataSources {
  Future<Response> getAllFavorites();
  Future<Response> addToFavorites(String id);
  Future<Response> removeFromFavorites(String id);
}
