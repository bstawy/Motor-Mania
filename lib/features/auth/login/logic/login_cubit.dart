import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/login_request_body_model.dart';
import '../data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(InitialState());

  Future<void> login(LoginRequestBodyModel requestBody) async {
    emit(LoadingState());
    try {
      final response = await _loginRepo.login(requestBody);
      response.fold(
        (l) => emit(ErrorState(l)),
        (r) => emit(SuccessState(r)),
      );
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
