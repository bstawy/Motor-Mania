import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/domain/entities/home_product_entity.dart';

abstract class FavoritesRepo {
  Future<Either<ServerFailure, List<HomeProductEntity>>> getAllFavorites();
  Future<Either<ServerFailure, String>> addToFavorites(String id);
  Future<Either<ServerFailure, String>> removeFromFavorites(String id);
}
