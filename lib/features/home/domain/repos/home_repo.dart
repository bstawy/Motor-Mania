import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../entities/car_entity.dart';
import '../entities/category_entity.dart';
import '../entities/home_product_entity.dart';
import '../entities/offer_entity.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, CarEntity>> getUserCar();
  Future<Either<ServerFailure, List<HomeCategoryEntity>>> getHomeCategories();
  Future<Either<ServerFailure, List<HomeProductEntity>>> getHomeProducts();
  Future<Either<ServerFailure, List<OfferEntity>>> getHomeOffers();
}
