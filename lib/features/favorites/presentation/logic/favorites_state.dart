part of 'favorites_cubit.dart';

sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final List<ProductEntity>? products;

  FavoritesLoaded(this.products);
}

final class FavoritesEmpty extends FavoritesState {}

final class FavoritesError extends FavoritesState {
  final ApiErrorModel error;

  FavoritesError(this.error);
}

final class AddToFavoritesLoading extends FavoritesState {}

final class AddToFavoritesSuccess extends FavoritesState {}

final class AddToFavoritesFailure extends FavoritesState {
  final ApiErrorModel error;

  AddToFavoritesFailure(this.error);
}

final class RemoveFromFavoritesLoading extends FavoritesState {}

final class RemoveFromFavoritesSuccess extends FavoritesState {}

final class RemoveFromFavoritesFailure extends FavoritesState {
  final ApiErrorModel error;

  RemoveFromFavoritesFailure(this.error);
}
