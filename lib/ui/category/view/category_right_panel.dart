import 'package:taza/taza.dart';
import 'package:taza/ui/category/view/category_screen.dart';

class CategoryProductGrid extends GetView<CategoryController> {
  const CategoryProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(position: Tween<Offset>(begin: Offset(0.05, 0), end: Offset.zero).animate(animation), child: child),
          );
        },
        child: ProductListView(key: ValueKey(controller.selectedCategoryIndex.value)),
      ),
    );
  }
}

class PromotionalBanner extends StatelessWidget {
  const PromotionalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).promotionBannerStyle;

    return SmartColumn(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: style.boxDecoration,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmartText("Up to 40% OFF", style: style.headline),
        SizedBox(height: 6.h),
        SmartText("Try crispy wafers for a sweet break!", style: style.subtitle),
        SizedBox(height: 14.h),
        SmartButton(
          onTap: () {},
          title: "Order Now",
          height: 32,
          width: context.width / 3,
          activeBackgroundColor: style.whiteColor,
          titleStyle: style.buttonTextStyle,
        ),
      ],
    );
  }
}

