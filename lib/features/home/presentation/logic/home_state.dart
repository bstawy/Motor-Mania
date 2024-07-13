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

final class ProductsLoading extends HomeState {}

final class ProductsLoaded extends HomeState {
  final List<ProductEntity> products;

  ProductsLoaded(this.products);
}

final class ProductsError extends HomeState {
  final String message;

  ProductsError(this.message);
}
