import 'package:taza/taza.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).tabBarStyle;

    BottomNavigationBarDataModel bottomNavData =
        controller.tabs[2].bottomNavData;
    return Scaffold(
      //extendBody: true,
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
      /*.animate(onPlay: (controller) => controller.repeat(reverse: true))
          .scale(
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          )*/
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


