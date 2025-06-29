import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../entities/coupon_entity.dart';
import '../repos/cart_repo.dart';

class ApplyCouponUseCase {
  final CartRepo _cartRepo;

  ApplyCouponUseCase(this._cartRepo);

  Future<Either<ServerFailure, CouponEntity>> execute(
      {required String couponCode, required num cartTotal}) async {
    return await _cartRepo.applyCoupon(couponCode, cartTotal);
  }
}
