import 'package:taza/taza.dart';

class InstamartCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InstamartCartController());
    Get.put(SmartDeliveryTabController());
  }
}