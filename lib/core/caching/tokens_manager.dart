import '../config/constants/app_constants.dart';
import 'secure_storage_factory.dart';

class TokensManager {
  static Future<String?> getAccessToken() async {
    String? accessToken =
        await SecureStorageFactory.read(TokensKeys.accessToken);

    return accessToken;
  }

  static Future<String?> getRefreshToken() async {
    String? refreshToken =
        await SecureStorageFactory.read(TokensKeys.refreshToken);

    return refreshToken;
  }

  static Future<void> setAccessToken(String accessToken) async {
    await SecureStorageFactory.write(
      key: TokensKeys.accessToken,
      value: accessToken,
    );
  }

  static Future<void> setRefreshToken(String refreshToken) async {
    await SecureStorageFactory.write(
      key: TokensKeys.refreshToken,
      value: refreshToken,
    );
  }

  static Future<void> deleteAccessToken() async {
    await SecureStorageFactory.delete(TokensKeys.accessToken);
  }

  static Future<void> deleteRefreshToken() async {
    await SecureStorageFactory.delete(TokensKeys.refreshToken);
  }

  static Future<void> deleteTokens() async {
    await deleteAccessToken();
    await deleteRefreshToken();
  }
}
