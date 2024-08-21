part of 'favorites_cubit.dart';

sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final List<HomeProductEntity> products;

  FavoritesLoaded(this.products);
}

final class FavoritesEmpty extends FavoritesState {}

final class AddToFavoritesSuccess extends FavoritesState {
  final String message;

  AddToFavoritesSuccess(this.message);
}

final class RemoveFromFavoritesSuccess extends FavoritesState {
  final String message;

  RemoveFromFavoritesSuccess(this.message);
}

final class FavoritesError extends FavoritesState {
  final ServerFailure failure;

  FavoritesError(this.failure);
}
