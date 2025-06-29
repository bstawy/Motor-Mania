import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../config/constants/api_constants.dart';
import 'token_interceptor.dart';

class DioFactory {
  DioFactory._();

  static Dio? _freeDio;
  static Dio? _tokenDio;

  static Dio getFreeDio() {
    Duration timeOut = const Duration(seconds: 60);

    if (_freeDio == null) {
      _freeDio = Dio();
      _freeDio!.options
        ..baseUrl = ApiConstants.localHostBaseUrl
        ..connectTimeout = timeOut
        ..receiveTimeout = timeOut
        ..validateStatus = (statusCode) {
          return statusCode! <= 500;
        };

      _addFreeDioInterceptors();
      return _freeDio!;
    } else {
      return _freeDio!;
    }
  }

  static Dio getTokenDio() {
    Duration timeOut = const Duration(seconds: 60);

    if (_tokenDio == null) {
      _tokenDio = Dio();
      _tokenDio!.options
        ..baseUrl = ApiConstants.localHostBaseUrl
        ..connectTimeout = timeOut
        ..receiveTimeout = timeOut
        ..validateStatus = (statusCode) {
          return statusCode! <= 500;
        };
      _addTokenDioInterceptors();
      return _tokenDio!;
    } else {
      return _tokenDio!;
    }
  }

  static void _addFreeDioInterceptors() {
    _freeDio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        enabled: !kReleaseMode,
      ),
    );
  }

  static void _addTokenDioInterceptors() {
    _tokenDio!.interceptors.addAll(
      [
        TokenInterceptor(),
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          enabled: !kReleaseMode,
        ),
      ],
    );
  }
}
