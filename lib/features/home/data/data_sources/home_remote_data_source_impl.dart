import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/crud_manager.dart';
import 'home_data_sources.dart';

class HomeRemoteDataSourceImpl extends HomeDataSources {
  final CrudManager _crudManager;

  HomeRemoteDataSourceImpl(this._crudManager);

  @override
  Future<Response> getUserCar() async {
    return await _crudManager.get(EndPoints.userSelectedCar, tokenReq: true);
  }

  @override
  Future<Response> getHomeCategories() async {
    return await _crudManager.get(EndPoints.allCategories);
  }

  @override
  Future<Response> getHomeProducts() async {
    return await _crudManager.get(EndPoints.allProducts);
  }
}
