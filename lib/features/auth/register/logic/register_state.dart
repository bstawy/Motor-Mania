part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class InitialState extends RegisterState {}

final class LoadingState extends RegisterState {}

final class SuccessState extends RegisterState {
  final String message;
  SuccessState(this.message);
}

final class ErrorState extends RegisterState {
  final List<String> message;
  ErrorState(this.message);
}
