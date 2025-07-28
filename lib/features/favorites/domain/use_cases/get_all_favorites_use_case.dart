import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../repos/favorites_repo.dart';

class GetAllFavoritesUseCase {
  final FavoritesRepo _favoritesRepo;

  GetAllFavoritesUseCase(this._favoritesRepo);

  Future<ApiResult<List<ProductEntity>?>> call() async {
    return await _favoritesRepo.getAllFavorites();
  }
}
