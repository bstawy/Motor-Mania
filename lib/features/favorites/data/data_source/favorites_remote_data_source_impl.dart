import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/crud_manager.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import 'favorites_data_sources.dart';

class FavoritesRemoteDataSourceImpl extends FavoritesDataSources {
  final CrudManager _crudManager;

  FavoritesRemoteDataSourceImpl(this._crudManager);

  @override
  Future<Response> getAllFavorites() async {
    return await _crudManager.get(EndPoints.allFavorites, tokenReq: true);
  }

  @override
  Future<Response> addToFavorites(HomeProductEntity product) async {
    Map<String, dynamic> params = {'id': product.id};

    return await _crudManager.post(
      EndPoints.addToFavorites,
      params: params,
      tokenReq: true,
    );
  }

  @override
  Future<Response> removeFromFavorites(String id) async {
    Map<String, dynamic> params = {'id': id};

    return await _crudManager.delete(
      EndPoints.removeFromFavorites,
      params: params,
      tokenReq: true,
    );
  }
}
