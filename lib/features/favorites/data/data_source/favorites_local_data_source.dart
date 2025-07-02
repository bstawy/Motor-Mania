import '../../../../core/caching/hive_manager.dart';
import '../../../../core/config/constants/app_constant_keys.dart';
import '../../../product_details/domain/entities/product_entity.dart';

class FavoritesLocalDataSource {
  final HiveManager _hiveManager;

  FavoritesLocalDataSource(this._hiveManager);

  Future<void> cacheFavoritesList(List<ProductEntity> favorites) async {
    await _hiveManager.cacheDataList<ProductEntity>(
      boxKey: HiveBoxKeys.favorites,
      data: favorites,
    );
  }

  Future<void> cacheFavoritesItem(ProductEntity product) async {
    await _hiveManager.cacheDataItem<ProductEntity>(
      boxKey: HiveBoxKeys.favorites,
      data: product,
    );
  }

  Future<List<ProductEntity>> getCachedFavoritesList() async {
    return await _hiveManager
        .retrieveData<ProductEntity>(HiveBoxKeys.favorites);
  }

  Future<void> removeFavorite(int productId) async {
    final List<ProductEntity> favorites = await getCachedFavoritesList();
    int index = favorites.indexWhere((product) => product.id == productId);
    await _hiveManager.clearItem<ProductEntity>(
      boxKey: HiveBoxKeys.favorites,
      index: index,
    );
  }

  Future<void> clearFavorites() async {
    await _hiveManager.clearData<ProductEntity>(HiveBoxKeys.favorites);
  }
}
