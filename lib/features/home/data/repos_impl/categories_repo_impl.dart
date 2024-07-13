import 'package:dartz/dartz.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repos/categories_repo.dart';
import '../data_sources/categories_remote_data_source.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;

  CategoriesRepoImpl(this._categoriesRemoteDataSource);

  @override
  Future<Either<String, List<Category>>> getAllCategories() async {
    final response = await _categoriesRemoteDataSource.getAllCategories();

    return response.fold(
      (error) => Left(error),
      (allCategoriesResponse) {
        final categories = allCategoriesResponse.categories
            .map((category) => Category(
                  id: category.id,
                  name: category.name,
                  imageUrl: category.imageUrl,
                ))
            .toList();

        return Right(categories);
      },
    );
  }

  @override
  Future<Either<String, List<ProductEntity>>> getCategoryProducts(
      int categoryId) async {
    final response =
        await _categoriesRemoteDataSource.getCategoryProducts(categoryId);

    return response.fold(
      (error) => Left(error),
      (categoryProductsResponse) {
        final products = categoryProductsResponse.products;

        return Right(products);
      },
    );
  }
}
