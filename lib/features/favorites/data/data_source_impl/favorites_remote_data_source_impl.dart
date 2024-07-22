import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/crud_manager.dart';
import '../data_source/favorites_remote_data_source.dart';

class FavoritesRemoteDataSourceImpl extends FavoritesRemoteDataSource {
  final CrudManager _crudManager;

  FavoritesRemoteDataSourceImpl(this._crudManager);

  @override
  Future<Response> getAllFavorites() async {
    return await _crudManager.get(EndPoints.allFavorites, tokenReq: true);
  }

  @override
  Future<Response> addToFavorites(String id) async {
    Map<String, dynamic> params = {'id': id};

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
