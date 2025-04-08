import 'package:taza/taza.dart';

class RewardsPage extends GetView<RewardsController> {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(height: Get.height, width: Get.width, child: Center(child: SmartText("RewardsPage"))));
  }
}
