import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/crud_manager.dart';
import '../../../../core/networking/generic_api_call.dart';
import 'product_data_sources.dart';

class ProductRemoteDataSourceImpl extends ProductDataSources {
  final CrudManager _crudManager;

  ProductRemoteDataSourceImpl(this._crudManager);

  @override
  Future<ApiResult<Response>> getProductDetails(int id) async {
    final Map<String, dynamic> params = {'id': id};

    return await executeApiCall(() async {
      return await _crudManager.get(EndPoints.productDetails, params: params);
    });
  }
}
