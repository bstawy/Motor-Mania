import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/caching/tokens_manager.dart';
import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/data/models/home_product_model.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../../domain/repos/favorites_repo.dart';
import '../data_source/favorites_data_sources.dart';
import '../data_source/favorites_local_data_source.dart';

class FavoritesRepoImpl extends FavoritesRepo {
  final FavoritesDataSources _remoteDataSource;
  final FavoritesLocalDataSource _localDataSource;

  FavoritesRepoImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<ServerFailure, List<HomeProductEntity>>>
      getAllFavorites() async {
    try {
      final token = await TokensManager.getAccessToken() ?? "";

      List<HomeProductEntity> cachedFavorites =
          await _localDataSource.getCachedFavoritesList();
      debugPrint("cachedFavorites with no token: $cachedFavorites");

      if (token.isEmpty) {
        return Right(cachedFavorites);
      }

      final response = await _remoteDataSource.getAllFavorites();

      if (response.statusCode == 200) {
        final List<HomeProductEntity> favorites =
            (response.data['data'] as List)
                .map((product) => HomeProductModel.fromJson(product))
                .toList();
        List<HomeProductEntity> allFavorites = favorites;

        for (final fav in cachedFavorites) {
          if (!favorites.any((product) => product.id == fav.id)) {
            await addToFavorites(fav);
            allFavorites.add(fav);
          }
        }

        await _localDataSource.clearFavorites();
        await _localDataSource.cacheFavoritesList(allFavorites);
        debugPrint("cachedFavorites: $cachedFavorites");
        debugPrint("favorites: $favorites");
        debugPrint("allFavorites: $allFavorites");

        return Right(allFavorites);
      }

      return Left(
        ServerFailure(
          statusCode: response.statusCode,
          message: response.data['message'],
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          statusCode: 500,
          message: 'Internal Server Error',
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, String>> addToFavorites(dynamic product) async {
    try {
      final token = await TokensManager.getAccessToken() ?? "";

      if (token.isEmpty) {
        final HomeProductEntity favProduct = HomeProductEntity(
          id: product.id,
          name: product.name,
          price: product.price,
          imageUrl: product.imageUrl,
          amount: product.amount,
          discountPercentage: product.discountPercentage,
          oldPrice: product.oldPrice,
          rating: product.rating,
          reviewsCount: product.reviewsCount,
          isFavorite: true,
          newProduct: product.newProduct,
          freeDelivery: product.freeDelivery,
          compatibleCars: product.compatibleCars,
        );
        await _localDataSource.cacheFavoritesItem(favProduct);
        return const Right("Added to favorites");
      } else {
        final response = await _remoteDataSource.addToFavorites(product);

        if (response.statusCode == 200) {
          return Right(response.data['message']);
        }
        return Left(
          ServerFailure(
            statusCode: response.statusCode,
            message: response.data['message'],
          ),
        );
      }
    } catch (e) {
      return Left(
        ServerFailure(
          statusCode: 500,
          message: 'Internal Server Error',
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, String>> removeFromFavorites(int id) async {
    try {
      final token = await TokensManager.getAccessToken() ?? "";
      if (token.isEmpty) {
        await _localDataSource.removeFavorite(id);

        return const Right('Product removed from Favorites successfully');
      }

      final response = await _remoteDataSource.removeFromFavorites(id);

      if (response.statusCode == 200) {
        _localDataSource.removeFavorite(id);

        return Right(response.data['message']);
      }
      return Left(
        ServerFailure(
          statusCode: response.statusCode,
          message: response.data['message'],
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          statusCode: 500,
          message: 'Internal Server Error',
        ),
      );
    }
  }
}
