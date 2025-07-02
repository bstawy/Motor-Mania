import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../caching/secure_storage_factory.dart';
import '../../caching/tokens_manager.dart';
import '../../helpers/enums/app_modes_enums.dart';
import '../constants/app_constant_keys.dart';

part 'app_manager_state.dart';

class AppManagerCubit extends Cubit<AppManagerState> {
  AppMode appMode = AppMode.guest;
  bool isFirstTimeUser = true;
  int selectedCarId = 0;

  AppManagerCubit() : super(AppManagerInitialState());

  Future<void> init() async {
    await checkFirstTimeUser();
    await checkUserLoggedIn();
  }

  Future<void> checkFirstTimeUser() async {
    final String? cachedFirstTimeUser = await CachingPrefsFactory.secureRead(
      CachingKeys.firstTimeUser,
    );
    // isFirstTimeUser =
    //     await CachingPrefsFactory.readBool(CachingKeys.firstTimeUser) ?? true;

    isFirstTimeUser =
        cachedFirstTimeUser == 'true' || cachedFirstTimeUser == null;

    emit(FirstTimeUserState(isFirstTimeUser));
  }

  void setFirstTimeUser(bool value) async {
    isFirstTimeUser = value;
    await CachingPrefsFactory.secureWrite(
      key: CachingKeys.firstTimeUser,
      value: isFirstTimeUser ? 'true' : 'false',
    );

    // await CachingPrefsFactory.writeBool(
    //   key: CachingKeys.firstTimeUser,
    //   value: isFirstTimeUser,
    // );
  }

  Future<void> checkUserLoggedIn() async {
    final String? token = await TokensManager.getAccessToken();

    if (token != null) {
      appMode = AppMode.user;
      emit(UserLoggedInState());
    } else {
      appMode = AppMode.guest;
      emit(NoUserLoggedInState());
    }
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
