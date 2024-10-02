import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motor_mania/main.dart';

import '../../caching/secure_storage_factory.dart';
import '../../caching/tokens_manager.dart';
import '../../helpers/enums/app_modes_enums.dart';

part 'app_manager_state.dart';

class AppManagerCubit extends Cubit<AppManagerState> {
  AppMode appMode = AppMode.guest;
  ThemeMode currentThemeMode = ThemeMode.light;
  int selectedCarId = 0;

  AppManagerCubit() : super(AppManagerInitialState()) {
    final value = SecureStorageFactory.read('DarkMode');
    value.then((val) {
      if (val == 'dark') {
        currentThemeMode = ThemeMode.dark;
        themeIsDark = true;
      } else {
        currentThemeMode = ThemeMode.light;
        themeIsDark = false;
      }
    });
  }

  void checkUserLoggedIn() async {
    final String? token = await TokensManager.getAccessToken();

    if (token != null) {
      appMode = AppMode.user;
      emit(UserLoggedInState());
    } else {
      appMode = AppMode.guest;
      emit(NoUserLoggedInState());
    }
  }

  void changeTheme(ThemeMode selectedThemeMode) async {
    currentThemeMode = selectedThemeMode;
    await SecureStorageFactory.write(
      key: 'DarkMode',
      value: currentThemeMode == ThemeMode.dark ? 'dark' : 'light',
    );
    themeIsDark = currentThemeMode == ThemeMode.dark ? true : false;
    emit(ChangeThemeState(currentThemeMode));
  }

  void logUserIn() {
    appMode = AppMode.user;
    emit(UserLoggedInState());
  }

  Future<void> logUserOut() async {
    await TokensManager.deleteTokens();
    appMode = AppMode.guest;
    emit(NoUserLoggedInState());
  }
}
