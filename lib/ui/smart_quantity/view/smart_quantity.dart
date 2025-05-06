/*
import 'package:taza/taza.dart';

class SmartAnimatedQuantity extends GetView<QuantityController> {
  final FoodModel model;

  const SmartAnimatedQuantity({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).foodCardStyle;
    return SmartRow(
      padding: EdgeInsets.all(8.w),
      spacing: 10.w,
      decoration: BoxDecoration(
        border: Border.all(color: style.iconColor),
        borderRadius: BorderRadius.circular(32.r),
      ),

      children: [
        if (model.quantity > 0) ...[
          InkWell(
            onTap: () => Get.find<QuantityController>().decrement(model.id.toInt!),
            child: Icon(Icons.remove, color: style.iconColor, size: 16.w),
          ),
          Obx(() {
            final int current = controller.quantities[model.id.toInt!].value;
            final bool isIncreasing = current > controller.quantities[model.id.toInt!].value.obs.value;
            final Offset slideOffset =
                isIncreasing ? const Offset(0, 0.4) : const Offset(0, -0.4);

            final animated = Animate(
              key: ValueKey(current),
              effects: [
                SlideEffect(
                  begin: slideOffset,
                  end: Offset.zero,
                  duration: 100.ms,
                ),
              ],
              child: SmartText(
                "$current",textAlign: TextAlign.center,
                style: style.subTitleStyle,
              ),
            );

            controller.quantities[model.id.toInt!].value = current;

            return animated;
          }),
        ],
        InkWell(
          onTap: () => Get.find<QuantityController>().increment(model.id.toInt!),
          child: Icon(Icons.add, color: style.iconColor, size: 16.w),
        ),
      ],
    );
  }
}
*/

import 'package:taza/taza.dart';

class SmartAnimatedQuantity extends GetView<CartController> {
  final FoodModel model;

  const SmartAnimatedQuantity({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).foodCardStyle;

    return Obx(() {
      final inCart = controller.foodList.firstWhereOrNull((item) => item.id == model.id);
      final quantity = inCart?.quantity ?? 0;

      return SmartRow(
        padding: EdgeInsets.all(8.w),
        spacing: 10.w,
        decoration: BoxDecoration(
          border: Border.all(color: style.iconColor),
          borderRadius: BorderRadius.circular(32.r),
        ),
        children: [
          if (quantity > 0) ...[
            InkWell(
              onTap: () => controller.removeFromCart(model),
              child: Icon(Icons.remove, color: style.iconColor, size: 16.w),
            ),
            Animate(
              key: ValueKey(quantity),
              effects: [
                SlideEffect(
                  begin: const Offset(0, 0.4),
                  end: Offset.zero,
                  duration: 100.ms,
                ),
              ],
              child: SmartText(
                "$quantity",
                textAlign: TextAlign.center,
                style: style.subTitleStyle,
              ),
            ),
          ],
          InkWell(
            onTap: () => controller.addToCart(context: context,product:model,),
            child: Icon(Icons.add, color: style.iconColor, size: 16.w),
          ),
        ],
      );
    });
  }
}
