import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/domain/entities/car_entity.dart';
import '../../domain/use_cases/get_garage_cars_use_case.dart';

part 'garage_state.dart';

class GarageCubit extends Cubit<GarageState> {
  final GetGarageCarsUseCase _getGarageCarsUseCase;

  GarageCubit(this._getGarageCarsUseCase) : super(GarageInitial());

  void getGarageCars() {
    emit(GarageLoading());

    _getGarageCarsUseCase.execute().then(
      (response) {
        response.fold(
          (failure) => emit(GarageError(failure)),
          (cars) {
            if (cars.isEmpty) {
              emit(GarageEmpty());
            } else {
              emit(GarageLoaded(cars));
            }
          },
        );
      },
    );
  }
}
