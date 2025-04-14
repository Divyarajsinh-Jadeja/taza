import 'package:taza/taza.dart';

class CheckoutController extends GetxController{
@override
  void onInit() {
    super.onInit();
    Get.find<QuantityController>().initializeQuantities(1);
    printWrapped("CheckoutController initialized");
  }
}