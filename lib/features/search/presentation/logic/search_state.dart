part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<ProductEntity>? products;

  SearchLoaded(this.products);
}

final class SearchEmpty extends SearchState {}

final class SearchError extends SearchState {
  final ApiErrorModel error;

  SearchError(this.error);
}
