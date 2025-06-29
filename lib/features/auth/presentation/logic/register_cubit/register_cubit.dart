import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motor_mania/core/errors/api_error_handler.dart';
import 'package:motor_mania/core/errors/api_error_model.dart';

import '../../../data/models/register_request_body.dart';
import '../../../data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo _authRepo;

  RegisterCubit(this._authRepo) : super(InitialState());

  Future<void> registerUser({
    required RegisterRequestBodyModel requestBody,
  }) async {
    emit(LoadingState());

    final response = await _authRepo.registerUser(requestBody);

    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(ErrorState(error));
      },
      (success) => emit(SuccessState()),
    );
  }
}
