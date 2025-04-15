import 'package:taza/taza.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}