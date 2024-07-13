import 'package:dartz/dartz.dart';

import '../models/all_categories_response_model.dart';
import '../models/all_products_response_model.dart';

abstract class CategoriesRemoteDataSource {
  Future<Either<String, AllCategoriesResponseModel>> getAllCategories();
  Future<Either<String, AllProductsResponseModel>> getCategoryProducts(
      int categoryId);
}
