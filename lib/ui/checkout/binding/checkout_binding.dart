import 'package:taza/taza.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutController());
    Get.put(SmartDeliveryTabController());
  }
}