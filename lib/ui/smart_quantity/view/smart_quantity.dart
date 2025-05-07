import 'package:taza/taza.dart';

class FoodQuantityWidget extends GetView<CartController> {
  final FoodModel model;
  final bool fromCart;
  const FoodQuantityWidget({
    super.key,
    required this.model,
    this.fromCart=false
  });

  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).foodCardStyle;

    return Obx(() {
      final inCart = controller.foodList.firstWhereOrNull((item) => item.id == model.id);
      final quantity = inCart?.quantity ?? 0;

      return SmartRow(
        padding: EdgeInsetsDirectional.all(8.w),
        spacing: 10.w,
        decoration: BoxDecoration(
          border: Border.all(color: style.iconColor),
          borderRadius: BorderRadius.circular(32.r),
        ),
        children: [
          if (quantity > 0) ...[
            InkWell(
              onTap: () async {
                print(fromCart);
                if(!fromCart){
                  controller.removeFromCart(model);
                }
                else{
                  showDialog(
                    context: context,
                    builder: (context) =>
                        ConfirmRemoveDialog(
                          onConfirm: () => controller.removeFromCart(model),
                        ),
                  );
                }
              },
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
  final bool fromCart;
  const InstamartQuantityWidget({
    super.key,
    required this.model,
    this.fromCart=false
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
        padding: EdgeInsetsDirectional.all(8.w),
        spacing: 10.w,
        decoration: BoxDecoration(
          border: Border.all(color: style.iconColor),
          borderRadius: BorderRadius.circular(32.r),
        ),
        children: [
            InkWell(
              onTap: () async {
                if(!fromCart){
                  controller.removeFromCart(model);
                }
                else{
                  showDialog(
                    context: context,
                    builder: (context) =>
                        ConfirmRemoveDialog(
                          onConfirm: () => controller.removeFromCart(model),
                        ),
                  );
                }
              },
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
        padding: EdgeInsetsDirectional.all(8.w),
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

/// TODO below code need to place in new file
class ConfirmRemoveDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const ConfirmRemoveDialog({
    super.key,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).dialogStyle;

    return Dialog(
      backgroundColor: style.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: SmartColumn(
          spacing: 20.h,
          mainAxisSize: MainAxisSize.min,
          children: [
            SmartText(
              "Remove Item?",
              style: style.titleStyle,
              textAlign: TextAlign.center,
            ),
            SmartText(
              "Are you sure you want to remove this item from your cart?",
              style: style.messageStyle,
              textAlign: TextAlign.center,
            ),
            SmartRow(
              spacing: 12.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmartButton.white(
                  title: "Cancel",
                  onTap: () => Navigator.of(context).pop(),
                  width: 100.w,
                  height: 40.h,
                ),
                SmartButton(
                  title: "Remove",
                  onTap: () {
                    Navigator.of(context).pop();
                    onConfirm();
                  },
                  width: 100.w,
                  height: 40.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}