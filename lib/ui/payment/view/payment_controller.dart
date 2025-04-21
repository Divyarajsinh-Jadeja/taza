import 'package:taza/taza.dart';

class PaymentController extends GetxController {
  final selectedPayment = PaymentType.googlePay.obs;

  final paymentMethods =
      <PaymentMethod>[
        PaymentMethod(type: PaymentType.visa, number: '**** **** **** 4221', expiry: 'Expires 3/25'),
        PaymentMethod(type: PaymentType.mastercard, number: '**** **** **** 5748', expiry: 'Expires 8/24'),
        PaymentMethod(type: PaymentType.googlePay),
        PaymentMethod(type: PaymentType.paypal),
      ].obs;

  void selectPayment(PaymentType method) {
    selectedPayment.value = method;
  }
}
