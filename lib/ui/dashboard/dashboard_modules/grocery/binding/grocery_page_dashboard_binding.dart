import 'package:taza/taza.dart';

class GroceryPageDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GroceryDashboardController());
  }
}