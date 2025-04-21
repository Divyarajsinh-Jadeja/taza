import 'package:taza/taza.dart';
import 'package:taza/ui/category/view/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
  }
}
