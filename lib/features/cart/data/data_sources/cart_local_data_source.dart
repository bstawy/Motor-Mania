import '../../../../core/caching/hive_manager.dart';
import '../../../../core/config/constants/app_constants.dart';
import '../../domain/entities/cart_product_entity.dart';

class CartLocalDataSource {
  final HiveManager _hiveManager;

  CartLocalDataSource(this._hiveManager);

  Future<void> cacheList(List<CartProductEntity> cartProduct) async {
    await _hiveManager.cacheDataList<CartProductEntity>(
      boxKey: HiveBoxKeys.cart,
      data: cartProduct,
    );
  }

  Future<void> cacheItem(CartProductEntity product) async {
    await _hiveManager.cacheDataItem<CartProductEntity>(
      boxKey: HiveBoxKeys.cart,
      data: product,
    );
  }

  Future<List<CartProductEntity>> getCachedList() async {
    return await _hiveManager.retrieveData<CartProductEntity>(HiveBoxKeys.cart);
  }

  Future<void> removeProduct(int productId) async {
    final List<CartProductEntity> cart = await getCachedList();
    int index =
        cart.indexWhere((cartProduct) => cartProduct.product.id == productId);
    await _hiveManager.clearItem<CartProductEntity>(
      boxKey: HiveBoxKeys.cart,
      index: index,
    );
  }

  Future<void> updateProductQuantity(int productId, int newQuantity) async {
    final List<CartProductEntity> cart = await getCachedList();
    int index =
        cart.indexWhere((cartProduct) => cartProduct.product.id == productId);

    if (index != -1) {
      final List<CartProductEntity> products = cart.map((element) {
        if (element.product.id == productId) {
          return element.copyWith(quantity: element.quantity + newQuantity);
        } else {
          return element;
        }
      }).toList();

      await clearCart();
      await _hiveManager.cacheDataList<CartProductEntity>(
        boxKey: HiveBoxKeys.cart,
        data: products,
      );
    }
  }

  Future<void> clearCart() async {
    await _hiveManager.clearData<CartProductEntity>(HiveBoxKeys.cart);
  }
}
