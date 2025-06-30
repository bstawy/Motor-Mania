part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class OffersLoading extends HomeState {}

final class OffersLoaded extends HomeState {
  final List<OfferEntity>? offers;

  OffersLoaded(this.offers);
}

final class OffersError extends HomeState {
  final ApiErrorModel error;
  OffersError(this.error);
}

final class CategoriesLoading extends HomeState {}

final class CategoriesLoaded extends HomeState {
  final List<CategoryEntity>? categories;

  CategoriesLoaded(this.categories);
}

final class CategoriesError extends HomeState {
  final ApiErrorModel error;
  CategoriesError(this.error);
}

final class ProductsLoading extends HomeState {}

final class ProductsLoaded extends HomeState {
  final List<ProductEntity>? products;

  ProductsLoaded(this.products);
}

final class ProductsError extends HomeState {
  final ApiErrorModel error;

  ProductsError(this.error);
}
