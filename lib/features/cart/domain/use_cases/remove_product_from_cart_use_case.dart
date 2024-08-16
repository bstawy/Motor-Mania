import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../repos/cart_repo.dart';

class RemoveProductFromCartUseCase {
  final CartRepo _cartRepo;

  RemoveProductFromCartUseCase(this._cartRepo);

  Future<Either<ServerFailure, String>> execute(int productId) async {
    return _cartRepo.removeProduct(productId);
  }
}
