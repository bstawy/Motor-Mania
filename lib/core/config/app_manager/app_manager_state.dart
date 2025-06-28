part of 'app_manager_cubit.dart';

@immutable
sealed class AppManagerState {}

final class AppManagerInitialState extends AppManagerState {}

final class FirstTimeUserState extends AppManagerState {
  final bool isFirstTimeUser;
  FirstTimeUserState(this.isFirstTimeUser);
}

final class UserLoggedInState extends AppManagerState {}

final class NoUserLoggedInState extends AppManagerState {}

final class ChangeThemeState extends AppManagerState {
  final ThemeMode currentTheme;

  ChangeThemeState(this.currentTheme);
}
