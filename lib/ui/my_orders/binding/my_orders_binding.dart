import 'package:taza/taza.dart';

class MyOrdersBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyOrdersController(),);
  }
}
