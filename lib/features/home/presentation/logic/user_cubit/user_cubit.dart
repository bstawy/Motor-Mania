import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/failure/server_failure.dart';
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
      (error) => emit(UserDataError(error)),
      (userCar) {
        if (userCar == null) {
          emit(UserDataEmpty());
        } else {
          emit(UserDataLoaded(userCar));
        }
      },
    );
  }

  void selectNexCar() async {
    emit(UserCarSwitching());
    final result = await _selectNextCarUseCase.execute();

    result.fold(
      (error) => emit(UserDataError(error)),
      (userCar) => emit(UserDataLoaded(userCar)),
    );
  }

  void selectPreviousCar() async {
    emit(UserCarSwitching());
    final result = await _selectPreviousCarUseCase.execute();

    result.fold(
      (error) => emit(UserDataError(error)),
      (userCar) => emit(UserDataLoaded(userCar)),
    );
  }
}
