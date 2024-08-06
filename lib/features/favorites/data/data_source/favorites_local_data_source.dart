import '../../../../core/caching/hive_manager.dart';
import '../../../../core/config/constants/caching_constants.dart';
import '../../../home/domain/entities/home_product_entity.dart';

class FavoritesLocalDataSource {
  final HiveManager _hiveManager;

  FavoritesLocalDataSource(this._hiveManager);

  Future<void> cacheFavoritesList(List<HomeProductEntity> favorites) async {
    await _hiveManager.cacheDataList<HomeProductEntity>(
      boxKey: HiveBoxKeys.favorites,
      data: favorites,
    );
  }

  Future<void> cacheFavoritesItem(HomeProductEntity product) async {
    await _hiveManager.cacheDataItem<HomeProductEntity>(
      boxKey: HiveBoxKeys.favorites,
      data: product,
    );
  }

  Future<List<HomeProductEntity>> getCachedFavoritesList() async {
    return await _hiveManager
        .retrieveData<HomeProductEntity>(HiveBoxKeys.favorites);
  }

  Future<void> removeFavorite(String productId) async {
    final List<HomeProductEntity> favorites = await getCachedFavoritesList();
    int index = favorites.indexWhere((product) => product.id == productId);
    await _hiveManager.clearItem<HomeProductEntity>(
      boxKey: HiveBoxKeys.favorites,
      index: index,
    );
  }

  Future<void> clearFavorites() async {
    await _hiveManager.clearData<HomeProductEntity>(HiveBoxKeys.favorites);
  }
}
