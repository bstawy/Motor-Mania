import 'package:dartz/dartz.dart';

import '../entities/product_entity.dart';
import '../repos/products_repo.dart';

class GetAllProductsUseCase {
  final ProductsRepo _productsRepo;

  GetAllProductsUseCase(this._productsRepo);

  Future<Either<String, List<ProductEntity>>> execute() async {
    return await _productsRepo.getProducts();
  }
}
