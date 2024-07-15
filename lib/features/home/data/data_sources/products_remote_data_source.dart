import 'package:dartz/dartz.dart';
import 'package:motor_mania/features/home/domain/entities/product_entity.dart';

import '../models/all_products_response_model.dart';

abstract class ProductsRemoteDataSource {
  Future<Either<String, AllProductsResponseModel>> getAllProducts();

  Future<Either<String, ProductEntity>> getProductDetails(int id);
}
