enum CouponType {
  percentage,
  fixedAmount,
  freeShipping,
}

extension CouponTypeExtension on CouponType {
  String get value {
    switch (this) {
      case CouponType.percentage:
        return 'percentage';
      case CouponType.fixedAmount:
        return 'fixed_amount';
      case CouponType.freeShipping:
        return 'free_shipping';
    }
  }

  static CouponType fromString(String value) {
    switch (value) {
      case 'percentage':
        return CouponType.percentage;
      case 'fixed_amount':
        return CouponType.fixedAmount;
      case 'free_shipping':
        return CouponType.freeShipping;
      default:
        throw ArgumentError('Unknown coupon type: $value');
    }
  }
}
