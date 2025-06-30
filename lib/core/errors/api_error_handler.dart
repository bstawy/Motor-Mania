import 'package:dio/dio.dart';

import 'api_error_model.dart';
import 'api_exceptions.dart';
import 'local_error_exception.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(Exception error) {
    if (error is DioException) {
      return _handleDioException(error);
    } else if (error is LocalErrorException) {
      return ApiErrorModel(message: error.message);
    } else if (error is CustomNetworkErrorException) {
      return ApiErrorModel(message: error.message);
    } else if (error is CustomTypeError) {
      return ApiErrorModel(message: error.message);
    } else {
      return ApiErrorModel(
        message: error.toString(),
      );
    }
  }

  static ApiErrorModel _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionError:
        return ApiErrorModel(message: "Connection to server failed");
      case DioExceptionType.cancel:
        return ApiErrorModel(message: "Request to the server was cancelled");
      case DioExceptionType.connectionTimeout:
        return ApiErrorModel(message: "Connection timeout with the server");
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(
            message: "Receive timeout in connection with the server");
      case DioExceptionType.sendTimeout:
        return ApiErrorModel(
            message: "Send timeout in connection with the server");
      case DioExceptionType.unknown:
        return ApiErrorModel(
            message:
                "Connection to the server failed due to internet connection");
      case DioExceptionType.badResponse:
        return _handleError(
          error.response?.statusCode,
          error.response?.data,
        );
      default:
        return ApiErrorModel(message: "Something went wrong");
    }
  }

  static ApiErrorModel _handleError(int? statusCode, dynamic data) {
    try {
      final error = ApiErrorModel(
        statusCode: data['code'] ?? statusCode,
        message: data['message'] ??
            "An unexpected error occurred. Please try again later.",
        data: data['stack'],
      );
      return error;
    } catch (e) {
      return ApiErrorModel(
        statusCode: statusCode,
        message: "An error occurred",
      );
    }
  }
}
