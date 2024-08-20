part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class OffersLoading extends HomeState {}

final class OffersLoaded extends HomeState {
  final List<OfferEntity> offers;

  OffersLoaded(this.offers);
}

final class OffersError extends HomeState {
  final ServerFailure failure;
  OffersError(this.failure);
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
