import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/errors/api_error_model.dart';
import '../../../domain/entities/car_entity.dart';
import '../../../domain/use_cases/get_user_selected_car_use_case.dart';
import '../../../domain/use_cases/select_next_car_use_case.dart';
import '../../../domain/use_cases/select_previous_car_use_case.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUserSelectedCarUseCase _getUserSelectedCarUseCase;
  final SelectNextCarUseCase _selectNextCarUseCase;
  final SelectPreviousCarUseCase _selectPreviousCarUseCase;

  UserCubit(
    this._getUserSelectedCarUseCase,
    this._selectNextCarUseCase,
    this._selectPreviousCarUseCase,
  ) : super(UserInitial());

  void fetchUserData() async {
    emit(UserDataLoading());
    final result = await _getUserSelectedCarUseCase.execute();

    result.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(UserDataError(error));
      },
      (success) => emit(UserDataLoaded(success.data)),
    );
  }

  void selectNexCar() async {
    emit(UserCarSwitching());
    final result = await _selectNextCarUseCase.execute();

    result.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(UserDataError(error));
      },
      (success) => emit(UserDataLoaded(success.data)),
    );
  }

  void selectPreviousCar() async {
    emit(UserCarSwitching());
    final result = await _selectPreviousCarUseCase.execute();

    result.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(UserDataError(error));
      },
      (success) => emit(UserDataLoaded(success.data)),
    );
  }
}
