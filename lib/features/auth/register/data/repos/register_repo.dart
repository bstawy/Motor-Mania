import 'package:dartz/dartz.dart';

import '../../../../../core/caching/tokens_manager.dart';
import '../data_sources/register_remote_data_source.dart';
import '../models/register_request_body.dart';

class RegisterRepo {
  final RegisterRemoteDataSource _remoteDataSource;
  RegisterRepo(this._remoteDataSource);

  Future<Either<String, String>> registerUser(
      RegisterRequestBodyModel requestBody) async {
    final response = await _remoteDataSource.register(requestBody);

    return response.fold(
      (l) => Left(l),
      (userData) {
        final userTokens = userData.tokens;
        if (userTokens.accessToken.isNotEmpty &&
            userTokens.refreshToken.isNotEmpty) {
          TokensManager.setAccessToken(userTokens.accessToken);
          TokensManager.setRefreshToken(userTokens.refreshToken);

          return const Right('Registered successfully');
        }
        return const Left('Tokens are empty.');
      },
    );
  }
}
