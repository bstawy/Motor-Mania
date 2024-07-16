import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/crud_manager.dart';
import '../data_sources/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
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
