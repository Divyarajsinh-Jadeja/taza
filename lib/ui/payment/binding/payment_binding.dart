import 'package:taza/taza.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PaymentController());
  }
}
