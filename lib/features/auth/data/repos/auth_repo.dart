import '../../../../core/caching/tokens_manager.dart';
import '../../../../core/errors/api_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../models/login_request_body_model.dart';
import '../models/register_request_body.dart';
import '../models/user_data_model.dart';

class AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepo(this._remoteDataSource);

  Future<ApiResult<void>> login(LoginRequestBodyModel requestBody) async {
    final response = await _remoteDataSource.login(requestBody);

    return response.fold(
      (failure) => Failure<void>(failure.exception),
      (success) async {
        return await _saveTokens(success.data.data['tokens']);
      },
    );
  }

  Future<ApiResult<void>> registerUser(
      RegisterRequestBodyModel requestBody) async {
    final response = await _remoteDataSource.register(requestBody);

    return response.fold(
      (failure) => Failure<void>(failure.exception),
      (success) async {
        return await _saveTokens(success.data.data['tokens']);
      },
    );
  }

  Future<ApiResult<void>> _saveTokens(Map<String, dynamic> tokens) async {
    final UserTokens userTokens = UserTokens.fromJson(tokens);

    if (userTokens.accessToken.isNotEmpty &&
        userTokens.refreshToken.isNotEmpty) {
      await TokensManager.setAccessToken(userTokens.accessToken);
      await TokensManager.setRefreshToken(userTokens.refreshToken);

      return Success<void>(null);
    } else {
      final CustomTypeError noTokensException = CustomTypeError(
        message: 'No tokens received from the server',
        runtime: 'LoginRepo',
        stackTrace: StackTrace.current,
      );
      return Failure<void>(noTokensException);
    }
  }
}
