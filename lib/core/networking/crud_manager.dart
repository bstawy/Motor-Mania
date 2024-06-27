import 'package:dio/dio.dart';

class CrudManager {
  CrudManager._();
  static CrudManager? _instance;
  static Dio? _dio;

  static getInstance(Dio dio) {
    if (_instance == null) {
      _dio = dio;
      _instance = CrudManager._();
      return _instance;
    } else {
      return _instance;
    }
  }

  Future<T> get<T>(
    String endPoint, {
    Map<String, dynamic>? body,
    dynamic param,
  }) async {
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

  Future<void> post(
    String endPoint, {
    Map<String, dynamic>? body,
    dynamic param,
  }) async {
    try {
      final response = await _dio!.post(
        endPoint,
        data: body,
        queryParameters: param,
      );

      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Failed to create record');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update() async {
    // Update a record
  }

  Future<void> delete() async {
    // Delete a record
  }
}
