import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../caching/tokens_manager.dart';
import '../../config/app_manager/app_manager_cubit.dart';
import '../../config/constants/api_constants.dart';
import '../../di/dependency_injection.dart';
import '../crud_manager.dart';
import 'dio_factory.dart';

class TokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String accessToken = await TokensManager.getAccessToken() ?? "";
    if (accessToken.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $accessToken";
    } else {
      options.headers["Authorization"] = "";
    }
    debugPrint("Access Token: $accessToken");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401 &&
        response.data['message'] == "Token expired") {
      String refreshToken = await TokensManager.getRefreshToken() ?? "";

      if (refreshToken.isNotEmpty) {
        if (await updateAccessToken(refreshToken)) {
          final Dio dio = DioFactory.getTokenDio();

          response.requestOptions.headers['Authorization'] =
              TokensManager.getAccessToken();

          final opts = Options(
            method: response.requestOptions.method,
            headers: response.requestOptions.headers,
          );

          await dio.request(
            response.requestOptions.path,
            options: opts,
            data: response.requestOptions.data,
            queryParameters: response.requestOptions.queryParameters,
          );
        }
      } else {
        await logout();
      }
    }
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final Dio dio = DioFactory.getTokenDio();

      String refreshToken = await TokensManager.getRefreshToken() ?? "";

      if (refreshToken.isNotEmpty) {
        if (await updateAccessToken(refreshToken)) {
          err.requestOptions.headers['Authorization'] =
              'Bearer ${TokensManager.getAccessToken()}';
          err.requestOptions.method = err.requestOptions.method;

          return handler.resolve(await dio.fetch(err.requestOptions));
        }
      } else {
        await logout();
      }
    }
    super.onError(err, handler);
  }

  Future<bool> updateAccessToken(String refreshToken) async {
    final CrudManager crud = getIt<CrudManager>();

    final response = await crud
        .post(EndPoints.refreshToken, body: {"refresh_token": refreshToken});

    if (response.statusCode == 200) {
      final data = response.data;

      if (data["success"] == true) {
        await TokensManager.setAccessToken(data["data"]["access_token"]);
        await TokensManager.setRefreshToken(data["data"]["refresh_token"]);
        return true;
      } else {
        await logout();
        return false;
      }
    } else {
      await logout();
      return false;
    }
  }

  Future<void> logout() async {
    final AppManagerCubit appManagerCubit = AppManagerCubit();
    appManagerCubit.logUserOut();
  }
}
