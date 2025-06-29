import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/crud_manager.dart';
import '../../../../core/networking/generic_api_call.dart';
import 'home_data_sources.dart';

class HomeRemoteDataSourceImpl extends HomeDataSources {
  final CrudManager _crudManager;

  HomeRemoteDataSourceImpl(this._crudManager);

  @override
  Future<ApiResult<Response>> getOffers() async {
    return await executeApiCall(() async {
      return await _crudManager.get(EndPoints.homeOffers, tokenReq: true);
    });
  }

  @override
  Future<ApiResult<Response>> getCategories() async {
    return await executeApiCall(() async {
      return await _crudManager.get(EndPoints.allCategories);
    });
  }

  @override
  Future<ApiResult<Response>> getProducts() async {
    return await executeApiCall(() async {
      return await _crudManager.get(EndPoints.allProducts);
    });
  }
}
