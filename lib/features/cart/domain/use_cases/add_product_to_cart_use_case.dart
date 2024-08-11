import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../repos/cart_repo.dart';

class AddProductToCartUseCase {
  final CartRepo _cartRepo;

  AddProductToCartUseCase(this._cartRepo);

  Future<Either<ServerFailure, String>> execute(
      String productId, int quantity) async {
    return await _cartRepo.addProduct(productId, quantity);
  }
}
