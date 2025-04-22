import 'package:taza/taza.dart';
class SmartDeliveryTabController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  var selectedDelivery = 0.obs;
  RxnInt selectedTip = RxnInt();
  final RxInt currentTabIndex = 0.obs;
  final List<int> tipOptions = [10, 20, 30, 50];

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        currentTabIndex.value = tabController.index;
      }
    });
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
