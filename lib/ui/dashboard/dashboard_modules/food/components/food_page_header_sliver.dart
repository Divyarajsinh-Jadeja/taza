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
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              controller.currentFoodTabData.themeColor,
              controller.currentFoodTabData.themeColor.withValues(alpha: 0.4)
            ],
                begin: Alignment.topCenter,end: Alignment.bottomCenter),

          ),
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.toNamed(AppRoutes.searchPage, arguments: AppConst.isFromFood);
              },
              child: Padding(
                padding: EdgeInsetsDirectional.all(16),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    SmartSearchBar(
                      isSearchWithPrefix: true,
                      isEnabled: false,
                      items: [Get.find<FoodController>().hints[controller.currentHintIndex.value]],
                      controller: controller.searchController,
                      onChanged: (val) {},
                      suffixIcon: SizedBox(width: 40.w), // Reserve space to avoid overlap
                    ),
                    Positioned(
                      right: 16,
                      child: GestureDetector(
                        onTap: () {
                          // This will now work without triggering the parent GestureDetector
                          Utils.showSmartModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                ShoppingListDialog(options: controller.getOptions(context)),
                          );
                        },
                        child: SmartRow(
                          spacing: 4.w,
                            children: [
                              SmartImage(path: AppImages.icDivider),
                              Icon(Icons.edit_note_sharp),

                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedTabBar(tabController: controller.foodTabController, tabs: controller.tabs),
            // Container(color: controller.currentFoodTabData.themeColor, height: 8.h),
          ],
        ),
      ),
    );
  }
}
