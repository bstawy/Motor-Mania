import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../caching/tokens_manager.dart';
import '../../helpers/enums/app_modes_enums.dart';

part 'app_manager_state.dart';

class AppManagerCubit extends Cubit<AppManagerState> {
  AppMode appMode = AppMode.guest;

  AppManagerCubit() : super(AppManagerInitialState());

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
