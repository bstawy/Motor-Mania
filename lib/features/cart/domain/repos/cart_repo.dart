import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../entities/cart_product_entity.dart';

abstract class CartRepo {
  Future<Either<ServerFailure, List<CartProductEntity>>> getCartProducts();
  Future<Either<ServerFailure, String>> addProduct(
    int productId,
    int quantity,
  );
  Future<Either<ServerFailure, String>> removeProduct(int productId);
}
