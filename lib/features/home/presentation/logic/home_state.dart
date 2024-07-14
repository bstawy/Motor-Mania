part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class UserCarLoading extends HomeState {}

final class UserCarLoaded extends HomeState {
  final CarEntity car;

  UserCarLoaded(this.car);
}

final class CategoriesLoading extends HomeState {}

final class CategoriesLoaded extends HomeState {
  final List<Category> categories;

  CategoriesLoaded(this.categories);
}

final class ErrorState extends HomeState {
  final String message;

  ErrorState(this.message);
}

final class ProductsLoading extends HomeState {}

final class ProductsLoaded extends HomeState {
  final List<ProductEntity> products;

  ProductsLoaded(this.products);
}

final class CategoryProductsLoading extends HomeState {}

final class CategoryProductsLoaded extends HomeState {
  final List<ProductEntity> products;

  CategoryProductsLoaded(this.products);
}
