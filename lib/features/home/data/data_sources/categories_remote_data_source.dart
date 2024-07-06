import 'package:dartz/dartz.dart';

import '../models/all_categories_response_model.dart';

abstract class CategoriesRemoteDataSource {
  Future<Either<String, AllCategoriesResponseModel>> getAllCategories();
}
