import 'package:taza/taza.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(QuantityController());
    Get.lazyPut(() => FoodController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => RewardsController());
    Get.lazyPut(() => ReorderController());
    Get.lazyPut(() => GroceryController());
  }
}