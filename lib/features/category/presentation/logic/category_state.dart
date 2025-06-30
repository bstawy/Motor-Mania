part of 'category_cubit.dart';

sealed class CategoryState {}

final class InitialState extends CategoryState {}

final class LoadingState extends CategoryState {}

final class SuccessState extends CategoryState {
  final List<ProductEntity>? products;

  SuccessState(this.products);
}

final class ErrorState extends CategoryState {
  final ApiErrorModel error;

  ErrorState(this.error);
}
