import '../../domain/entities/payment_method_entity.dart';

class PaymentMethodModel extends PaymentMethodEntity {
  const PaymentMethodModel({
    required super.id,
    required super.cardType,
    required super.lastFourDigits,
    required super.expiryMonth,
    required super.expiryYear,
    required super.isDefault,
  });

  PaymentMethodModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'] as String,
          cardType: json['card_type'] as String,
          lastFourDigits: json['last_four_digits'] as String,
          expiryMonth: json['expiry_month'],
          expiryYear: json['expiry_year'],
          isDefault: json['is_default'] as bool,
        );
}
