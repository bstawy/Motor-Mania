import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../caching/tokens_manager.dart';

part 'app_manager_state.dart';

class AppManagerCubit extends Cubit<AppManagerState> {
  bool userLoggedIn = false;

  AppManagerCubit() : super(AppManagerInitialState());

  void checkUserLoggedIn() async {
    final String? token = await TokensManager.getAccessToken();

    if (token != null) {
      userLoggedIn = true;
      emit(UserLoggedInState());
    } else {
      userLoggedIn = false;
      emit(NoUserLoggedInState());
    }
  }

  void logUserIn() {
    userLoggedIn = true;
    emit(UserLoggedInState());
  }

  Future<void> logUserOut() async {
    await TokensManager.deleteTokens();
    userLoggedIn = false;
    emit(NoUserLoggedInState());
  }
}
