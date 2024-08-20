import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<ServerFailure, ProductEntity>> getProductDetails(int id);
}
