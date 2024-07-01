import 'package:dartz/dartz.dart';

import '../../../../../core/caching/tokens_manager.dart';
import '../data_sources/login_remote_data_source.dart';
import '../models/login_request_body_model.dart';

class LoginRepo {
  final LoginRemoteDataSource _dataSource;

  LoginRepo(this._dataSource);

  Future<Either<String, String>> login(
      LoginRequestBodyModel requestBody) async {
    try {
      final userData = await _dataSource.login(requestBody);

      if (userData.accessToken.isNotEmpty && userData.refreshToken.isNotEmpty) {
        TokensManager.setAccessToken(userData.accessToken);
        TokensManager.setRefreshToken(userData.refreshToken);

        return const Right('Login successful');
      }
      throw ('Tokens are empty.');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
