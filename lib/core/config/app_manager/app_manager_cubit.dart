import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../caching/tokens_manager.dart';

part 'app_manager_state.dart';

class AppManagerCubit extends Cubit<AppManagerState> {
  bool isUserLoggedIn = false;
  String? token;

  AppManagerCubit() : super(InitialState());

  void checkUserLoggedIn() async {
    token = await TokensManager.getAccessToken();
    if (token != null) {
      isUserLoggedIn = true;
      emit(UserLoggedInState());
    } else {
      isUserLoggedIn = false;
      emit(NoUserLoggedInState());
    }
  }
}
