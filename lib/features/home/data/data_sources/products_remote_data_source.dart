import 'package:dartz/dartz.dart';

import '../models/all_products_response_model.dart';

abstract class ProductsRemoteDataSource {
  Future<Either<String, AllProductsResponseModel>> getAllProducts();
}
