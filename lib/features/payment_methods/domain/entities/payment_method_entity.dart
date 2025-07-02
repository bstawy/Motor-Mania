import 'package:equatable/equatable.dart';

class PaymentMethodEntity extends Equatable {
  final String id;
  final String cardType;
  final String lastFourDigits;
  final String expiryMonth;
  final String expiryYear;
  final bool isDefault;

  const PaymentMethodEntity({
    required this.id,
    required this.cardType,
    required this.lastFourDigits,
    required this.expiryMonth,
    required this.expiryYear,
    required this.isDefault,
  });

  PaymentMethodEntity copyWith({
    String? id,
    String? cardType,
    String? lastFourDigits,
    String? expiryMonth,
    String? expiryYear,
    bool? isDefault,
  }) {
    return PaymentMethodEntity(
      id: id ?? this.id,
      cardType: cardType ?? this.cardType,
      lastFourDigits: lastFourDigits ?? this.lastFourDigits,
      expiryMonth: expiryMonth ?? this.expiryMonth,
      expiryYear: expiryYear ?? this.expiryYear,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  List<Object?> get props => [
        id,
        cardType,
        lastFourDigits,
        expiryMonth,
        expiryYear,
        isDefault,
      ];
}
