import 'package:taza/taza.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SizedBox(height: Get.height, width: Get.width, child: Center(child: SmartText("Cart"))));
  }
}
