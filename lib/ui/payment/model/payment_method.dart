enum PaymentType { visa, mastercard, googlePay, paypal }

extension PaymentTypeExtension on PaymentType {
  String get name {
    switch (this) {
      case PaymentType.visa:
        return 'Visa';
      case PaymentType.mastercard:
        return 'Mastercard';
      case PaymentType.googlePay:
        return 'Google Pay';
      case PaymentType.paypal:
        return 'PayPal';
    }
  }
}

class PaymentMethod {
  final PaymentType type;
  final String? number;
  final String? expiry;

  PaymentMethod({required this.type, this.number, this.expiry});
}
