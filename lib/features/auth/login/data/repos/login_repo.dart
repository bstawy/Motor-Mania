import 'package:dartz/dartz.dart';

import '../../../../../core/caching/secure_storage_factory.dart';
import '../../../../../core/config/constants/caching_constants.dart';
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
        SecureStorageFactory.getInstance().write(
            key: TokensConstants.accessToken, value: userData.accessToken);
        SecureStorageFactory.getInstance().write(
            key: TokensConstants.refreshToken, value: userData.refreshToken);

        return const Right('Login successful');
      }
      throw ('Tokens are empty.');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
