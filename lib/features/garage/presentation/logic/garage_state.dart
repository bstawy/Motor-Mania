part of 'garage_cubit.dart';

sealed class GarageState {}

final class GarageInitial extends GarageState {}

final class GarageLoading extends GarageState {}

final class GarageLoaded extends GarageState {
  final List<CarEntity>? cars;

  GarageLoaded(this.cars);
}

final class GarageEmpty extends GarageState {}

final class GarageError extends GarageState {
  final ApiErrorModel error;
  GarageError(this.error);
}

final class SelectCarLoading extends GarageState {}

final class SelectCarSuccess extends GarageState {
  final CarEntity? selectedCar;

  SelectCarSuccess(this.selectedCar);
}

final class SelectCarError extends GarageState {
  final ApiErrorModel error;
  SelectCarError(this.error);
}

final class AddToGarageLoading extends GarageState {}

final class AddToGarageSuccess extends GarageState {}

final class AddToGarageError extends GarageState {
  final ApiErrorModel error;
  AddToGarageError(this.error);
}

final class RemoveFromGarageLoading extends GarageState {}

final class RemoveFromGarageSuccess extends GarageState {}

final class RemoveFromGarageError extends GarageState {
  final ApiErrorModel error;
  RemoveFromGarageError(this.error);
}
