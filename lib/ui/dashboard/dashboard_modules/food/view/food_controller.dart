import 'package:taza/taza.dart';

class FoodController extends GetxController {
  @override
  void onInit() {
    debugPrint("FoodController onInit");
    super.onInit();
  }

  void onTabSelected() {
    debugPrint('FoodController → Tab Init');
  }
}
