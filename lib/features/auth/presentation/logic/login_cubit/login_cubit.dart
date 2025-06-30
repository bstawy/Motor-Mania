import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/errors/api_error_model.dart';
import '../../../data/models/login_request_body_model.dart';
import '../../../data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(InitialState());

  Future<void> login(LoginRequestBodyModel requestBody) async {
    emit(LoadingState());

    final response = await _loginRepo.login(requestBody);

    response.fold(
      (failure) {
        final error = ApiErrorHandler.handle(failure.exception);
        emit(ErrorState(error));
      },
      (success) => emit(SuccessState()),
    );
  }
}
