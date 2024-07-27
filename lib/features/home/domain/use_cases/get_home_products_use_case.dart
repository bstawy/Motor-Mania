import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../entities/home_product_entity.dart';
import '../repos/home_repo.dart';

class GetHomeProductsUseCase {
  final HomeRepo _homeRepo;

  GetHomeProductsUseCase(this._homeRepo);

  Future<Either<ServerFailure, List<HomeProductEntity>>> execute() async {
    List<HomeProductEntity> homeProducts = [];

    final response = await _homeRepo.getHomeProducts();

    return response.fold(
      (serverFailure) => Left(serverFailure),
      (products) {
        homeProducts = products.map((product) {
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
