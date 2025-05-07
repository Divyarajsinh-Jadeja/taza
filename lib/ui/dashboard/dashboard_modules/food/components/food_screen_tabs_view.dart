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
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: FadeTransition(opacity: animation, child: child));
            },
            child: SizedBox(
              width: 70.w,
              key: ValueKey(isSelected),
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: 10.h),
                child: CustomPaint(
                  painter: CustomTabBarPainter(isSelected: isSelected, themeColor: data.themeColor),
                  child: SmartColumn(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 12.h),
                        child: AnimatedSlide(
                          offset: isSelected ? Offset(0, 0) : Offset(0, 0.1),
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                          child: SmartImage(path: data.imagePath, height: 32.h,width: 40.w,fit: BoxFit.fitHeight,),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsetsDirectional.only(top: 2.h),
                        color: isSelected ? style.transparentColor : controller.currentFoodTabData.themeColor.withValues(alpha: 0.5),
                        child: SmartText(
                          data.tabText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.of(context).interMediumBoldW500TextStyle.copyWith(
                            fontSize: 9.sp,
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

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, 16)
      ..quadraticBezierTo(0, 0, 16, 0)
      ..lineTo(size.width - 16, 0)
      ..quadraticBezierTo(size.width, 0, size.width, 16)
      ..lineTo(size.width, size.height)
      ..close();

    // First: Draw a manual blurred shadow
    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.3)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 6);

    canvas.save();
    canvas.translate(0, 0); // Move if you want offset
    canvas.drawPath(path, shadowPaint);
    canvas.restore();

    // Then: Draw the actual colored tab
    final paint = Paint()
      ..color = themeColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


