import 'package:dio/dio.dart';

import '../../../../core/networking/api_result.dart';

abstract class SearchDataSources {
  Future<ApiResult<Response>> search(query);
}
