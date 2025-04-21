import 'package:taza/taza.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
  }
}
