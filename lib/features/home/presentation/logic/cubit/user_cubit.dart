import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/failure/failures.dart';
import '../../../domain/entities/car_entity.dart';
import '../../../domain/use_cases/get_user_selected_car_use_case.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUserSelectedCarUseCase _getUserSelectedCarUseCase;

  UserCubit(this._getUserSelectedCarUseCase) : super(UserInitial());

  void fetchUserData() {
    emit(UserDataLoading());

    _getUserSelectedCarUseCase.execute().then((response) {
      response.fold(
        (failure) => emit(UserDataError(failure)),
        (userCar) => emit(UserDataLoaded(userCar)),
      );
    });
  }
}
