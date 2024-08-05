import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/domain/entities/home_product_entity.dart';

abstract class FavoritesRepo {
  Future<Either<ServerFailure, List<HomeProductEntity>>> getAllFavorites();
  Future<Either<ServerFailure, String>> addToFavorites(dynamic product);
  Future<Either<ServerFailure, String>> removeFromFavorites(String id);
}
