import 'package:taza/taza.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Obx(() {
            return PageView(
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children:
              controller.tabs
                  .map((tab) => Builder(builder: tab.pageBuilder))
                  .toList(),
            );
          }),
          Obx(() {
            return controller.showBottomCart
                ? Positioned.directional(
              textDirection: TextDirection.ltr,
              bottom: 0.h,
              end: 0.w,
              start: 0.w,
              child: BottomCartWidget(),
            )
                : const SizedBox.shrink();
          }),
        ],
      ),

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