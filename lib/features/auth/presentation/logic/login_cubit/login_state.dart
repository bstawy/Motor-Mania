part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class InitialState extends LoginState {}

final class LoadingState extends LoginState {}

final class SuccessState extends LoginState {}

final class ErrorState extends LoginState {
  final ApiErrorModel error;

  ErrorState(this.error);
}
