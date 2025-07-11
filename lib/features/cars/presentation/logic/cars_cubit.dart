import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../garage/data/models/add_car_model.dart';
import '../../../garage/presentation/logic/garage_cubit.dart';
import '../../domain/entities/car_brand_entity.dart';
import '../../domain/entities/car_brand_model_entity.dart';
import '../../domain/use_cases/get_car_brand_models_use_case.dart';
import '../../domain/use_cases/get_car_brands_use_case.dart';

part 'cars_state.dart';

class CarsCubit extends Cubit<CarsState> {
  final GetCarBrandsUseCase _getCarBrandsUseCase;
  final GetCarBrandModelsUseCase _getCarBrandModelsUseCase;
  List<CarBrandEntity> carBrands = [];
  List<CarBrandModelEntity> carModels = [];

  int? selectedCarBrandId;
  String? selectedCarModel;
  int? selectedCarYear;
  int? selectedCarKilometers;

  CarsCubit(
    this._getCarBrandsUseCase,
    this._getCarBrandModelsUseCase,
  ) : super(CarBrandsInitial());

  Future<void> getCarBrands() async {
    emit(CarBrandsLoading());

    final response = await _getCarBrandsUseCase();

    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);

        emit(CarBrandsError(error));
      },
      (success) {
        carBrands = success.data ?? [];
        emit(CarBrandsLoaded(carBrands));

        selectCarBrand(carBrands.first.id!);
        getCarBrandModels();
      },
    );
  }

  Future<void> getCarBrandModels() async {
    emit(CarBrandModelsLoading());
    final response = await _getCarBrandModelsUseCase(selectedCarBrandId ?? 0);

    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);

        emit(CarBrandModelsError(error));
      },
      (success) {
        carModels = success.data ?? [];
        emit(CarBrandModelsLoaded(carModels));
      },
    );
  }

  selectCarBrand(int id, {bool? order}) {
    reset();
    selectedCarBrandId = id;
    int selectedCarBrandIndex =
        carBrands.indexWhere((element) => element.id == id);
    if (selectedCarBrandIndex > 5) {
      // Create a copy
      List<CarBrandEntity> sortedList = [...carBrands];
      sortedList = sortedList.moveToStart(selectedCarBrandIndex);
      carBrands = sortedList;

      emit(
        CarBrandSelected(List.unmodifiable(sortedList)),
      );
      getCarBrandModels();
    } else {
      emit(CarBrandSelected(List.unmodifiable(carBrands)));
      getCarBrandModels();
    }
  }

  void addCar(BuildContext context) {
    final AddCarModel carData = AddCarModel(
      brand: carBrands
          .firstWhere((element) => element.id == selectedCarBrandId!)
          .name!,
      model: selectedCarModel!,
      year: selectedCarYear!,
    );

    context.read<GarageCubit>().addCar(carData);
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
    if (kilometer.isEmpty) {
      selectedCarKilometers = null;
    }
    selectedCarKilometers = int.parse(kilometer);
    emit(CarKilometersSelected());
  }

  bool checkCarDataCompleted() {
    return selectedCarBrandId != null &&
        selectedCarModel != null &&
        selectedCarYear != null &&
        selectedCarKilometers != null;
  }

  void reset() {
    selectedCarBrandId = 1;
    selectedCarModel = null;
    selectedCarYear = null;
    selectedCarKilometers = null;
  }
}
