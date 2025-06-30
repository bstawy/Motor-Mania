part of 'cars_cubit.dart';

sealed class CarsState {}

final class CarBrandsInitial extends CarsState {}

final class CarBrandsLoading extends CarsState {}

final class CarBrandsLoaded extends CarsState {
  final List<CarBrandEntity>? carBrands;

  CarBrandsLoaded(this.carBrands);
}

final class CarBrandsError extends CarsState {
  final ApiErrorModel error;

  CarBrandsError(this.error);
}

final class CarBrandModelsLoading extends CarsState {}

final class CarBrandModelsLoaded extends CarsState {
  final List<CarBrandModelEntity>? carBrandModels;

  CarBrandModelsLoaded(this.carBrandModels);
}

final class CarBrandModelsError extends CarsState {
  final ApiErrorModel error;

  CarBrandModelsError(this.error);
}

final class CarBrandSelected extends CarsState {
  final List<CarBrandEntity> carBrands;

  CarBrandSelected(this.carBrands);
}

final class CarModelSelected extends CarsState {}

final class CarYearSelected extends CarsState {}

final class CarKilometersSelected extends CarsState {}

final class CarDataCompleted extends CarsState {
  final AddCarModel carData;

  CarDataCompleted(this.carData);
}
