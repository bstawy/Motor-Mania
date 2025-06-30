import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../di/dependency_injection.dart';
import '../errors/api_exceptions.dart';
import 'api_result.dart';
import 'connectivity_service.dart';

Future<ApiResult<T>> executeApiCall<T>(Future<T> Function() apiCall) async {
  try {
    final isConnected = await getIt<ConnectivityService>().checkConnection();

    if (!isConnected) {
      throw CustomNetworkErrorException();
    }

    final data = await apiCall();
    return Success<T>(data);
  } on CustomNetworkErrorException catch (networkError) {
    _printError(
      networkError.message,
      name: 'CustomNetworkErrorException',
      error: networkError,
      stackTrace: StackTrace.current,
    );

    return Failure<T>(networkError);
  } on DioException catch (dioError) {
    _printError(
      dioError.toString(),
      name: 'DioException',
      error: dioError,
      stackTrace: StackTrace.current,
    );

    return Failure<T>(dioError);
  } on Exception catch (e) {
    _printError(
      e.toString(),
      name: 'Exception',
      error: e,
      stackTrace: StackTrace.current,
    );

    return Failure<T>(e);
  } on TypeError catch (e) {
    _printError(
      e.toString(),
      name: 'TypeError',
      error: e,
      stackTrace: StackTrace.current,
    );

    return Failure<T>(
      CustomTypeError(
        message: e.toString(),
        runtime: e.runtimeType.toString(),
        stackTrace: StackTrace.current,
      ),
    );
  } catch (e) {
    _printError(
      e.toString(),
      name: 'Catch',
      error: e,
      stackTrace: StackTrace.current,
    );

    final Exception exception = Exception(e.toString());
    return Failure<T>(exception);
  }
}

void _printError(
  String message, {
  String? name,
  Object? error,
  StackTrace? stackTrace,
}) {
  if (!kReleaseMode) {
    log(
      message,
      name: name ?? 'Error',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
