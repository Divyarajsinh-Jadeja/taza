import 'package:taza/taza.dart';
class FoodTabView extends StatelessWidget {
  const FoodTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartImage(
      path: "https://i.ibb.co/RGhdLG59/fill-image.png",
      width: Get.width,
      fit: BoxFit.contain,
    );
  }
}

