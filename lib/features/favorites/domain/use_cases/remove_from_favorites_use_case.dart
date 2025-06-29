import '../../../../core/networking/api_result.dart';
import '../repos/favorites_repo.dart';

class RemoveFromFavoritesUseCase {
  final FavoritesRepo _favoritesRepo;

  RemoveFromFavoritesUseCase(this._favoritesRepo);

  Future<ApiResult<void>> call(int id) async {
    return await _favoritesRepo.removeFromFavorites(id);
  }
}
