import 'package:dio/dio.dart';

abstract class FavoritesRemoteDataSource {
  Future<Response> getAllFavorites();
  Future<Response> addToFavorites(String id);
  Future<Response> removeFromFavorites(String id);
}
