import 'package:taza/taza.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).tabBarStyle;

    BottomNavigationBarDataModel bottomNavData =
        controller.tabs[2].bottomNavData;
    return Scaffold(

      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children:
                controller.tabs
                    .map((tab) => Builder(builder: tab.pageBuilder))
                    .toList(),
          ),
          Positioned.directional(
              textDirection: TextDirection.ltr,
              bottom: 0.h, end: 0.w, start: 0.w, child: BottomCartWidget()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        backgroundColor: style.selectedIconColor,
        shape: const CircleBorder(),
        onPressed: () {
          Get.toNamed(AppRoutes.checkoutPage);
        },
        child: SmartImage(path: bottomNavData.icon),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(() {
        return CustomBottomBar(
          selectedIndex: controller.currentIndex.value,
          onItemSelected: (index) => controller.changeTab(index),
          items: controller.tabs.map((tab) => tab.bottomNavData).toList(),
        );
      }),
    );
  }
}