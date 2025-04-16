import 'package:taza/taza.dart';

class CouponsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CouponsController());
  }
}