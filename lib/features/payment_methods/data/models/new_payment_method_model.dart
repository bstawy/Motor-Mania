class NewPaymentMethodModel {
  final String cardNumber;
  final String expiryMonth;
  final String expiryYear;
  final String cvv;

  const NewPaymentMethodModel({
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvv,
  });

  Map<String, dynamic> toJson() {
    return {
      "card_number": cardNumber,
      "expiry_month": expiryMonth,
      "expiry_year": expiryYear,
      "cvv": cvv
    };
  }
}
