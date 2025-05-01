import 'package:taza/taza.dart';

class ExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ExploreBrandController());
  }
}