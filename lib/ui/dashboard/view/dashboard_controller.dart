import 'package:taza/taza.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabInitialized = <int, bool>{};

  final tabs = <TabData>[
    TabData(
      pageBuilder: (_) => HomePage(),
      bottomNavData: BottomNavyBarItem(icon: AppImages.icHome, title: "Home"),
      onInit: () => Get.find<HomeController>().onTabSelected(),
      shouldAlwaysInitialize: true,
    ),
    TabData(
      pageBuilder: (_) => FoodPage(),
      bottomNavData: BottomNavyBarItem(icon: AppImages.icFood, title: 'Food'),
      onInit: () => Get.find<FoodController>().onTabSelected(),
    ),
    TabData(
      pageBuilder: (_) => CartPage(),
      bottomNavData: BottomNavyBarItem(icon: AppImages.icShoppingBag, title: 'Cart'),
      onInit: () => Get.find<CartController>().onTabSelected(),
    ),
    TabData(
      pageBuilder: (_) => RewardsPage(),
      bottomNavData: BottomNavyBarItem(icon: AppImages.icRewards, title: 'Rewards'),
      onInit: () => Get.find<RewardsController>().onTabSelected(),
      shouldAlwaysInitialize: true,
    ),
    TabData(
      pageBuilder: (_) => ReorderPage(),
      bottomNavData: BottomNavyBarItem(icon: AppImages.icReorder, title: 'Reorder'),
      onInit: () => Get.find<ReorderController>().onTabSelected(),
    ),
  ];

  void changeTab(int index) {
    final isSameTab = currentIndex.value == index;
    final tab = tabs[index];
    final bool isFirstInit = !(tabInitialized[index] ?? false);

    ///If it's the same tab and we don't want to re-initialize, exit early
    if (isSameTab) {
      /// Only return if either it's already initialized or we don’t want forced re-init
      if (!tab.shouldAlwaysInitialize || !isFirstInit) return;
    }
    currentIndex.value = index;

    /// Only initialize if it hasn't been initialized before or we always want to
    if (isFirstInit || tab.shouldAlwaysInitialize) {
      tab.onInit?.call();
      tabInitialized[index] = true;
    }
  }
}
