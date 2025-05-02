import 'package:taza/taza.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
    Get.put(SmartDeliveryTabController());
  }
}