import 'package:equatable/equatable.dart';

import '../../../../core/helpers/enums/coupon_types_enum.dart';

class CouponEntity extends Equatable {
  final String couponCode;
  final num discountAmount;
  final CouponType couponType;
  final num couponValue;
  final bool freeShipping;

  const CouponEntity({
    required this.couponCode,
    required this.discountAmount,
    required this.couponType,
    required this.couponValue,
    required this.freeShipping,
  });

  CouponEntity copyWith({
    String? couponCode,
    num? discountAmount,
    CouponType? couponType,
    num? couponValue,
    bool? freeShipping,
  }) {
    return CouponEntity(
      couponCode: couponCode ?? this.couponCode,
      discountAmount: discountAmount ?? this.discountAmount,
      couponType: couponType ?? this.couponType,
      couponValue: couponValue ?? this.couponValue,
      freeShipping: freeShipping ?? this.freeShipping,
    );
  }

  @override
  List<Object?> get props =>
      [couponCode, discountAmount, couponType, couponValue, freeShipping];
}
