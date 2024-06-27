import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // TODO: Implement token interceptor
    // String mytoken =
    //     await SecureStorage.getInstance().read(key: Token.userToken.value) ??
    //         "";
    // if (mytoken.isNotEmpty) {
    //   options.headers["Authorization"] = "Bearer $mytoken";
    // } else {
    //   throw Exception("=====================================\nToken is empty");
    // }
    super.onRequest(options, handler);
  }
}
