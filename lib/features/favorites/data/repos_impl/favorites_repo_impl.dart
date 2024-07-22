import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/data/models/home_product_model.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../../domain/repos/favorites_repo.dart';
import '../data_source/favorites_remote_data_source.dart';

class FavoritesRepoImpl extends FavoritesRepo {
  final FavoritesRemoteDataSource _favoritesRemoteDataSource;

  FavoritesRepoImpl(this._favoritesRemoteDataSource);

  @override
  Future<Either<ServerFailure, List<HomeProductEntity>>>
      getAllFavorites() async {
    try {
      final response = await _favoritesRemoteDataSource.getAllFavorites();

      if (response.statusCode == 200) {
        final List<HomeProductEntity> favorites =
            (response.data['data'] as List)
                .map((product) => HomeProductModel.fromJson(product))
                .toList();
        return Right(favorites);
      }

      return Left(
        ServerFailure(
          statusCode: response.statusCode.toString(),
          message: response.data['message'],
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          statusCode: '500',
          message: 'Internal Server Error',
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, String>> addToFavorites(String id) async {
    try {
      final response = await _favoritesRemoteDataSource.addToFavorites(id);

      if (response.statusCode == 200) {
        return Right(response.data['message']);
      }
      return Left(
        ServerFailure(
          statusCode: response.statusCode.toString(),
          message: response.data['message'],
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          statusCode: '500',
          message: 'Internal Server Error',
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, String>> removeFromFavorites(String id) async {
    try {
      final response = await _favoritesRemoteDataSource.removeFromFavorites(id);

      if (response.statusCode == 200) {
        return Right(response.data['message']);
      }
      return Left(
        ServerFailure(
          statusCode: response.statusCode.toString(),
          message: response.data['message'],
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          statusCode: '500',
          message: 'Internal Server Error',
        ),
      );
    }
  }
}
