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
        final UserData userData = UserData.fromJson(success.data.data['data']);
        return await _saveTokens(userData.tokens);
      },
    );
  }

  Future<ApiResult<void>> registerUser(
      RegisterRequestBodyModel requestBody) async {
    final response = await _remoteDataSource.register(requestBody);

    return response.fold(
      (failure) => Failure<void>(failure.exception),
      (success) async {
        final UserData userData = UserData.fromJson(success.data.data['data']);
        return await _saveTokens(userData.tokens);
      },
    );
  }

  Future<ApiResult<void>> _saveTokens(UserTokens tokens) async {
    if (tokens.accessToken.isNotEmpty && tokens.refreshToken.isNotEmpty) {
      await TokensManager.setAccessToken(tokens.accessToken);
      await TokensManager.setRefreshToken(tokens.refreshToken);

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
