part of 'app_manager_cubit.dart';

@immutable
sealed class AppManagerState {}

final class AppManagerInitialState extends AppManagerState {}

final class UserLoggedInState extends AppManagerState {}

final class NoUserLoggedInState extends AppManagerState {}
