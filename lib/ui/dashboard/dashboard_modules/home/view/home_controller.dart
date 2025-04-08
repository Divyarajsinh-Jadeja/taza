import 'package:taza/taza.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    printWrapped("text");
    debugPrint("HomeController onInit");
    super.onInit();
  }

  void onTabSelected() {
    debugPrint('HomeController → Tab Init');
  }
}
