import 'hive_manager.dart';
import 'secure_storage_manager.dart';
import 'shared_prefs_manager.dart';
import 'tokens_manager.dart';

// TODO: not working, needs refactoring
class AppStorageManager {
  AppStorageManager._();

  static const secured = SecureStorageManager;
  static const prefs = SharedPrefsManager;
  static const tokens = TokensManager;
  static const hive = HiveManager;
}
