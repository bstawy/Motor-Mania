import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<ServerFailure, ProductEntity>> getProductDetails(String id);

  Future<Either<ServerFailure, List<HomeProductEntity>>> getSimilarProducts();
}
