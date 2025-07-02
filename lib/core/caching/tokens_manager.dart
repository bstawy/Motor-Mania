import '../config/constants/app_constant_keys.dart';
import 'secure_storage_factory.dart';

class TokensManager {
  static Future<String?> getAccessToken() async {
    String? accessToken =
        await CachingPrefsFactory.secureRead(TokensKeys.accessToken);
    // String? accessToken =
    //     await CachingPrefsFactory.readString(TokensKeys.accessToken);

    return accessToken;
  }

  static Future<String?> getRefreshToken() async {
    String? refreshToken =
        await CachingPrefsFactory.secureRead(TokensKeys.refreshToken);
    // String? refreshToken =
    //     await CachingPrefsFactory.readString(TokensKeys.refreshToken);

    return refreshToken;
  }

  static Future<void> setAccessToken(String accessToken) async {
    await CachingPrefsFactory.secureWrite(
      key: TokensKeys.accessToken,
      value: accessToken,
    );
    // await CachingPrefsFactory.writeString(
    //   key: TokensKeys.accessToken,
    //   value: accessToken,
    // );
  }

  static Future<void> setRefreshToken(String refreshToken) async {
    await CachingPrefsFactory.secureWrite(
      key: TokensKeys.refreshToken,
      value: refreshToken,
    );
    // await CachingPrefsFactory.writeString(
    //   key: TokensKeys.refreshToken,
    //   value: refreshToken,
    // );
  }

  static Future<void> deleteAccessToken() async {
    await CachingPrefsFactory.secureDelete(TokensKeys.accessToken);
    // await CachingPrefsFactory.deleteData(TokensKeys.accessToken);
  }

  static Future<void> deleteRefreshToken() async {
    await CachingPrefsFactory.secureDelete(TokensKeys.refreshToken);
    // await CachingPrefsFactory.deleteData(TokensKeys.refreshToken);
  }

  static Future<void> deleteTokens() async {
    await deleteAccessToken();
    await deleteRefreshToken();
  }
}
