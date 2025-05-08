import 'package:taza/taza.dart';

class SearchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchPageController());
  }
}