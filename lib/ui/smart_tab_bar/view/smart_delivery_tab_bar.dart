import 'package:taza/taza.dart';
class SmartDeliveryTabController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  var selectedDelivery = 0.obs;
  RxnInt selectedTip = RxnInt();

  final List<int> tipOptions = [10, 20, 30, 50];

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  void changeDelivery(int value) {
    selectedDelivery.value = value;
  }

  void changeTip(int value) {
    if(selectedTip.value==value){
      selectedTip.value=null;
    }
    else {
      selectedTip.value = value;
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
