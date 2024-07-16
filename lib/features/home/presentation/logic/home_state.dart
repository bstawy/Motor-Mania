part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class UserCarLoading extends HomeState {}

final class UserCarLoaded extends HomeState {
  final CarEntity car;

  UserCarLoaded(this.car);
}

final class UserCarErrorState extends HomeState {
  final ServerFailure failure;

  UserCarErrorState(this.failure);
}

final class CategoriesLoading extends HomeState {}

final class CategoriesLoaded extends HomeState {
  final List<HomeCategoryEntity> categories;

  CategoriesLoaded(this.categories);
}

final class CategoriesErrorState extends HomeState {
  final ServerFailure failure;

  CategoriesErrorState(this.failure);
}

final class ProductsLoading extends HomeState {}

final class ProductsLoaded extends HomeState {
  final List<HomeProductEntity> products;

  ProductsLoaded(this.products);
}

final class ProductsErrorState extends HomeState {
  final ServerFailure failure;

  ProductsErrorState(this.failure);
}
