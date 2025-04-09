import 'package:taza/taza.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.lazyPut(() => FoodController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => RewardsController());
    Get.lazyPut(() => ReorderController());
  }
}