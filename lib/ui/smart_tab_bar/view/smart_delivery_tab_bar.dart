import 'package:taza/taza.dart';

class SmartDeliveryTabController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectedDelivery = 0.obs;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  void changeDelivery(int value) {
    selectedDelivery.value = value;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
