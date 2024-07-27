import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/crud_manager.dart';
import 'category_remote_data_source.dart';

class CategoryRemoteDataSourceImpl extends CategoryDataSources {
  final CrudManager _crudManager;

  CategoryRemoteDataSourceImpl(this._crudManager);

  @override
  Future<Response> getCategoryProducts(int categoryId) async {
    final queryParam = {
      'id': categoryId,
    };

    return await _crudManager.get(
      EndPoints.categoryProducts,
      params: queryParam,
    );
  }
}
