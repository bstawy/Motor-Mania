import 'package:dio/dio.dart';

class CrudManager {
  CrudManager._();
  static CrudManager? _instance;
  static Dio? _freeDio;
  static Dio? _tokenDio;

  static getInstance({Dio? freeDio, Dio? tokenDio}) {
    if (_instance == null) {
      _freeDio = freeDio;
      _tokenDio = tokenDio;
      _instance = CrudManager._();
      return _instance;
    } else {
      return _instance;
    }
  }

  Future<Response> get(
    String endPoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    bool tokenReq = false,
  }) async {
    try {
      final dio = tokenReq ? _tokenDio : _freeDio;

      final response = await dio!.get(
        endPoint,
        data: body,
        queryParameters: params,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String endPoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    bool tokenReq = false,
  }) async {
    try {
      final dio = tokenReq ? _tokenDio : _freeDio;

      final response = await dio!.post(
        endPoint,
        data: body,
        queryParameters: params,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update() async {
    // TODO: Update a record
  }

  Future<Response> delete(
    String endPoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    bool tokenReq = false,
  }) async {
    try {
      final dio = tokenReq ? _tokenDio : _freeDio;

      final response = await dio!.delete(
        endPoint,
        data: body,
        queryParameters: params,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
