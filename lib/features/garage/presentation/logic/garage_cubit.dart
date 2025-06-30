import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../home/domain/entities/car_entity.dart';
import '../../data/models/add_car_model.dart';
import '../../domain/use_cases/add_car_use_case.dart';
import '../../domain/use_cases/get_garage_cars_use_case.dart';
import '../../domain/use_cases/remove_car_use_case.dart';
import '../../domain/use_cases/select_car_use_case.dart';

part 'garage_state.dart';

class GarageCubit extends Cubit<GarageState> {
  final GetGarageCarsUseCase _getGarageCarsUseCase;
  final SelectCarUseCase _selectCarUseCase;
  final AddCarUseCase _addCarUseCase;
  final RemoveCarUseCase _removeCarUseCase;

  GarageCubit(
    this._getGarageCarsUseCase,
    this._selectCarUseCase,
    this._addCarUseCase,
    this._removeCarUseCase,
  ) : super(GarageInitial());

  void getGarageCars() async {
    emit(GarageLoading());

    final response = await _getGarageCarsUseCase();

    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(GarageError(error));
      },
      (success) {
        final List<CarEntity> cars = success.data ?? [];

        if (cars.isEmpty) {
          emit(GarageEmpty());
        } else {
          emit(GarageLoaded(cars));
        }
      },
    );
  }

  void selectCar(int carId) async {
    emit(SelectCarLoading());

    final response = await _selectCarUseCase(carId);
    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(SelectCarError(error));
      },
      (success) => emit(SelectCarSuccess(success.data)),
    );
  }

  void addCar(AddCarModel carData) async {
    emit(AddToGarageLoading());

    final response = await _addCarUseCase(carData);
    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(AddToGarageError(error));
      },
      (_) {
        emit(AddToGarageSuccess());
        getGarageCars();
      },
    );
  }

  Future<void> removeCar(int carId) async {
    emit(RemoveFromGarageLoading());

    final response = await _removeCarUseCase(carId);

    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(RemoveFromGarageError(error));
      },
      (_) {
        emit(RemoveFromGarageSuccess());
        getGarageCars();
      },
    );
  }
}
