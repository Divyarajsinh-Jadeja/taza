import 'package:taza/taza.dart';

class OrderTrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderTrackingController());
  }
}