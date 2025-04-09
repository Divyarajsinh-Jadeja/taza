import 'package:taza/taza.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    debugPrint("CartController onInit");
    super.onInit();
  }

  void onTabSelected() {
    debugPrint('CartController → Tab Init');
  }
}
