import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../entities/product_entity.dart';
import '../repos/product_repo.dart';

class GetProductDetailsUseCase {
  final ProductRepo _productRepo;

  GetProductDetailsUseCase(this._productRepo);

  Future<Either<ServerFailure, ProductEntity>> execute(String id) async {
    return await _productRepo.getProductDetails(id);
  }
}
