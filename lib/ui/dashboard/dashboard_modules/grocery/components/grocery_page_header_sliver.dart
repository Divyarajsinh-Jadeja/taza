import 'package:taza/taza.dart';
import 'package:taza/ui/dashboard/dashboard_modules/grocery/components/grocery_screen_tabs_view.dart';


class GroceryHeaderSliver extends GetView<GroceryDashboardController> {
  const GroceryHeaderSliver({super.key});

  @override
  Widget build(BuildContext context) {
    final foodPageStyle = AppTheme.of(context).foodPageStyle;
    return Obx(
      () => ColoredBox(
        color: foodPageStyle.whiteColor,
        child: SmartColumn(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [
              controller.currentFoodTabData.themeColor,
              controller.currentFoodTabData.themeColor.withValues(alpha: 0.4)
            ], begin: Alignment.topCenter,end: Alignment.bottomCenter,
            stops: [0, 0.8],
          ),
          ),
          children: [
            GestureDetector(
              onTap: (){
                Future.delayed(100.ms, () {
                  Get.toNamed(AppRoutes.searchPage, arguments:  AppConst.isFromInstamart);
                });
              },
              child: Padding(
                padding: EdgeInsetsDirectional.all(16.w),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    SmartSearchBar(
                      isSearchWithPrefix: true,
                      items: [Get.find<GroceryDashboardController>().hints[controller.currentHintIndex.value]],
                      controller: controller.searchController,
                      onChanged: (val) {},
                      isEnabled: false,
                      suffixIcon: SizedBox(width: 40.w),
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
            GroceryAnimatedTabBar(tabController: controller.foodTabController, tabs: controller.tabs),
            // Container(color: controller.currentFoodTabData.themeColor, height: 8.h),
          ],
        ),
      ),
    );
  }
}
