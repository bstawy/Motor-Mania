import '../config/constants/caching_constants.dart';
import 'secure_storage_factory.dart';

class TokensManager {
  static Future<String?> getAccessToken() async {
    String? accessToken = await SecureStorageFactory.getInstance()
        .read(key: TokensConstants.accessToken);
    return accessToken;
  }

  static Future<String?> getRefreshToken() async {
    String? refreshToken = await SecureStorageFactory.getInstance()
        .read(key: TokensConstants.refreshToken);
    return refreshToken;
  }

  static Future<void> setAccessToken(String accessToken) async {
    await SecureStorageFactory.getInstance()
        .write(key: TokensConstants.accessToken, value: accessToken);
  }

  static Future<void> setRefreshToken(String refreshToken) async {
    await SecureStorageFactory.getInstance()
        .write(key: TokensConstants.refreshToken, value: refreshToken);
  }
}
