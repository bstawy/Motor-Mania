import '../config/constants/caching_constants.dart';
import 'secure_storage_factory.dart';

class TokensManager {
  static Future<String?> getAccessToken() async {
    String? accessToken =
        await SecureStorageFactory.read(TokensConstants.accessToken);

    return accessToken;
  }

  static Future<String?> getRefreshToken() async {
    String? refreshToken =
        await SecureStorageFactory.read(TokensConstants.refreshToken);

    return refreshToken;
  }

  static Future<void> setAccessToken(String accessToken) async {
    await SecureStorageFactory.write(
      key: TokensConstants.accessToken,
      value: accessToken,
    );
  }

  static Future<void> setRefreshToken(String refreshToken) async {
    await SecureStorageFactory.write(
      key: TokensConstants.refreshToken,
      value: refreshToken,
    );
  }

  static Future<void> deleteAccessToken() async {
    await SecureStorageFactory.delete(TokensConstants.accessToken);
  }

  static Future<void> deleteRefreshToken() async {
    await SecureStorageFactory.delete(TokensConstants.refreshToken);
  }

  static Future<void> deleteTokens() async {
    await deleteAccessToken();
    await deleteRefreshToken();
  }
}
