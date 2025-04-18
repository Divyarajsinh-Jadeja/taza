import 'package:taza/taza.dart';

class ShoppingListDialog extends StatelessWidget {
  final List<ShoppingListOption> options;
  const ShoppingListDialog({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    final foodPageStyle = AppTheme.of(context).foodPageStyle;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
          child: child,
        );
      },
      child: Stack(
        children: [
          SmartColumn(
            isSafeArea: false,
            key: const ValueKey<String>('shopping_list_dialog'),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            decoration: BoxDecoration(
              color: foodPageStyle.whiteColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
              boxShadow: [BoxShadow(color: foodPageStyle.blackColor.withValues(alpha: 0.1), blurRadius: 10.r, offset: const Offset(0, -5))],
            ),
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmartText(LocaleKeys.haveAShoppingList.tr, style: foodPageStyle.headerTextStyle),
              SizedBox(height: 4.h),
              SmartText(LocaleKeys.haveAShoppingListDesc.tr),
              SizedBox(height: 24.h),
              SmartRow(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: options.map((option) => _buildOptionButton(option, foodPageStyle)).toList(),
              ),
              SizedBox(height: 16.h),
            ],
          ),
          Positioned(
            right: 16.w,
            top: 16.h,
            child: InkWell(onTap: () => Get.back(), child: SmartImage(path: AppImages.icClose, width: 24.w, height: 24.w)),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton(ShoppingListOption option, FoodPageStyle foodPageStyle) {
    return SmartColumn(
      onTap: option.onTap,
      width: 100.w,
      height: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          tileMode: TileMode.clamp,
          begin: Alignment.topLeft,
          end: Alignment.center,
          transform: GradientRotation(9),
          colors: [option.backgroundGradientStart, option.backgroundGradientEnd],
        ),
        boxShadow: [BoxShadow(color: foodPageStyle.blackColor.withValues(alpha: 0.12), blurRadius: 1, offset: Offset(0, 3))],
      ),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(color: foodPageStyle.whiteColor.withValues(alpha: 0.8), shape: BoxShape.circle),
          padding: EdgeInsets.all(10.w),
          child: Icon(option.icon, size: 26, color: foodPageStyle.blackColor.withValues(alpha: 0.9)),
        ),
        SizedBox(height: 8.h),
        SmartText(option.title, textAlign: TextAlign.center),
      ],
    );
  }
}
