import '../../../taza.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).tabBarStyle;
    final PageController pageController = PageController();
    return Obx(() {
      final currentIndex = controller.currentIndex.value;
      BottomNavyBarItem bottomNavData = controller.tabs[2].bottomNavData;
      return Scaffold(
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: controller.tabs.map((tab) => Builder(builder: tab.pageBuilder)).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 4,
          backgroundColor: style.selectedIconColor,
          shape: const CircleBorder(),
          onPressed: () {
            controller.changeTab(2);
          },
          child: SmartImage(path: bottomNavData.icon),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomBar(
          selectedIndex: currentIndex,
          onItemSelected: (index) => controller.changeTab(index),
          items: controller.tabs.map((tab) => tab.bottomNavData).toList(),
        ),
      );
    });
  }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key, required this.selectedIndex, required this.items, required this.onItemSelected});

  final int selectedIndex;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).tabBarStyle;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: style.unselectedLabelColor.withValues(alpha: 0.1), blurRadius: 8.r, offset: const Offset(0, -2))],
      ),
      child: BottomAppBar(
        color: style.backgroundColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const CircularNotchedRectangle(),
        notchMargin: 12.w,
        elevation: 10.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final iconColor = selectedIndex == index ? style.selectedIconColor : style.unselectedIconColor;
            final textColor = selectedIndex == index ? style.selectedLabelColor : style.unselectedLabelColor;
            return Expanded(
              child: GestureDetector(
                onTap: () => onItemSelected(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    index == 2 ? SizedBox(height: 32.h) : SmartImage(path: item.icon, color: iconColor, height: 32.h, width: 32.w),
                    SizedBox(height: 4.h),
                    SmartText(
                      item.title,
                      style: style.unselectedLabelStyle.merge(TextStyle(color: textColor)),
                      textAlign: item.textAlign,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class BottomNavyBarItem {
  BottomNavyBarItem({required this.icon, required this.title, this.textAlign});

  final String icon;
  final String title;
  final TextAlign? textAlign;
}
