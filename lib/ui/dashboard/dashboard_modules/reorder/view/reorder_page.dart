import 'package:taza/taza.dart';

class ReorderPage extends GetView<ReorderController> {
  const ReorderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final quantityController = Get.put(QuantityController())
      ..initializeQuantities(controller.foodList.length);
    return Scaffold(
      appBar: SmartAppBar(title: LocaleKeys.reorder.tr, isBack: false),
      body: SmartColumn(
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
                Obx(() {
                  return SmartSwitch(
                    value: controller.isVeg.value,
                    onToggle: controller.toggleVeg,
                    activeColor: Colors.green,
                    activeIcon: SmartImage(path: AppImages.icVeg),
                    inactiveIcon: SmartImage(path: AppImages.icVeg),
                  );
                }),
                8.horizontalSpace,
                Obx(() {
                  return SmartSwitch(
                    value: controller.isNonVeg.value,
                    onToggle: controller.toggleNonVeg,
                    activeColor: Colors.red,
                    activeIcon: SmartImage(path: AppImages.icNonVeg),
                    inactiveIcon: SmartImage(path: AppImages.icNonVeg),
                  );
                }),
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
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.foodList.length,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                itemBuilder:
                    (context, index) =>
                    FoodCard(
                      index: index,
                      onIncrease: () => quantityController.increment(index),
                      onDecrease: () => quantityController.decrement(index),
                      model: controller.foodList[index],
                    ),

              );
            }),
          ),
        ],
      ),
    );
  }

  _buildChip({
    required BuildContext context,
    required String text,
    Function()? onTap,
  }) {
    var style = AppTheme
        .of(context)
        .smartChipStyle;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(120.r),
          border: Border.all(color: style.color),
        ),
        padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
        child: Center(
          child: SmartText(
              text,
              style: style.titleStyle
          ),
        ),
      ),
    );
  }
}
