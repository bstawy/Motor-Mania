import 'package:dartz/dartz.dart';

import '../../../../core/helpers/calc_product_final_price.dart';
import '../../../../core/networking/failure/server_failure.dart';
import '../entities/cart_product_entity.dart';
import '../repos/cart_repo.dart';

class GetCartProductsUseCase {
  final CartRepo _cartRepository;

  GetCartProductsUseCase(this._cartRepository);

  Future<Either<ServerFailure, List<CartProductEntity>>> execute() async {
    final response = await _cartRepository.getCartProducts();

    return response.fold((failure) => Left(failure), (cartProducts) {
      final List<CartProductEntity> products = cartProducts.map((product) {
        final finalPrice = calculateFinalPrice(
          product.product.oldPrice!,
          product.product.discountPercentage!,
        );
        return product.copyWith(
          product: product.product.copyWith(
            price: finalPrice,
          ),
        );
      }).toList();

      return Right(products);
    });
  }
}
