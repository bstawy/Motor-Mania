import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/caching/tokens_manager.dart';
import '../../../../core/networking/failure/server_failure.dart';
import '../../../product_details/domain/repos/product_repo.dart';
import '../../domain/entities/cart_product_entity.dart';
import '../../domain/repos/cart_repo.dart';
import '../data_sources/cart_data_sources.dart';
import '../data_sources/cart_local_data_source.dart';
import '../models/cart_product_model.dart';

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
  Future<Either<ServerFailure, List<CartProductEntity>>>
      getCartProducts() async {
    final token = await TokensManager.getAccessToken() ?? "";

    List<CartProductEntity> cachedCart = await _localDataSource.getCachedList();
    debugPrint("cachedCart with no token: $cachedCart");

    if (token.isEmpty) {
      return Right(cachedCart);
    }

    final response = await _remoteDataSource.getCartProducts();

    if (response.statusCode == 200) {
      final List<CartProductEntity> cartProducts =
          (response.data['data'] as List)
              .map(
                (product) => CartProductModel.fromJson(product),
              )
              .toList();

      List<CartProductEntity> allCartProducts = cartProducts;

      for (final CartProductEntity product in cachedCart) {
        if (!cartProducts.any(
            (cartProduct) => cartProduct.product.id == product.product.id)) {
          await addProduct(product.product.id!, product.quantity);
          allCartProducts.add(product as CartProductModel);
        }
      }

      await _localDataSource.clearCart();
      await _localDataSource.cacheList(allCartProducts);
      debugPrint("cachedCart: $cachedCart");
      debugPrint("cartProducts: $cartProducts");
      debugPrint("allCartProducts: $allCartProducts");

      return Right(allCartProducts);
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, String>> addProduct(
    String productId,
    int quantity,
  ) async {
    final token = await TokensManager.getAccessToken() ?? "";

    if (token.isEmpty) {
      final response = await _productRepo.getProductDetails(productId);

      return response.fold(
        (failure) => Left(ServerFailure()),
        (product) async {
          List<CartProductEntity> cachedList =
              await _localDataSource.getCachedList();
          debugPrint("cachedList: $cachedList");
          if (cachedList.isEmpty) {
            final newProduct = CartProductEntity(
              product: product,
              quantity: quantity,
            );
            await _localDataSource.cacheItem(newProduct);
            return const Right("Added to cart");
          }
          bool isNew = true;

          cachedList.map((cartProduct) async {
            if (cartProduct.product.id == productId) {
              await _localDataSource.updateProductQuantity(productId, quantity);
              isNew = false;
            }
          }).toList();

          if (isNew) {
            final newProduct = CartProductEntity(
              product: product,
              quantity: quantity,
            );
            await _localDataSource.cacheItem(newProduct);
          }

          return const Right("Added to cart");
        },
      );
    } else {
      final response = await _remoteDataSource.addProduct(
        productId,
        quantity,
      );

      if (response.statusCode == 200) {
        final response = await _productRepo.getProductDetails(productId);
        return response.fold((failure) => Left(ServerFailure()),
            (product) async {
          final newProduct = CartProductEntity(
            product: product,
            quantity: quantity,
          );
          await _localDataSource.cacheItem(newProduct);
          return const Right('Product added to cart successfully');
        });
      } else {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<ServerFailure, String>> removeProduct(String productId) async {
    final token = await TokensManager.getAccessToken() ?? "";

    if (token.isEmpty) {
      _localDataSource.removeProduct(productId);

      return const Right('Product removed from cart successfully');
    }

    final response = await _remoteDataSource.removeProduct(productId);

    if (response.statusCode == 200) {
      _localDataSource.removeProduct(productId);

      return const Right('Product removed from cart successfully');
    } else {
      return Left(ServerFailure());
    }
  }
}
