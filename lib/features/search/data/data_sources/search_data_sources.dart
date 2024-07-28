import 'package:dio/dio.dart';

abstract class SearchDataSources {
  Future<Response> search(query);
}
