import 'package:taza/taza.dart';

class AnimatedTabBar extends GetView<FoodController> {
  final TabController tabController;
  final List<FoodTabData> tabs;
  final Function(int)? onTabChange;

  const AnimatedTabBar({super.key, required this.tabController, required this.tabs, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).animatedTabBarStyle;
    return Obx(() {
      return TabBar(
        tabAlignment: TabAlignment.start,
        controller: tabController,
        indicatorWeight: 0,
        dividerColor: style.transparentColor,
        isScrollable: true,
        physics: ClampingScrollPhysics(),
        indicatorColor: style.transparentColor,
        onTap: (index) {
          if (index != controller.selectedFoodTab.value) {
            onTabChange?.call(index);
          }
        },
        labelPadding: EdgeInsets.zero,
        indicator: BoxDecoration(color: style.transparentColor),
        tabs: List.generate(tabs.length, (index) {
          final data = tabs[index];
          final isSelected = index == controller.selectedFoodTab.value;
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            switchInCurve: Curves.easeOutBack,
            switchOutCurve: Curves.easeIn,
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: FadeTransition(opacity: animation, child: child));
            },
            child: SizedBox(
              width: 70.w,
              key: ValueKey(isSelected),
              child: CustomPaint(
                painter: CustomTabBarPainter(isSelected: isSelected, themeColor: data.themeColor),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: isSelected ? data.themeColor : style.transparentColor,
                  ),
                  child: SmartColumn(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h),
                        child: AnimatedSlide(
                          offset: isSelected ? Offset(0, 0) : Offset(0, 0.3),
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                          child: AnimatedOpacity(
                            opacity: isSelected ? 1 : 0.6,
                            duration: Duration(milliseconds: 400),
                            child: SizedBox(height: 32.w, width: 32.w, child: SmartImage(path: data.imagePath)),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2),
                        color: isSelected ? style.transparentColor : controller.currentFoodTabData.themeColor.withValues(alpha: 0.5),
                        child: SmartText(
                          data.tabText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.of(context).interRegularW400TextStyle.copyWith(
                            fontSize: 10.sp,
                            color: Utils.getContrastColor(controller.currentFoodTabData.themeColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}

class CustomTabBarPainter extends CustomPainter {
  final bool isSelected;
  final Color themeColor;

  CustomTabBarPainter({required this.isSelected, required this.themeColor});

  @override
  void paint(Canvas canvas, Size size) {
    if (!isSelected) return;

    final paint =
        Paint()
          ..color = themeColor
          ..style = PaintingStyle.fill
          ..isAntiAlias = true;

    final path =
        Path()
          ..moveTo(0, size.height) // Start from bottom-left
          ..lineTo(0, 16) // Go up
          ..quadraticBezierTo(0, 0, 16, 0) // Top-left corner curve
          ..lineTo(size.width - 16, 0) // Top edge
          ..quadraticBezierTo(size.width, 0, size.width, 16) // Top-right corner curve
          ..lineTo(size.width, size.height) // Down to bottom-right
          ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
