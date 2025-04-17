import 'package:taza/taza.dart';

class FoodHeaderSliver extends GetView<FoodController> {
  const FoodHeaderSliver({super.key});

  @override
  Widget build(BuildContext context) {
    final foodPageStyle = AppTheme.of(context).foodPageStyle;
    return Obx(
      () => ColoredBox(
        color: foodPageStyle.whiteColor,
        child: SmartColumn(
          color: controller.currentFoodTabData.themeColor.withValues(alpha: 0.4),
          children: [
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SmartSearchBar(
                  items: [Get.find<FoodController>().hints[controller.currentHintIndex.value]],
                  controller: SearchController(),
                  onChanged: (val) {},
                  suffixIcon: SmartRow(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SmartImage(path: AppImages.icSearch, size: 24.w),
                      Container(height: 21.h, width: 1.w, margin: EdgeInsetsDirectional.symmetric(horizontal: 8.w)),
                      SmartImage(path: AppImages.icMic,size: 24.w),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedTabBar(tabController: controller.foodTabController, tabs: controller.tabs),
            Container(color: controller.currentFoodTabData.themeColor, height: 8.h),
          ],
        ),
      ),
    );
  }
}
