import 'package:taza/taza.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SizedBox(height: Get.height, width: Get.width, child: Center(child: SmartText("Home"))));
  }
}
