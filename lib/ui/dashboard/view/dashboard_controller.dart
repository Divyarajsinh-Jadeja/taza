import 'package:taza/taza.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }

}