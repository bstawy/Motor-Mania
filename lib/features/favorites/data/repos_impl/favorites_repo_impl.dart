import '../../../../core/caching/tokens_manager.dart';
import '../../../../core/networking/api_result.dart';
import '../../../product_details/data/models/product_model.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../../domain/repos/favorites_repo.dart';
import '../data_source/favorites_data_sources.dart';
import '../data_source/favorites_local_data_source.dart';

class FavoritesRepoImpl extends FavoritesRepo {
  final FavoritesDataSources _remoteDataSource;
  final FavoritesLocalDataSource _localDataSource;

  FavoritesRepoImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<ApiResult<List<ProductEntity>?>> getAllFavorites() async {
    // 1- Get the local cached favorites in case of guest mode
    List<ProductEntity> cachedFavorites =
        await _localDataSource.getCachedFavoritesList();

    final token = await TokensManager.getAccessToken() ?? "";

    if (token.isEmpty) {
      return Success(cachedFavorites);
    }

    // 2- Get logged user favorites from server
    final response = await _remoteDataSource.getAllFavorites();

    return response.fold((failure) {
      // Return the cached favorites in case of failure
      return Success(cachedFavorites);
    }, (success) async {
      final List<ProductEntity> remoteFavorites =
          (success.data.data['data'] as List)
              .map((product) => ProductModel.fromJson(product) as ProductEntity)
              .toList();

      // Merge remote favorites with cached favorites
      List<ProductEntity> allFavorites =
          List<ProductEntity>.from(remoteFavorites);

      if (remoteFavorites != cachedFavorites) {
        for (final fav in cachedFavorites) {
          if (!remoteFavorites.any((product) => product.id == fav.id)) {
            await addToFavorites(fav);
            allFavorites.add(fav);
          }
        }
      }
      // Clear the local cache and store the merged favorites
      await _localDataSource.clearFavorites();
      await _localDataSource.cacheFavoritesList(allFavorites);

      return Success(allFavorites);
    });
  }

  @override
  Future<ApiResult<void>> addToFavorites(ProductEntity product) async {
    final token = await TokensManager.getAccessToken() ?? "";

    if (token.isEmpty) {
      await _localDataSource.cacheFavoritesItem(product);
      return Success(null);
    } else {
      final response = await _remoteDataSource.addToFavorites(product);
      return response;
    }
  }

  @override
  Future<ApiResult<void>> removeFromFavorites(int id) async {
    final token = await TokensManager.getAccessToken() ?? "";

    if (token.isEmpty) {
      await _localDataSource.removeFavorite(id);

      return Success(null);
    } else {
      final response = await _remoteDataSource.removeFromFavorites(id);

      return response.fold((failure) async {
        return Failure(failure.exception);
      }, (success) async {
        await _localDataSource.removeFavorite(id);
        return Success(null);
      });
    }
  }
}
