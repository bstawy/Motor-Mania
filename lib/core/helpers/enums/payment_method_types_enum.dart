enum PaymentMethodTypes {
  wallet,
  debitOrCreditCard,
  cashOnDelivery,
}

extension PaymentMethodTypesExtension on PaymentMethodTypes {
  String get name {
    switch (this) {
      case PaymentMethodTypes.wallet:
        return "Wallet";
      case PaymentMethodTypes.debitOrCreditCard:
        return "Debit/Credit Card";
      case PaymentMethodTypes.cashOnDelivery:
        return "Cash on Delivery";
    }
  }

  String get value {
    switch (this) {
      case PaymentMethodTypes.wallet:
        return "wallet";
      case PaymentMethodTypes.debitOrCreditCard:
        return "card";
      case PaymentMethodTypes.cashOnDelivery:
        return "cash_on_delivery";
    }
  }
}
