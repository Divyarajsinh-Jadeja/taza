import 'package:taza/taza.dart';

import '../dashboard_modules/grocery/view/grocery_page_dashboard.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  final tabInitialized = <int, bool>{};
  bool showOfferPopup = false;

  Rx<BottomNavType> currentBottomType = BottomNavType.all.obs;

  @override
  void onInit() {
    super.onInit();
    showOfferPopup = StorageManager.instance.isShowOfferPopup();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!showOfferPopup && Get.context != null) {
        StorageManager.instance.showOfferPopup(true);
        Utils.showSmartModalBottomSheet(
          context: Get.context!,
          backgroundColor: Colors.transparent,
          builder:
              (context) => OfferPopup(
                title: "Free Delivery",
                buttonText: "Got it! Thanks",
                subTitle: "on all order above ${199.toCurrencyCodeFormat()}",
                image: AppImages.deliveryLottie,
                bgImage: AppImages.icBgYellow,
              ),
        );
      }
    });
  }

  final allTabs = <TabData>[
    TabData(
      pageBuilder: (_) => HomePage(),
      bottomNavData: BottomNavigationBarDataModel(
        icon: AppImages.icHome,
        label: LocaleKeys.home,
      ),
      onInit: () => Get.find<HomeController>().onTabSelected(),
      shouldAlwaysInitialize: true,
    ),
    TabData(
      pageBuilder: (_) => FoodPage(),
      bottomNavData: BottomNavigationBarDataModel(
        icon: AppImages.icFoodIcon,
        label: LocaleKeys.food,
      ),
      onInit: () => Get.find<FoodController>().onTabSelected(),
    ),
    TabData(
      pageBuilder: (_) => GroceryPage(),
      bottomNavData: BottomNavigationBarDataModel(
        icon: AppImages.icInstamart,
        label: "Instamart",
      ),
      onInit: () => Get.find<GroceryController>().onTabSelected(),
    ),
    TabData(
      pageBuilder: (_) => SizedBox(),
      bottomNavData: BottomNavigationBarDataModel(
        icon: AppImages.icDine,
        label: "Dineout",
      ),
    ),
    TabData(
      pageBuilder: (_) => ReorderPage(),
      bottomNavData: BottomNavigationBarDataModel(
        icon: AppImages.icReorder,
        label: LocaleKeys.reorder,
      ),
      onInit: () => Get.find<ReorderController>().onTabSelected(),
    ),
  ];

  final foodTabs = <TabData>[
    TabData(
      pageBuilder: (_) => HomePage(),
      bottomNavData: BottomNavigationBarDataModel(
        icon: AppImages.icHome,
        label: LocaleKeys.home,
      ),
      onInit: () => Get.find<HomeController>().onTabSelected(),
      shouldAlwaysInitialize: true,
    ),
    TabData(
      pageBuilder: (_) => FoodPage(),
      bottomNavData: BottomNavigationBarDataModel(
        icon: AppImages.icFoodIcon,
        label: LocaleKeys.food,
      ),
      onInit: () => Get.find<FoodController>().onTabSelected(),
    ),
    TabData(
      pageBuilder: (_) => Placeholder(),
      bottomNavData: BottomNavigationBarDataModel(
        icon: AppImages.icFlash,
        label: "Bolt",
      ),
      onInit: () => Get.find<FoodController>().onTabSelected(),
    ),
    TabData(
      pageBuilder: (_) => ReorderPage(),
      bottomNavData: BottomNavigationBarDataModel(
        icon: AppImages.icReorder,
        label: LocaleKeys.reorder,
      ),
      onInit: () => Get.find<ReorderController>().onTabSelected(),
    ),
  ];

  final instamartTabs = <TabData>[
    TabData(
      pageBuilder: (_) => HomePage(),
      bottomNavData: BottomNavigationBarDataModel(
        icon: AppImages.icHome,
        label: LocaleKeys.home,
      ),
      onInit: () => Get.find<HomeController>().onTabSelected(),
      shouldAlwaysInitialize: true,
    ),
    TabData(
      pageBuilder: (_) => GroceryPage(),
      bottomNavData: BottomNavigationBarDataModel(
        icon: AppImages.icInstamart,
        label: "Instamart",
      ),
      onInit: () => Get.find<GroceryController>().onTabSelected(),
    ),
    TabData(
      pageBuilder: (_) => Placeholder(),
      bottomNavData: BottomNavigationBarDataModel(
        icon: AppImages.icFlash,
        label: "New & Hot",
      ),
      onInit: () => Get.find<ReorderController>().onTabSelected(),
    ),
    TabData(
      pageBuilder: (_) => ReorderPage(),
      bottomNavData: BottomNavigationBarDataModel(
        icon: AppImages.icReorder,
        label: LocaleKeys.reorder,
      ),
      onInit: () => Get.find<ReorderController>().onTabSelected(),
    ),
  ];

  List<TabData> get tabs {
    switch (currentBottomType.value) {
      case BottomNavType.food:
        return foodTabs;
      case BottomNavType.instamart:
        return instamartTabs;
      case BottomNavType.dineout:
        return allTabs;
      case BottomNavType.all:
        return allTabs;
    }
  }

  void changeTab(int index) {
    /* final isSameTab = currentIndex.value == index;
    final tab = tabs[index];
    final bool isFirstInit = !(tabInitialized[index] ?? false);

    ///If it's the same tab and we don't want to re-initialize, exit early
    if (isSameTab) {
      /// Only return if either it's already initialized or we don’t want forced re-init
      if (!tab.shouldAlwaysInitialize || !isFirstInit) return;
    }
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: AppConst.transitionDuration),
      curve: Curves.easeInOut,
    );

    /// Only initialize if it hasn't been initialized before or we always want to
    if (isFirstInit || tab.shouldAlwaysInitialize) {
      tab.onInit?.call();
      tabInitialized[index] = true;
    }*/
    if (index == 0) {
      // Will set it to all type
      currentBottomType.value = BottomNavType.all;
      currentIndex.value = 0;
    }
    else if (currentBottomType.value == BottomNavType.all) {
      // When in "all" and clicked on tab 1/2/3
      if (index == 1) {
        currentBottomType.value = BottomNavType.food;
        currentIndex.value = 1;
      } else if (index == 2) {
        currentBottomType.value = BottomNavType.instamart;
        currentIndex.value = 1;
      } else if (index == 3) {
        currentBottomType.value = BottomNavType.dineout;
        currentIndex.value = 1;
      }else {
        currentIndex.value = index;
      }

    }
    else {
      currentIndex.value = index;
    }
    pageController.animateToPage(
      currentIndex.value,
      duration: Duration(milliseconds: AppConst.transitionDuration),
      curve: Curves.easeInOut,
    );
  }
}
