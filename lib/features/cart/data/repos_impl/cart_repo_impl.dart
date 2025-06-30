import 'package:motor_mania/features/cart/data/models/cart_product_model.dart';
import 'package:motor_mania/features/product_details/domain/entities/product_entity.dart';

import '../../../../core/caching/tokens_manager.dart';
import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/repos/product_repo.dart';
import '../../domain/entities/cart_product_entity.dart';
import '../../domain/entities/coupon_entity.dart';
import '../../domain/repos/cart_repo.dart';
import '../data_sources/cart_data_sources.dart';
import '../data_sources/cart_local_data_source.dart';
import '../models/coupon_model.dart';

class CartRepoImpl implements CartRepo {
  final CartDataSources _remoteDataSource;
  final CartLocalDataSource _localDataSource;
  final ProductRepo _productRepo;

  CartRepoImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._productRepo,
  );

  @override
  Future<ApiResult<List<CartProductEntity>?>> getCartProducts() async {
    // 1- Get the local cached cart in case of guest mode
    List<CartProductEntity> cachedCart = await _localDataSource.getCachedList();

    final token = await TokensManager.getAccessToken() ?? "";

    if (token.isEmpty) {
      return Success(cachedCart);
    }

    // 2- Get logged user cart from server
    final response = await _remoteDataSource.getCartProducts();

    return response.fold((failure) {
      // Return the cached cart in case of failure
      return Success(cachedCart);
    }, (success) async {
      final List<CartProductEntity> remoteCart =
          (success.data.data['data'] as List)
              .map((product) => CartProductModel.fromJson(product))
              .toList();

      // Merge remote cart with cached cart
      List<CartProductEntity> allCartProducts = remoteCart;

      if (remoteCart != cachedCart) {
        for (final cachedProduct in cachedCart) {
          if (!remoteCart.any((cartProduct) =>
              cartProduct.product.id == cachedProduct.product.id)) {
            await addProduct(cachedProduct.product, cachedProduct.quantity);

            allCartProducts.add(cachedProduct);
          }
        }
      }

      // Clear the local cache and store the merged cart
      await _localDataSource.clearCart();
      await _localDataSource.cacheList(allCartProducts);

      return Success(allCartProducts);
    });
  }

  @override
  Future<ApiResult<void>> addProduct(
      ProductEntity product, int quantity) async {
    final CartProductEntity cartProduct =
        CartProductEntity(quantity: quantity, product: product);

    final token = await TokensManager.getAccessToken() ?? "";

    if (token.isEmpty) {
      await _localDataSource.cacheItem(cartProduct);
      return Success(null);
    } else {
      final response =
          await _remoteDataSource.addProduct(product.id ?? 0, quantity);
      return response;
    }
  }

  @override
  Future<ApiResult<void>> removeProduct(int productId) async {
    final token = await TokensManager.getAccessToken() ?? "";

    if (token.isEmpty) {
      await _localDataSource.removeProduct(productId);

      return Success(null);
    } else {
      final response = await _remoteDataSource.removeProduct(productId);

      return response.fold((failure) async {
        return Failure(failure.exception);
      }, (success) async {
        await _localDataSource.removeProduct(productId);
        return Success(null);
      });
    }
  }

  @override
  Future<ApiResult<CouponEntity?>> applyCoupon(
      String couponCode, num cartTotal) async {
    final response = await _remoteDataSource.applyCoupon(
      couponCode: couponCode,
      cartTotal: cartTotal,
    );

    return response.fold((failure) async {
      return Failure(failure.exception);
    }, (success) async {
      final jsonCoupon = success.data.data['data'];

      final CouponEntity coupon = CouponModel.fromJson(jsonCoupon);

      return Success(coupon);
    });
  }
}
