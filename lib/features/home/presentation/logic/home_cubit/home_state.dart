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

final class RecommendedProductsLoading extends HomeState {}

final class RecommendedProductsLoaded extends HomeState {
  final List<ProductEntity>? recommendedProducts;

  RecommendedProductsLoaded(this.recommendedProducts);
}

final class RecommendedProductsError extends HomeState {
  final ApiErrorModel error;

  RecommendedProductsError(this.error);
}

final class BestSellerProductsLoading extends HomeState {}

final class BestSellerProductsLoaded extends HomeState {
  final List<ProductEntity>? bestSellerProducts;

  BestSellerProductsLoaded(this.bestSellerProducts);
}

final class BestSellerProductsError extends HomeState {
  final ApiErrorModel error;

  BestSellerProductsError(this.error);
}
