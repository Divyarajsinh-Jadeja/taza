import 'package:taza/taza.dart';

class FoodController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();

  final TextEditingController searchController = TextEditingController();
  final tabs = ["Food", "Grocery"];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
    debugPrint("FoodController onInit");
  }

  /// This method is called when the tab is selected
  void onTabSelected() {}

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
