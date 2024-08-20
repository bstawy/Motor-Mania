import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../entities/product_entity.dart';
import '../repos/product_repo.dart';

class GetProductDetailsUseCase {
  final ProductRepo _productRepo;

  GetProductDetailsUseCase(this._productRepo);

  Future<Either<ServerFailure, ProductEntity>> execute(int id) async {
    final response = await _productRepo.getProductDetails(id);

    return response.fold((failure) => Left(failure), (product) {
      final finalPrice = calculateFinalPrice(
        product.oldPrice!,
        product.discountPercentage!,
      );

      return Right(product.copyWith(price: finalPrice));
    });
  }

  double calculateFinalPrice(num oldPrice, num discountPercentage) {
    return oldPrice - (oldPrice * discountPercentage / 100);
  }
}
