part of 'app_manager_cubit.dart';

@immutable
sealed class AppManagerState {}

final class InitialState extends AppManagerState {}

final class UserLoggedInState extends AppManagerState {}

final class NoUserLoggedInState extends AppManagerState {}

final class BottomSheetOpenedState extends AppManagerState {}

final class BottomSheetClosedState extends AppManagerState {}
