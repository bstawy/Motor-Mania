import 'package:dartz/dartz.dart';

import '../entities/category_entity.dart';

abstract class CategoriesRepo {
  Future<Either<String, List<Category>>> getAllCategories();
}
