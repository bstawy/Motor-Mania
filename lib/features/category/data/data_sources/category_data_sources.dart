import 'package:dio/dio.dart';

import '../../../../core/networking/api_result.dart';

abstract class CategoryDataSources {
  Future<ApiResult<Response>> getCategoryProducts(int categoryId);
}
