// import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {
  SharedPrefsManager._();

  // static SharedPreferences? _instance;

  // static Future<SharedPreferences> getInstance() async {
  //   _instance ??= await SharedPreferences.getInstance();
  //   return _instance!;
  // }

  /*
  static Future<bool> writeData({
    required String key,
    required dynamic value,
  }) async {
    await getInstance();

    if (value is List<String>) return await _instance.writeStringsList(key, value);
    if (value is String) return await _instance.writeString(key, value);
    if (value is bool) return await _instance.writeBool(key, value);
    if (value is int) return await _instance.writeInt(key, value);
    return await _instance.writeDouble(key, value);
  }

  static Future<dynamic> read(String key) async {
    await getInstance();
    return _instance.get(key);

    if (kDebugMode) {
      log('key: $key\nvalue: $value', name: 'SharedPrefsManager - READ');
    }
  }

    static Future<void> writeStringsList(
      {required String key, required List<String> value}) async {
    await getInstance();
    await _instance.setStringList(key, value);

    if (kDebugMode) {
      log('key: $key\nvalue: $value', name: 'SharedPrefsManager - WRITE STRINGS LIST');
    }
  }

  static Future<void> writeString(
      {required String key, required String value}) async {
    await getInstance();
    await _instance.setString(key, value);

    if (kDebugMode) {
      log('key: $key\nvalue: $value', name: 'SharedPrefsManager - WRITE STRING');
    }
  }


  static Future<void> writeBool(
      {required String key, required bool value}) async {
    final prefs = await getPrefsInstance();
    await prefs.setBool(key, value);

    if (kDebugMode) {
      log('key: $key\nvalue: $value', name: 'SharedPrefsManager - WRITE BOOL');
    }
  }

  static Future<void> writeInt(
      {required String key, required int value}) async {
    final prefs = await getPrefsInstance();
    await prefs.setInt(key, value);

    if (kDebugMode) {
      log('key: $key\nvalue: $value', name: 'SharedPrefsManager - WRITE INT');
    }
  }

  static Future<void> writeDouble(
      {required String key, required double value}) async {
    final prefs = await getPrefsInstance();
    await prefs.setDouble(key, value);

    if (kDebugMode) {
      log('key: $key\nvalue: $value', name: 'SharedPrefsManager - WRITE DOUBLE');
    }
  }

  static Future<String?> readString(String key) async {
    final prefs = await getPrefsInstance();
    final value = prefs.getString(key);

    if (kDebugMode) {
      log('read key: $key\nvalue: $value', name: 'SharedPrefsManager - READ STRING');
    }

    return value;
  }

  static Future<List<String>?> readStringsList(String key) async {
    final prefs = await getPrefsInstance();
    final value = prefs.getStringList(key);

    if (kDebugMode) {
      log('read key: $key\nvalue: $value', name: 'SharedPrefsManager - READ STRINGS LIST');
    }

    return value;
  }

  static Future<bool?> readBool(String key) async {
    final prefs = await getPrefsInstance();
    final value = prefs.getBool(key);

    if (kDebugMode) {
      log('read key: $key\nvalue: $value', name: 'SharedPrefsManager - READ BOOL');
    }

    return value;
  }

  static Future<int?> readInt(String key) async {
    final prefs = await getPrefsInstance();
    final value = prefs.getInt(key);

    if (kDebugMode) {
      log('read key: $key\nvalue: $value', name: 'SharedPrefsManager - READ INT');
    }

    return value;
  }

  static Future<double?> readDouble(String key) async {
    final prefs = await getPrefsInstance();
    final value = prefs.getDouble(key);

    if (kDebugMode) {
      log('read key: $key\nvalue: $value', name: 'SharedPrefsManager - READ DOUBLE');
    }

    return value;
  }

  static Future<void> deleteData(String key) async {
    final prefs = await getPrefsInstance();
    await prefs.remove(key);

    if (kDebugMode) {
      log('delete key: $key', name: 'SharedPrefsManager - DELETE');
    }
  }

  static Future<void> clear() async {
    final prefs = await getPrefsInstance();
    await prefs.clear();

    if (kDebugMode) {
      log('clear prefs', name: 'SharedPrefsManager - CLEAR');
    }
  }
  */
}
