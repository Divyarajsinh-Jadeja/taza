import 'package:taza/taza.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    printWrapped('SplashController onInit');
    navigateToNextScreen();
    super.onInit();
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 4));
    // Get.offNamed(AppRoutes.dashboardPage);
    Get.offNamed(AppRoutes.loginPage);
  }
}
