part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class CategoriesLoading extends HomeState {}

final class CategoriesLoaded extends HomeState {
  final List<Category> categories;

  CategoriesLoaded(this.categories);
}

final class CategoriesError extends HomeState {
  final String message;

  CategoriesError(this.message);
}
