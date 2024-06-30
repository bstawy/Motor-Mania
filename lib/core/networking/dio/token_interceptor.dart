import 'package:dio/dio.dart';

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
      throw Exception("Access Token is empty");
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
        await updateAccessToken(refreshToken);
      } else {
        await logout();
      }
    }

    super.onError(err, handler);
  }

  Future<void> updateAccessToken(String refreshToken) async {
    final CrudManager crud = CrudManager.getInstance();

    final response = await crud
        .post(EndPoints.refreshToken, body: {"refresh_token": refreshToken});

    if (response.statusCode == 200) {
      final data = response.data;

      if (data["status"] == true) {
        await TokensManager.setAccessToken(data["data"]["access_token"]);
      } else {
        await logout();
      }
    } else {
      await logout();
    }
  }

  Future<void> logout() async {
    // TODO: show snackbar and use logout endpoint
    await TokensManager.setAccessToken("");
    await TokensManager.setRefreshToken("");
  }
}
