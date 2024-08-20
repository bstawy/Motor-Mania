part of 'car_brands_cubit.dart';

sealed class CarBrandsState {}

final class CarBrandsInitial extends CarBrandsState {}

final class CarBrandsLoading extends CarBrandsState {}

final class CarBrandsLoaded extends CarBrandsState {
  final List<CarBrandEntity> carBrands;

  CarBrandsLoaded(this.carBrands);
}

final class CarBrandsAdding extends CarBrandsState {}

final class CarBrandsAddedSuccess extends CarBrandsState {}

final class CarBrandsAddedError extends CarBrandsState {
  final ServerFailure failure;

  CarBrandsAddedError(this.failure);
}

final class CarBrandSelected extends CarBrandsState {}

final class CarModelSelected extends CarBrandsState {}

final class CarYearSelected extends CarBrandsState {}

final class CarKilometersSelected extends CarBrandsState {}

final class CarBrandsError extends CarBrandsState {
  final ServerFailure failure;

  CarBrandsError(this.failure);
}
