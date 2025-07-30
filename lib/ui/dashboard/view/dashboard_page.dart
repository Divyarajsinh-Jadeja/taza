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
            return Padding(
              // in case of showing bottom cart for food and instamart section
              // we need to add padding at bottom.
              padding: EdgeInsetsDirectional.only(bottom: (controller.showFoodBottomCart|| controller.showInstamartBottomCart)? 120.h:0),
              child: PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children:
                controller.tabs
                    .map((tab) => Builder(builder: tab.pageBuilder))
                    .toList(),
              ),
            );
          }),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            bottom: 0.h,
            end: 0.w,
            start: 0.w,
            child: BottomCartWidget(),
          ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            bottom: 0.h,
            end: 0.w,
            start: 0.w,
            child: InstamartBottomCartWidget(),
          )
        ],
      ),
      bottomNavigationBar: Obx(() {
        bool isVisible = controller.isBottomBarVisible.value;
        return AnimatedOpacity(
          opacity: isVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isVisible ? kBottomNavigationBarHeight + 20.h : 0,
            child: Wrap(
              children: [
               CustomBottomBar(
                  selectedIndex: controller.currentIndex.value,
                  onItemSelected: (index) => controller.changeTab(index),
                  items: controller.tabs.map((tab) => tab.bottomNavData).toList(),
                  controller: controller,
                ),
              ],
            ),
          ),
        );
      }),

    );
  }
}