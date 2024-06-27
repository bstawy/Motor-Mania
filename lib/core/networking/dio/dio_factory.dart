import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'token_interceptor.dart';

class DioFactory {
  DioFactory._();

  static Dio? _freeDio;
  static Dio? _tokenDio;

  static Dio getFreeDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (_freeDio == null) {
      _freeDio = Dio();
      _freeDio!.options
        ..connectTimeout = timeOut
        ..receiveTimeout = timeOut;
      _addFreeDioInterceptors();
      return _freeDio!;
    } else {
      return _freeDio!;
    }
  }

  static Dio getTokenDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (_tokenDio == null) {
      _tokenDio = Dio();
      _tokenDio!.options
        ..connectTimeout = timeOut
        ..receiveTimeout = timeOut;
      _addTokenDioInterceptors();
      return _tokenDio!;
    } else {
      return _tokenDio!;
    }
  }

  static void _addFreeDioInterceptors() {
    _freeDio!.interceptors.addAll(
      [
        !kReleaseMode
            ? PrettyDioLogger(
                requestHeader: true,
                requestBody: true,
                responseBody: true,
                responseHeader: false,
              )
            : const Interceptor(),
      ],
    );
  }

  static void _addTokenDioInterceptors() {
    _tokenDio!.interceptors.addAll(
      [
        TokenInterceptor(),
        !kReleaseMode
            ? PrettyDioLogger(
                requestHeader: true,
                requestBody: true,
                responseBody: true,
                responseHeader: false,
              )
            : const Interceptor(),
      ],
    );
  }
}
