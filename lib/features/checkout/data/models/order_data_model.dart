import '../../../../core/helpers/enums/payment_method_types_enum.dart';

class OrderDataModel {
  final PaymentMethodTypes paymentMethodType;
  final int? paymentMethodId;
  final String shippingAddress;
  final String? couponCode;

  OrderDataModel({
    required this.paymentMethodType,
    required this.paymentMethodId,
    required this.shippingAddress,
    required this.couponCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'payment_method': paymentMethodType.value,
      'payment_method_id': paymentMethodId,
      'shipping_address': shippingAddress,
      'coupon_code': couponCode,
    };
  }
}
