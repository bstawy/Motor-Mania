part of 'category_cubit.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryProductsLoading extends CategoryState {}

final class CategoryProductsLoaded extends CategoryState {
  final List<HomeProductEntity> products;

  CategoryProductsLoaded(this.products);
}

final class ErrorState extends CategoryState {
  final ServerFailure failure;

  ErrorState(this.failure);
}
