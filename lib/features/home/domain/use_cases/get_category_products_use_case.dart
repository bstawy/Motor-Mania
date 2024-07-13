import 'package:dartz/dartz.dart';

import '../entities/product_entity.dart';
import '../repos/categories_repo.dart';

class GetCategoryProductsUseCase {
  final CategoriesRepo _categoriesRepo;

  GetCategoryProductsUseCase(this._categoriesRepo);

  Future<Either<String, List<ProductEntity>>> execute(int categoryId) async {
    return await _categoriesRepo.getCategoryProducts(categoryId);
  }
}
