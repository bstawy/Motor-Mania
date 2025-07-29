import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  SecureStorageManager._();

  static FlutterSecureStorage? _instance;

  static Future<FlutterSecureStorage> getInstance() async {
    _instance ??= const FlutterSecureStorage();
    return _instance!;
  }

  static Future<void> write(
      {required String key, required String value}) async {
    final storage = await getInstance();
    await storage.write(key: key, value: value);

    if (!kReleaseMode) {
      log('key: $key\nvalue: $value', name: 'SecureStorageManager - WRITE');
    }
  }

  static Future<String?> read(String key) async {
    final storage = await getInstance();
    final value = await storage.read(key: key);

    if (!kReleaseMode) {
      log('read key: $key\nvalue: $value', name: 'SecureStorageManager - READ');
    }

    return value;
  }

  static Future<void> delete(String key) async {
    final storage = await getInstance();
    await storage.delete(key: key);

    if (!kReleaseMode) {
      log('key: $key', name: 'SecureStorageManager - DELETE');
    }
  }

  static Future<void> clear() async {
    final storage = await getInstance();
    await storage.deleteAll();

    if (!kReleaseMode) {
      log('clear secure', name: 'SecureStorageManager - CLEAR');
    }
  }
}
