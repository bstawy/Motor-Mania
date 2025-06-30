import 'package:dio/dio.dart';

import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';

abstract class FavoritesDataSources {
  Future<ApiResult<Response>> getAllFavorites();
  Future<ApiResult<Response>> addToFavorites(ProductEntity product);
  Future<ApiResult<Response>> removeFromFavorites(int id);
}
