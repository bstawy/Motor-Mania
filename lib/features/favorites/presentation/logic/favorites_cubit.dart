import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../../domain/use_cases/add_to_favorites_use_case.dart';
import '../../domain/use_cases/get_all_favorites_use_case.dart';
import '../../domain/use_cases/remove_from_favorites_use_case.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final GetAllFavoritesUseCase _getAllFavoritesUseCase;
  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase _removeFromFavoritesUseCase;

  List<HomeProductEntity> favorites = [];

  FavoritesCubit(
    this._getAllFavoritesUseCase,
    this._addToFavoritesUseCase,
    this._removeFromFavoritesUseCase,
  ) : super(FavoritesInitial());

  Future<void> getAllFavorites() async {
    emit(FavoritesLoading());
    final response = await _getAllFavoritesUseCase.execute();

    response.fold(
      (serverFailure) {
        emit(ErrorState(serverFailure));
      },
      (products) {
        if (products.isEmpty) {
          emit(FavoritesEmpty());
        } else {
          favorites = products;
          emit(FavoritesLoaded(products));
        }
      },
    );
  }

  Future<void> addToFavorites(String id) async {
    final response = await _addToFavoritesUseCase.execute(id);

    response.fold(
      (serverFailure) {
        emit(ErrorState(serverFailure));
      },
      (message) {
        emit(AddToFavoritesSuccess(message));
        getAllFavorites();
      },
    );
  }

  Future<void> removeFromFavorites(String id) async {
    final response = await _removeFromFavoritesUseCase.execute(id);

    response.fold(
      (serverFailure) {
        emit(ErrorState(serverFailure));
      },
      (message) {
        emit(RemoveFromFavoritesSuccess(message));
        getAllFavorites();
      },
    );
  }

  bool isFavorite(String id) {
    return favorites.any((element) => element.id == id);
  }
}
