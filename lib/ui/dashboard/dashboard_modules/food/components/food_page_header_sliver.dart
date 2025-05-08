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
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.all(16),
                child: SmartSearchBar(
                  isSearchWithPrefix: true,
                  items: [Get.find<FoodController>().hints[controller.currentHintIndex.value]],
                  controller: controller.searchController,
                  onChanged: (val) {},
                  suffixIcon: SmartRow(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 21.h,
                        width: 1.w,
                        color: foodPageStyle.borderColor,
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.edit_note_sharp),
                        onPressed: () {
                          Utils.showSmartModalBottomSheet(
                            context: context,
                            builder: (context) => ShoppingListDialog(options: controller.getOptions(context)),
                          );
                        },
                      ),
                    ],
                  ),
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
