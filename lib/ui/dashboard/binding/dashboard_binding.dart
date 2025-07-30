import 'package:taza/dummy/menu/menu_controller.dart';
import 'package:taza/taza.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(QuantityController()).initializeQuantities(20);
    Get.lazyPut(() => FoodController());
    Get.lazyPut(() => RewardsController());
    Get.lazyPut(() => ReorderController());
    Get.lazyPut(() => PaymentController());
    Get.lazyPut(() => GroceryDashboardController());
    Get.lazyPut(() => CategoryDashboardController());
    Get.put(CartController());
    Get.put(InstamartCartController());
    ///This is for Graph QL API implementation
    Get.lazyPut(() => MenuTabController());


  }
}