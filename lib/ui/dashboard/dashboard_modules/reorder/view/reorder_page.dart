import 'package:taza/taza.dart';

class ReorderPage extends GetView<ReorderController> {
  const ReorderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmartAppBar(title: LocaleKeys.reorder.tr, isBack: false),
      body: Obx(() {
        return SmartColumn(
          height: Get.height,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(
                start: 20.r,
                top: 16.r,
                bottom: 16.r,
              ),
              height: 32.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SmartSwitch(
                    value: controller.isVeg.value,
                    onToggle: controller.toggleVeg,
                    activeColor: Colors.green,
                    activeIcon: SmartImage(path: AppImages.icVeg),
                    inactiveIcon: SmartImage(path: AppImages.icVeg),
                  ),
                  8.horizontalSpace,
                  SmartSwitch(
                    value: controller.isNonVeg.value,
                    onToggle: controller.toggleNonVeg,
                    activeColor: Colors.red,
                    activeIcon: SmartImage(path: AppImages.icNonVeg),
                    inactiveIcon: SmartImage(path: AppImages.icNonVeg),
                  ),
                  8.horizontalSpace,
                  _buildChip(context: context, text: "Quick 30 Min"),
                  8.horizontalSpace,
                  _buildChip(context: context, text: "Price 10-50"),
                  8.horizontalSpace,
                  _buildChip(context: context, text: "Price 10-50"),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                itemBuilder:
                    (context, index) => FoodCard(
                      onIncrease: () => controller.increaseQuantity(index),
                      onDecrease: () => controller.decreaseQuantity(index),
                      model: controller.foodList[index],
                    ),
                itemCount: controller.foodList.length,
              ),
            ),
          ],
        );
      }),
    );
  }

  _buildChip({
    required BuildContext context,
    required String text,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(120),
          border: Border.all(color: colors(context).color9C9CA3),
        ),
        padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
        child: Center(
          child: SmartText(
            text,
            style: AppTheme.of(context).interBoldW700TextStyle.copyWith(
              fontSize: 13,
              color: colors(context).color9C9CA3,
            ),
          ),
        ),
      ),
    );
  }
}
