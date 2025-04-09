import 'package:taza/taza.dart';

class ReorderController extends GetxController {
  @override
  void onInit() {
    debugPrint("ReorderController onInit");
    super.onInit();
  }

  void onTabSelected() {
    debugPrint('ReorderController → Tab Init');
  }
}
