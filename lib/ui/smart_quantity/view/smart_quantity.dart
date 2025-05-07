import 'package:taza/taza.dart';

class FoodQuantityWidget extends GetView<CartController> {
  final FoodModel model;

  const FoodQuantityWidget({
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

class InstamartQuantityWidget extends GetView<InstamartCartController> {
  final InstamartProductModel model;

  const InstamartQuantityWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).foodCardStyle;

    return Obx(() {
      final inCart = controller.foodList.firstWhereOrNull((item) => item.id == model.id);
      final quantity = inCart?.quantity ?? 0;

      return quantity >0 ?SmartRow(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: EdgeInsets.all(8.w),
        spacing: 10.w,
        decoration: BoxDecoration(
          border: Border.all(color: style.iconColor),
          borderRadius: BorderRadius.circular(32.r),
        ),
        children: [
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
          InkWell(
            onTap: () => controller.addToCart(context: context,product:model,),
            child: Icon(Icons.add, color: style.iconColor, size: 16.w),
          ),
        ],
      ):SmartRow(
        onTap: () => controller.addToCart(context: context, product: model),
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: EdgeInsets.all(8.w),
        spacing: 10.w,
        decoration: BoxDecoration(
          border: Border.all(color: style.iconColor),
          borderRadius: BorderRadius.circular(32.r),
        ),
        children: [
          SmartText("ADD",style: style.buttonPrimaryStyle,optionalPadding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),)
        ],
      );
    });
  }
}
