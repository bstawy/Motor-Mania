import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._();

  static FlutterSecureStorage? _instance;

  static FlutterSecureStorage getInstance() {
    _instance ??= const FlutterSecureStorage();
    return _instance!;
  }

  Future<void> write({required String key, required String value}) async {
    await _instance?.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _instance?.read(key: key);
  }

  Future<void> delete(String key) async {
    await _instance?.delete(key: key);
  }
}
