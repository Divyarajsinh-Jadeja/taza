import 'package:taza/taza.dart';

class FoodDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoodDetailsController());
  }
}