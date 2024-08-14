part of 'garage_cubit.dart';

sealed class GarageState {}

final class GarageInitial extends GarageState {}

final class GarageLoading extends GarageState {}

final class GarageLoaded extends GarageState {}

final class GarageEmpty extends GarageState {}

final class RemoveFromGarageSuccess extends GarageState {}

final class GarageError extends GarageState {
  final ServerFailure failure;
  GarageError(this.failure);
}
