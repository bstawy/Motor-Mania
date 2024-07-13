import 'package:dartz/dartz.dart';

import '../entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<String, List<ProductEntity>>> getProducts();
}
