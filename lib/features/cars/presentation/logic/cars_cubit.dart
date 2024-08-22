import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/networking/failure/server_failure.dart';
import '../../../garage/data/models/add_car_model.dart';
import '../../../garage/presentation/logic/garage_cubit.dart';
import '../../domain/entities/car_brand_entity.dart';
import '../../domain/use_cases/get_car_brands_use_case.dart';

part 'cars_state.dart';

class CarsCubit extends Cubit<CarsState> {
  final GetCarBrandsUseCase _getCarBrandsUseCase;
  List<CarBrandEntity> carBrands = [];
  int? selectedCarBrandId;
  String? selectedCarModel;
  int? selectedCarYear;
  int? selectedCarKilometers;

  CarsCubit(this._getCarBrandsUseCase) : super(CarBrandsInitial());

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
    int selectedCarBrandIndex =
        carBrands.indexWhere((element) => element.id == id);
    if (selectedCarBrandIndex > 5) {
      // Create a copy
      List<CarBrandEntity> sortedList = [...carBrands];
      sortedList = sortedList.moveToStart(selectedCarBrandIndex);
      carBrands = sortedList;
      debugPrint('Car Brands: $carBrands');

      emit(
        CarBrandSelected(List.unmodifiable(sortedList)),
      );
    } else {
      debugPrint('Car Brands unsorted: $carBrands');

      emit(CarBrandSelected(List.unmodifiable(carBrands)));
    }
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

  bool checkCarDataCompleted() {
    return selectedCarBrandId != null &&
        selectedCarModel != null &&
        selectedCarYear != null &&
        selectedCarKilometers != null;
  }

  void addCar(BuildContext context) {
    debugPrint('==================================');
    debugPrint('CarsCubit: Add Car State Triggered');
    // final String brand = carBrands
    //     .firstWhere((element) => element.id == selectedCarBrandId!)
    //     .name!;

    // final AddCarModel carData = AddCarModel(
    //   brand: brand,
    //   model: selectedCarModel!,
    //   year: selectedCarYear!,
    // );

    final AddCarModel carData = AddCarModel(
      brand: "bmw",
      model: "m3",
      year: 2013,
    );

    context.read<GarageCubit>().addCar(carData);
  }

  void reset() {
    selectedCarBrandId = 1;
    selectedCarModel = null;
    selectedCarYear = null;
    selectedCarKilometers = null;
  }
}
