import '../../../../core/helpers/enums/coupon_types_enum.dart';
import '../../domain/entities/coupon_entity.dart';

class CouponModel extends CouponEntity {
  const CouponModel({
    required super.couponCode,
    required super.discountAmount,
    required super.couponType,
    required super.couponValue,
    required super.freeShipping,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      couponCode: json['coupon_code'],
      discountAmount: json['discount_amount'],
      couponType: CouponTypeExtension.fromString(json['coupon_type']),
      couponValue: json['coupon_value'],
      freeShipping: json['free_shipping'],
    );
  }
}
