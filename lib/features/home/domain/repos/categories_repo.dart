import 'package:dartz/dartz.dart';

import '../entities/category_entity.dart';
import '../entities/product_entity.dart';

abstract class CategoriesRepo {
  Future<Either<String, List<Category>>> getAllCategories();

  Future<Either<String, List<ProductEntity>>> getCategoryProducts(
      int categoryId);
}
