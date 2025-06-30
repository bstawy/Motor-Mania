import '../../../../core/networking/api_result.dart';
import '../entities/coupon_entity.dart';
import '../repos/cart_repo.dart';

class ApplyCouponUseCase {
  final CartRepo _cartRepo;

  ApplyCouponUseCase(this._cartRepo);

  Future<ApiResult<CouponEntity?>> call(
      {required String couponCode, required num cartTotal}) async {
    return await _cartRepo.applyCoupon(couponCode, cartTotal);
  }
}
