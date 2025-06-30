part of 'user_cubit.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

final class UserDataLoading extends UserState {}

final class UserDataLoaded extends UserState {
  final CarEntity? userCar;

  UserDataLoaded(this.userCar);
}

final class UserDataEmpty extends UserState {}

final class UserCarSwitching extends UserState {}

final class UserDataError extends UserState {
  final ApiErrorModel error;

  UserDataError(this.error);
}
