import 'package:taza/taza.dart';

class SplashController extends GetxController {

  bool isInitialLogin = false;

  @override
  void onInit() {
    printWrapped('SplashController onInit');
    navigateToNextScreen();
    isInitialLogin = StorageManager.instance.isInitialLoginDone();
    super.onInit();
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 4));
    isInitialLogin == true
        ? Get.offNamed(AppRoutes.dashboardPage)
        : Get.offNamed(AppRoutes.loginPage);
  }
}
