import 'package:taza/taza.dart';

class OtpVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpVerificationController());
  }
}