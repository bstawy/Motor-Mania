import '../config/constants/app_constant_keys.dart';
import 'secure_storage_manager.dart';

class TokensManager {
  static Future<String?> getAccessToken() async {
    String? accessToken =
        await SecureStorageManager.read(TokensKeys.accessToken);
    // String? accessToken =
    //     await CachingPrefsFactory.readString(TokensKeys.accessToken);

    return accessToken;
  }

  static Future<String?> getRefreshToken() async {
    String? refreshToken =
        await SecureStorageManager.read(TokensKeys.refreshToken);
    // String? refreshToken =
    //     await CachingPrefsFactory.readString(TokensKeys.refreshToken);

    return refreshToken;
  }

  static Future<void> setAccessToken(String accessToken) async {
    await SecureStorageManager.write(
      key: TokensKeys.accessToken,
      value: accessToken,
    );
    // await CachingPrefsFactory.writeString(
    //   key: TokensKeys.accessToken,
    //   value: accessToken,
    // );
  }

  static Future<void> setRefreshToken(String refreshToken) async {
    await SecureStorageManager.write(
      key: TokensKeys.refreshToken,
      value: refreshToken,
    );
    // await CachingPrefsFactory.writeString(
    //   key: TokensKeys.refreshToken,
    //   value: refreshToken,
    // );
  }

  static Future<void> deleteAccessToken() async {
    await SecureStorageManager.delete(TokensKeys.accessToken);
    // await CachingPrefsFactory.deleteData(TokensKeys.accessToken);
  }

  static Future<void> deleteRefreshToken() async {
    await SecureStorageManager.delete(TokensKeys.refreshToken);
    // await CachingPrefsFactory.deleteData(TokensKeys.refreshToken);
  }

  static Future<void> deleteTokens() async {
    await deleteAccessToken();
    await deleteRefreshToken();
  }
}
