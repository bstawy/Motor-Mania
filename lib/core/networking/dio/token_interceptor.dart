import 'package:dio/dio.dart';
import 'package:motor_mania/core/networking/dio/dio_factory.dart';

import '../../caching/tokens_manager.dart';
import '../../config/constants/api_constants.dart';
import '../crud_manager.dart';

class TokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String accessToken = await TokensManager.getAccessToken() ?? "";

    if (accessToken.isNotEmpty) {
      options.headers["Authorization"] = accessToken;
    } else {
      throw Exception(
          "================================\nAccess Token is empty");
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      String refreshToken = await TokensManager.getRefreshToken() ?? "";

      if (refreshToken.isNotEmpty) {
        if (await updateAccessToken(refreshToken)) {
          final Dio dio = DioFactory.getFreeDio();

          err.requestOptions.headers['Authorization'] =
              TokensManager.getAccessToken();

          final opts = Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          );

          await dio.request(
            err.requestOptions.path,
            options: opts,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );
        }
      } else {
        await logout();
      }
    }
    super.onError(err, handler);
  }

  Future<bool> updateAccessToken(String refreshToken) async {
    final CrudManager crud = CrudManager.getInstance();

    final response = await crud
        .post(EndPoints.refreshToken, body: {"refresh_token": refreshToken});

    if (response.statusCode == 200) {
      final data = response.data;

      if (data["status"] == true) {
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
    // TODO: show snackbar and use logout endpoint
    await TokensManager.setAccessToken("");
    await TokensManager.setRefreshToken("");
  }
}
