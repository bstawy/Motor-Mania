import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../repos/category_repository.dart';

class GetCategoryProductsUseCases {
  final CategoryRepository _categoryRepository;

  GetCategoryProductsUseCases(this._categoryRepository);

  Future<Either<ServerFailure, List<HomeProductEntity>>> execute(
      int categoryId) async {
    final response = await _categoryRepository.getCategoryProducts(categoryId);

    return response.fold((serverFailure) => Left(serverFailure), (data) {
      List<HomeProductEntity> categoryProducts = data.map((product) {
        final finalPrice = calculateFinalPrice(
          product.oldPrice!,
          product.discountPercentage!,
        );
        return product.copyWith(price: finalPrice);
      }).toList();

      return Right(categoryProducts);
    });
  }

  double calculateFinalPrice(num oldPrice, num discountPercentage) {
    return oldPrice - (oldPrice * discountPercentage / 100);
  }
}
