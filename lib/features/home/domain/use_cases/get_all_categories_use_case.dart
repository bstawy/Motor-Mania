import 'package:dartz/dartz.dart';

import '../entities/category_entity.dart';
import '../repos/categories_repo.dart';

class GetAllCategoriesUseCase {
  final CategoriesRepo _categoriesRepo;

  GetAllCategoriesUseCase(this._categoriesRepo);

  Future<Either<String, List<Category>>> execute() async {
    return await _categoriesRepo.getAllCategories();
  }
}
