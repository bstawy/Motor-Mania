import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/crud_manager.dart';
import '../../../../core/networking/generic_api_call.dart';
import 'category_data_sources.dart';

class CategoryRemoteDataSourceImpl extends CategoryDataSources {
  final CrudManager _crudManager;

  CategoryRemoteDataSourceImpl(this._crudManager);

  @override
  Future<ApiResult<Response>> getCategoryProducts(int categoryId) async {
    final queryParam = {
      'categoryId': categoryId,
    };

    return await executeApiCall(() async {
      return await _crudManager.get(
        EndPoints.categoryProducts,
        params: queryParam,
      );
    });
  }
}
