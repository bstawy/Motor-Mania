import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../domain/entities/car_brand_entity.dart';
import '../../domain/use_cases/get_car_brands_use_case.dart';

part 'car_brands_state.dart';

class CarBrandsCubit extends Cubit<CarBrandsState> {
  final GetCarBrandsUseCase _getCarBrandsUseCase;
  List<CarBrandEntity> carBrands = [];
  int? selectedCarBrandId;
  String? selectedCarModel;
  int? selectedCarYear;
  int? selectedCarKilometers;

  CarBrandsCubit(this._getCarBrandsUseCase) : super(CarBrandsInitial());

  Future<void> getCarBrands() async {
    emit(CarBrandsLoading());
    final response = await _getCarBrandsUseCase();
    response.fold(
      (failure) => emit(CarBrandsError(failure)),
      (carBrands) {
        selectedCarBrandId = carBrands.first.id!;
        this.carBrands = carBrands;
        emit(CarBrandsLoaded(carBrands));
      },
    );
  }

  selectCarBrand(int id, {bool? order}) {
    selectedCarBrandId = id;

    if (order != null && order) {
      Set<CarBrandEntity> newCarBrands = {
        carBrands.firstWhere((element) => element.id == id),
        ...carBrands,
      };

      carBrands = newCarBrands.toList();
    }
    // TODO: rearrage where selected brand is first brand

    emit(CarBrandSelected());
  }

  selectCarModel(String value) {
    selectedCarModel = value;
    emit(CarModelSelected());
  }

  selectCarYear(int value) {
    selectedCarYear = value;
    emit(CarYearSelected());
  }

  selectCarKilometers(String? value) {
    String kilometer = value ?? '';
    debugPrint('value: $kilometer');
    if (kilometer.isEmpty) {
      selectedCarKilometers = null;
    }
    selectedCarKilometers = int.parse(kilometer);
    emit(CarKilometersSelected());
  }

  void reset() {
    selectedCarBrandId = 1;
    selectedCarModel = null;
    selectedCarYear = null;
    selectedCarKilometers = null;
  }
}
