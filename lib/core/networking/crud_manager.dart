import 'package:dio/dio.dart';

class CrudManager {
  CrudManager._();
  static CrudManager? _instance;
  static Dio? _dio;

  static getInstance(Dio dio) {
    if (_instance == null) {
      _dio = dio;
      _instance = CrudManager._();
    } else {
      return _instance;
    }
  }

  Future<T> get<T>(String endPoint,
      {Map<String, dynamic>? body, dynamic param}) async {
    try {
      final response = await _dio!.get(
        endPoint,
        data: body,
        queryParameters: param,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> read() async {
    // Read a record
  }

  Future<void> update() async {
    // Update a record
  }

  Future<void> delete() async {
    // Delete a record
  }
}
