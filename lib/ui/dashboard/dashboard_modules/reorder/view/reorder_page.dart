import 'package:taza/taza.dart';

class ReorderPage extends GetView<ReorderController> {
  const ReorderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(height: Get.height, width: Get.width, child: Center(child: SmartText("Reorder"))));
  }
}
