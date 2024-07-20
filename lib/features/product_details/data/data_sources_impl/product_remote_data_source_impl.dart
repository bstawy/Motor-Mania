import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/crud_manager.dart';
import '../data_sources/product_remote_data_source.dart';

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final CrudManager _crudManager;

  ProductRemoteDataSourceImpl(this._crudManager);

  @override
  Future<Response> getProductDetails(String id) async {
    return await _crudManager.get(EndPoints.productDetails, params: {'id': id});
  }
}
