import 'package:taza/taza.dart';

class FoodPage extends GetView<FoodController> {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SizedBox(height: Get.height, width: Get.width, child: Center(child: SmartText("Food"))));
  }
}
