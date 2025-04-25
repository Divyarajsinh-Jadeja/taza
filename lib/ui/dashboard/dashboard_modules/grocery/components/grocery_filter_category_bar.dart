import 'package:taza/taza.dart';

class GroceryCategoryFilterBar extends GetView<GroceryDashboardController> {
  const GroceryCategoryFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).foodPageStyle;
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: SmartRow(
          children: List.generate(controller.categoryNames.length, (index) {
            final isSelected = controller.selectedCategoryIndex.value == index;
            return GestureDetector(
              onTap: () => controller.updateSelectedCategory(index),
              child: Container(
                margin: EdgeInsets.only(right: 8.w),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: isSelected ? style.blackColor : style.transparent,
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: style.borderColor),
                ),
                child: SmartText(
                  controller.categoryNames[index],
                  style: isSelected ? style.selectedCategoryTextStyle : style.unselectedCategoryTextStyle,
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
