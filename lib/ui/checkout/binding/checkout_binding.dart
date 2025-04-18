import 'package:taza/taza.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CheckoutController());
    Get.put(SmartDeliveryTabController());
  }
}