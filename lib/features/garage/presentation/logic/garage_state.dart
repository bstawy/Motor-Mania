part of 'garage_cubit.dart';

sealed class GarageState {}

final class GarageInitial extends GarageState {}

final class GarageLoading extends GarageState {}

final class GarageLoaded extends GarageState {
  final List<CarEntity> cars;

  GarageLoaded(this.cars);
}

final class SelectCarLoading extends GarageState {}

final class SelectCarSuccess extends GarageState {
  final CarEntity selectedCar;

  SelectCarSuccess(this.selectedCar);
}

final class SelectCarError extends GarageState {
  final ServerFailure failure;
  SelectCarError(this.failure);
}

final class GarageEmpty extends GarageState {}

final class RemoveFromGarageLoading extends GarageState {}

final class RemoveFromGarageSuccess extends GarageState {}

final class RemoveFromGarageError extends GarageState {
  final ServerFailure failure;
  RemoveFromGarageError(this.failure);
}

final class GarageError extends GarageState {
  final ServerFailure failure;
  GarageError(this.failure);
}
