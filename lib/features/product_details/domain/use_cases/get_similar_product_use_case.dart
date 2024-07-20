import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../repos/product_repo.dart';

class GetSimilarProductUseCase {
  final ProductRepo _productRepo;

  GetSimilarProductUseCase(this._productRepo);

  Future<Either<ServerFailure, List<HomeProductEntity>>> execute() async {
    final response = await _productRepo.getSimilarProducts();

    return response.fold(
      (serverFailure) => Left(serverFailure),
      (products) {
        products = products.take(5).toList();

        final homeProducts = products.map((product) {
          final finalPrice = calculateFinalPrice(
            product.oldPrice!,
            product.discountPercentage!,
          );
          return product.copyWith(price: finalPrice);
        }).toList();

        return Right(homeProducts);
      },
    );
  }

  double calculateFinalPrice(num oldPrice, num discountPercentage) {
    return oldPrice - (oldPrice * discountPercentage / 100);
  }
}
