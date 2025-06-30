import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';
import '../../caching/tokens_manager.dart';
import '../../config/app_manager/app_manager_cubit.dart';
import '../../config/constants/api_constants.dart';
import '../../config/routing/routes.dart';
import '../../di/dependency_injection.dart';
import '../../helpers/extensions/navigation_ext.dart';
import '../crud_manager.dart';
import 'dio_factory.dart';

class TokenInterceptor extends Interceptor {
  static bool _isRefreshing = false;
  static final _completer = Completer<void>();

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
    super.onRequest(options, handler);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) async {
  //   if (response.statusCode == 401) {
  //     debugPrint("=====================================");
  //     debugPrint("Token expired");
  //     String refreshToken = await TokensManager.getRefreshToken() ?? "";

  //     if (refreshToken.isNotEmpty) {
  //       if (await _refreshTokens()) {
  //         final Dio dio = DioFactory.getTokenDio();

  //         response.requestOptions.headers['Authorization'] =
  //             TokensManager.getAccessToken();

  //         final opts = Options(
  //           method: response.requestOptions.method,
  //           headers: response.requestOptions.headers,
  //         );

  //         await dio.request(
  //           response.requestOptions.path,
  //           options: opts,
  //           data: response.requestOptions.data,
  //           queryParameters: response.requestOptions.queryParameters,
  //         );
  //       }
  //     } else {
  //       await logout();
  //     }
  //   }
  //   super.onResponse(response, handler);
  // }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final Dio dio = DioFactory.getTokenDio();

      String refreshToken = await TokensManager.getRefreshToken() ?? "";

      if (refreshToken.isEmpty) {
        await logout();
        return handler.reject(err);
      }

      if (!_isRefreshing) {
        _isRefreshing = true;
        try {
          await _refreshTokens();
          _completer.complete();
        } catch (e) {
          // Refresh failed, logout
          await logout();
          _completer.completeError(e);
          return handler.reject(err);
        } finally {
          _isRefreshing = false;
        }
      } else {
        // Refresh in progress, wait for it to complete
        await _completer.future;
      }

      // Retry the original request with the new token
      err.requestOptions.headers["Authorization"] =
          "Bearer ${await TokensManager.getAccessToken()}";
      return handler.resolve(await dio.fetch(err.requestOptions));
    }
    super.onError(err, handler);
  }

  Future<void> _refreshTokens() async {
    try {
      final String refreshToken = await TokensManager.getRefreshToken() ?? "";

      if (refreshToken.isEmpty) {
        throw Exception("Refresh token is empty");
      }
      final CrudManager crud = getIt<CrudManager>();

      final response = await crud
          .post(EndPoints.refreshToken, body: {"refresh_token": refreshToken});

      if (response.statusCode != 200) {
        throw Exception("Failed to refresh tokens");
      }
      await TokensManager.setAccessToken(response.data["data"]["access_token"]);
      await TokensManager.setRefreshToken(
          response.data["data"]["refresh_token"]);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    // TODO: refactor this
    navigatorKey.currentState?.context.read<AppManagerCubit>().logUserOut();
    navigatorKey.currentState?.context.pushNamedAndRemoveUntil(
      Routes.layoutScreen,
      predicate: (route) => false,
    );
  }
}
