import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../../domain/use_cases/add_to_favorites_use_case.dart';
import '../../domain/use_cases/get_all_favorites_use_case.dart';
import '../../domain/use_cases/remove_from_favorites_use_case.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final GetAllFavoritesUseCase _getAllFavoritesUseCase;
  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase _removeFromFavoritesUseCase;

  List<ProductEntity> favorites = [];

  FavoritesCubit(
    this._getAllFavoritesUseCase,
    this._addToFavoritesUseCase,
    this._removeFromFavoritesUseCase,
  ) : super(FavoritesInitial());

  Future<void> getAllFavorites() async {
    emit(FavoritesLoading());

    final response = await _getAllFavoritesUseCase.execute();

    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(FavoritesError(error));
      },
      (success) {
        if (success.data?.isEmpty ?? true) {
          emit(FavoritesEmpty());
        } else {
          favorites = success.data!;
          emit(FavoritesLoaded(success.data));
        }
      },
    );
  }

  Future<void> addToFavorites(dynamic product) async {
    emit(AddToFavoritesLoading());

    final response = await _addToFavoritesUseCase.execute(product);

    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(AddToFavoritesFailure(error));
      },
      (success) {
        emit(AddToFavoritesSuccess());
        getAllFavorites();
      },
    );
  }

  Future<void> removeFromFavorites(int id) async {
    emit(RemoveFromFavoritesLoading());

    final response = await _removeFromFavoritesUseCase.execute(id);

    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(RemoveFromFavoritesFailure(error));
      },
      (message) {
        emit(RemoveFromFavoritesSuccess());
        getAllFavorites();
      },
    );
  }

  bool isFavorite(int id) {
    return favorites.map((product) => product.id).toList().contains(id);
  }
}
