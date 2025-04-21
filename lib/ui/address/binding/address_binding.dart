import 'package:taza/taza.dart';

class AddressBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddressController(),);
  }

}