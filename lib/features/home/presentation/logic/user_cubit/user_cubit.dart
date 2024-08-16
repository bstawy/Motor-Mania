import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motor_mania/features/home/domain/use_cases/select_next_car_use_case.dart';
import 'package:motor_mania/features/home/domain/use_cases/select_previous_car_use_case.dart';

import '../../../../../core/networking/failure/server_failure.dart';
import '../../../domain/entities/car_entity.dart';
import '../../../domain/use_cases/get_user_selected_car_use_case.dart';

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

  void fetchUserData() {
    emit(UserDataLoading());

    _getUserSelectedCarUseCase.execute().then((response) {
      response.fold(
        (failure) => emit(UserDataError(failure)),
        (userCar) => emit(UserDataLoaded(userCar)),
      );
    });
  }

  void selectNexCar() {
    emit(UserDataLoading());

    _selectNextCarUseCase.execute().then((response) {
      response.fold(
        (failure) => emit(UserDataError(failure)),
        (userCar) => emit(UserDataLoaded(userCar)),
      );
    });
  }

  void selectPreviousCar() {
    emit(UserDataLoading());

    _selectPreviousCarUseCase.execute().then((response) {
      response.fold(
        (failure) => emit(UserDataError(failure)),
        (userCar) => emit(UserDataLoaded(userCar)),
      );
    });
  }
}
