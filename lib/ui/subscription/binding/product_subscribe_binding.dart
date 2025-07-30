import 'package:taza/taza.dart';
import 'package:taza/ui/subscription/view/product_subscription_controller.dart';

class ProductSubscribeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductSubscriptionController());
  }
}