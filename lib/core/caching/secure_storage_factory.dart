import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class CachingPrefsFactory {
  CachingPrefsFactory._();

  static FlutterSecureStorage? _securedInstance;
  // static SharedPreferences? _prefsInstance;

  static Future<FlutterSecureStorage> getSecuredInstance() async {
    _securedInstance ??= const FlutterSecureStorage();
    return _securedInstance!;
  }

  // static Future<SharedPreferences> getPrefsInstance() async {
  //   _prefsInstance ??= await SharedPreferences.getInstance();
  //   return _prefsInstance!;
  // }

  //---------- Secured operations ----------//
  static Future<void> secureWrite(
      {required String key, required String value}) async {
    final storage = await getSecuredInstance();
    await storage.write(key: key, value: value);

    if (kDebugMode) {
      log('key: $key\nvalue: $value', name: 'SecureStorage - WRITE');
    }
  }

  static Future<String?> secureRead(String key) async {
    final storage = await getSecuredInstance();
    final value = await storage.read(key: key);

    if (kDebugMode) {
      log('read key: $key\nvalue: $value', name: 'SecureStorage - READ');
    }

    return value;
  }

  static Future<void> secureDelete(String key) async {
    final storage = await getSecuredInstance();
    await storage.delete(key: key);

    if (kDebugMode) {
      log('delete key: $key', name: 'SecureStorage - DELETE');
    }
  }

  static Future<void> secureClear() async {
    final storage = await getSecuredInstance();
    await storage.deleteAll();

    if (kDebugMode) {
      log('clear secure', name: 'SecureStorage - CLEAR ALL');
    }
  }
  /*
  //---------- Non secured operations ----------//
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    final prefs = await getPrefsInstance();

    if (value is List<String>) return await prefs.setStringList(key, value);
    if (value is String) return await prefs.setString(key, value);
    if (value is bool) return await prefs.setBool(key, value);
    if (value is int) return await prefs.setInt(key, value);
    return await prefs.setDouble(key, value);
  }

  static Future<dynamic> getData(String key) async {
    final prefs = await getPrefsInstance();
    return prefs.get(key);
  }

  static Future<void> writeString(
      {required String key, required String value}) async {
    final prefs = await getPrefsInstance();
    await prefs.setString(key, value);

    if (kDebugMode) {
      log('key: $key\nvalue: $value', name: 'Prefs - WRITE STRING');
    }
  }

  static Future<void> writeStringsList(
      {required String key, required List<String> value}) async {
    final prefs = await getPrefsInstance();
    await prefs.setStringList(key, value);

    if (kDebugMode) {
      log('key: $key\nvalue: $value', name: 'Prefs - WRITE STRINGS LIST');
    }
  }

  static Future<void> writeBool(
      {required String key, required bool value}) async {
    final prefs = await getPrefsInstance();
    await prefs.setBool(key, value);

    if (kDebugMode) {
      log('key: $key\nvalue: $value', name: 'Prefs - WRITE BOOL');
    }
  }

  static Future<void> writeInt(
      {required String key, required int value}) async {
    final prefs = await getPrefsInstance();
    await prefs.setInt(key, value);

    if (kDebugMode) {
      log('key: $key\nvalue: $value', name: 'Prefs - WRITE INT');
    }
  }

  static Future<void> writeDouble(
      {required String key, required double value}) async {
    final prefs = await getPrefsInstance();
    await prefs.setDouble(key, value);

    if (kDebugMode) {
      log('key: $key\nvalue: $value', name: 'Prefs - WRITE DOUBLE');
    }
  }

  static Future<String?> readString(String key) async {
    final prefs = await getPrefsInstance();
    final value = prefs.getString(key);

    if (kDebugMode) {
      log('read key: $key\nvalue: $value', name: 'Prefs - READ STRING');
    }

    return value;
  }

  static Future<List<String>?> readStringsList(String key) async {
    final prefs = await getPrefsInstance();
    final value = prefs.getStringList(key);

    if (kDebugMode) {
      log('read key: $key\nvalue: $value', name: 'Prefs - READ STRINGS LIST');
    }

    return value;
  }

  static Future<bool?> readBool(String key) async {
    final prefs = await getPrefsInstance();
    final value = prefs.getBool(key);

    if (kDebugMode) {
      log('read key: $key\nvalue: $value', name: 'Prefs - READ BOOL');
    }

    return value;
  }

  static Future<int?> readInt(String key) async {
    final prefs = await getPrefsInstance();
    final value = prefs.getInt(key);

    if (kDebugMode) {
      log('read key: $key\nvalue: $value', name: 'Prefs - READ INT');
    }

    return value;
  }

  static Future<double?> readDouble(String key) async {
    final prefs = await getPrefsInstance();
    final value = prefs.getDouble(key);

    if (kDebugMode) {
      log('read key: $key\nvalue: $value', name: 'Prefs - READ DOUBLE');
    }

    return value;
  }

  static Future<void> deleteData(String key) async {
    final prefs = await getPrefsInstance();
    await prefs.remove(key);

    if (kDebugMode) {
      log('delete key: $key', name: 'Prefs - DELETE');
    }
  }

  static Future<void> clearPrefs() async {
    final prefs = await getPrefsInstance();
    await prefs.clear();

    if (kDebugMode) {
      log('clear prefs', name: 'Prefs - CLEAR ALL');
    }
  }
  */
}
