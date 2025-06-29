import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/crud_manager.dart';
import '../../../../core/networking/generic_api_call.dart';
import 'search_data_sources.dart';

class SearchRemoteDataSourceImpl implements SearchDataSources {
  final CrudManager _crudManager;

  SearchRemoteDataSourceImpl(this._crudManager);

  @override
  Future<ApiResult<Response>> search(query) async {
    final Map<String, dynamic> params = {
      'query': query,
    };

    return await executeApiCall(() async {
      return await _crudManager.get(
        EndPoints.search,
        params: params,
      );
    });
  }
}
