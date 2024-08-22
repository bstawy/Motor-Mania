import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/failure/server_failure.dart';
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
    final result = await _getGarageCarsUseCase.execute();

    result.fold(
      (failure) => emit(GarageError(failure)),
      (cars) {
        if (cars.isEmpty) {
          emit(GarageEmpty());
        } else {
          emit(GarageLoaded(cars));
        }
      },
    );
  }

  void selectCar(int carId) {
    emit(SelectCarLoading());

    _selectCarUseCase.execute(carId).then(
      (response) {
        response.fold(
          (failure) => emit(SelectCarError(failure)),
          (car) => emit(SelectCarSuccess(car)),
        );
      },
    );
  }

  void addCar(AddCarModel carData) async {
    debugPrint('==================================');
    debugPrint('Add Car State Triggered');

    emit(AddToGarageLoading());

    final response = await _addCarUseCase(carData);
    response.fold(
      (failure) => emit(AddToGarageError(failure)),
      (_) {
        emit(AddToGarageSuccess());
        getGarageCars();
      },
    );
  }

  Future<void> removeCar(int carId) async {
    emit(RemoveFromGarageLoading());

    _removeCarUseCase(carId).then(
      (response) {
        response.fold(
          (failure) => emit(RemoveFromGarageError(failure)),
          (_) {
            emit(RemoveFromGarageSuccess());
            getGarageCars();
          },
        );
      },
    );
  }
}
