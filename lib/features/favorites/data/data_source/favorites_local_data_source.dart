import '../../../../core/caching/hive_manager.dart';
import '../../../../core/config/constants/caching_constants.dart';
import '../../../home/domain/entities/home_product_entity.dart';

class FavoritesLocalDataSource {
  final HiveManager _hiveManager;

  FavoritesLocalDataSource(this._hiveManager);

  cacheFavoritesList(List<HomeProductEntity> favorites) {
    _hiveManager.cacheDataList<HomeProductEntity>(
      boxKey: HiveBoxKeys.favorites,
      data: favorites,
    );
  }

  cacheFavoritesItem(HomeProductEntity product) {
    _hiveManager.cacheDataItem<HomeProductEntity>(
      boxKey: HiveBoxKeys.favorites,
      data: product,
    );
  }

  Future<List<HomeProductEntity>> getCachedFavoritesList() async {
    return _hiveManager.retrieveData<HomeProductEntity>(HiveBoxKeys.favorites);
  }

  Future<bool> isFavorite(String productId) async {
    final favorites = await getCachedFavoritesList();
    return favorites.any((product) => product.id == productId);
  }

  void removeFavorite(String productId) async {
    final List<HomeProductEntity> favorites = await getCachedFavoritesList();
    int index = favorites.indexWhere((product) => product.id == productId);
    _hiveManager.clearItem<HomeProductEntity>(
      boxKey: HiveBoxKeys.favorites,
      index: index,
    );
  }

  void clearFavorites() {
    _hiveManager.clearData<HomeProductEntity>(HiveBoxKeys.favorites);
  }
}
