import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../entities/cart_product_entity.dart';
import '../entities/coupon_entity.dart';

abstract class CartRepo {
  Future<ApiResult<List<CartProductEntity>?>> getCartProducts();
  Future<ApiResult<void>> addProduct(
    ProductEntity product,
    int quantity,
  );
  Future<ApiResult<void>> removeProduct(int productId);

  Future<ApiResult<CouponEntity?>> applyCoupon(
    String couponCode,
    num cartTotal,
  );
}
