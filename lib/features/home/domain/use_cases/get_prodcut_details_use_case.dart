import 'package:dartz/dartz.dart';

import '../entities/product_entity.dart';
import '../repos/products_repo.dart';

class GetProdcutDetailsUseCase {
  final ProductsRepo _productsRepo;

  GetProdcutDetailsUseCase(this._productsRepo);

  Future<Either<String, ProductEntity>> execute(int id) async {
    return await _productsRepo.getProductDetails(id);
  }
}
