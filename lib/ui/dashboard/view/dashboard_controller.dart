import 'package:taza/taza.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  final tabInitialized = <int, bool>{};

  final tabs = <TabData>[
    TabData(
      pageBuilder: (_) => HomePage(),
      bottomNavData: BottomNavigationBarDataModel(icon: AppImages.icHome, label: LocaleKeys.home.tr),
      onInit: () => Get.find<HomeController>().onTabSelected(),
      shouldAlwaysInitialize: true,
    ),
    TabData(
      pageBuilder: (_) => FoodPage(),
      bottomNavData: BottomNavigationBarDataModel(icon: AppImages.icFoodIcon, label: LocaleKeys.food.tr),
      onInit: () => Get.find<FoodController>().onTabSelected(),
    ),
    TabData(
      pageBuilder: (_) => CartPage(),
      bottomNavData: BottomNavigationBarDataModel(icon: AppImages.icShoppingBag, label: LocaleKeys.cart.tr),
      onInit: () => Get.find<CartController>().onTabSelected(),
    ),
    /*TabData(
      pageBuilder: (_) => RewardsPage(),
      bottomNavData: BottomNavigationBarDataModel(icon: AppImages.icRewards, label: LocaleKeys.rewards.tr),
      onInit: () => Get.find<RewardsController>().onTabSelected(),
      shouldAlwaysInitialize: true,
    ),*/
    TabData(
      pageBuilder: (_) => GroceryPage(),
      bottomNavData: BottomNavigationBarDataModel(icon: AppImages.icRewards, label: LocaleKeys.rewards.tr),
      onInit: () => Get.find<GroceryController>().onTabSelected(),
      shouldAlwaysInitialize: true,
    ),
    TabData(
      pageBuilder: (_) => ReorderPage(),
      bottomNavData: BottomNavigationBarDataModel(icon: AppImages.icReorder, label: LocaleKeys.reorder.tr),
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
    pageController.animateToPage(index, duration: Duration(milliseconds: AppConst.transitionDuration), curve: Curves.easeInOut);

    /// Only initialize if it hasn't been initialized before or we always want to
    if (isFirstInit || tab.shouldAlwaysInitialize) {
      tab.onInit?.call();
      tabInitialized[index] = true;
    }
  }
}
