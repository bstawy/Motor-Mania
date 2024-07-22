import 'package:dio/dio.dart';

abstract class SearchRemoteDataSource {
  Future<Response> search(query);
}
