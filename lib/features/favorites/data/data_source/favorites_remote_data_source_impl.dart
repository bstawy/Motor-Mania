import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/crud_manager.dart';
import '../../../../core/networking/generic_api_call.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import 'favorites_data_sources.dart';

class FavoritesRemoteDataSourceImpl extends FavoritesDataSources {
  final CrudManager _crudManager;

  FavoritesRemoteDataSourceImpl(this._crudManager);

  @override
  Future<ApiResult<Response>> getAllFavorites() async {
    return await executeApiCall(() async {
      return await _crudManager.get(
        EndPoints.allFavorites,
        tokenReq: true,
      );
    });
  }

  @override
  Future<ApiResult<Response>> addToFavorites(ProductEntity product) async {
    Map<String, dynamic> params = {'id': product.id};

    return await executeApiCall(() async {
      return await _crudManager.post(
        EndPoints.addToFavorites,
        params: params,
        tokenReq: true,
      );
    });
  }

  @override
  Future<ApiResult<Response>> removeFromFavorites(int id) async {
    Map<String, dynamic> params = {'id': id};

    return await executeApiCall(() async {
      return await _crudManager.delete(
        EndPoints.removeFromFavorites,
        params: params,
      );
    });
  }
}
