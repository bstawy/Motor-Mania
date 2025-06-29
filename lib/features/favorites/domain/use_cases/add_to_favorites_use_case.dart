import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../repos/favorites_repo.dart';

class AddToFavoritesUseCase {
  final FavoritesRepo _favoritesRepo;

  AddToFavoritesUseCase(this._favoritesRepo);

  Future<ApiResult<void>> execute(ProductEntity product) async {
    return await _favoritesRepo.addToFavorites(product);
  }
}
