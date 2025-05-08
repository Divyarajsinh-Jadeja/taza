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
            onTap: () async {
              if (quantity == 0 && model.addons.isNotEmpty) {
                await showSmartAddOnSelector(
                context: context,
                model: model,
                style: style,
                onAdd: () => controller.addToCart(context: context, product: model),
                );
              } else {
                controller.addToCart(context: context, product: model);
              }
            },
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

Future<void> showSmartAddOnSelector({
  required BuildContext context,
  required FoodModel model,
  required VoidCallback onAdd,
  required FoodCardStyle style,
}) async {
  int tempQuantity = 1;

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) {
          return Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: style.whiteColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
            ),
            child: SafeArea(
              child: StatefulBuilder(
                builder: (context, setState) {
                  final ValueNotifier<List<bool>> selectedAddOns =
                  ValueNotifier(model.addons.map((e) => e.isSelected).toList());

                  return ValueListenableBuilder<List<bool>>(
                    valueListenable: selectedAddOns,
                    builder: (context, selected, _) {
                      final double totalPrice = ((model.price +
                          model.addons.asMap().entries
                              .where((entry) => selected[entry.key])
                              .fold(0.0, (sum, entry) => sum + entry.value.price)) *
                          tempQuantity);

                      return SmartColumn(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// 🧾 Header
                          SmartRow(
                            spacing: 12.w,
                            children: [
                              SmartImage(
                                path: model.imageUrl,
                                width: 48.w,
                                height: 48.w,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: SmartText(
                                  model.name,
                                  style: style.titleStyle,
                                  maxLines: 2,
                                  isExpanded: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              InkWell(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(Icons.close),
                              ),
                            ],
                          ),

                          SizedBox(height: 16.h),
                          SmartText(LocaleKeys.chooseAddOns.tr, style: style.titleStyle),
                          SizedBox(height: 12.h),

                          /// Addon List
                          Expanded(
                            child: ListView.builder(
                              itemCount: model.addons.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final addon = model.addons[index];
                                final bool isUnavailable =
                                addon.name.contains("Unavailable");
                            
                                return SmartRow(
                                  onTap: () {
                                    final selectedCount =
                                        selected.where((v) => v).length;
                                    if (!selected[index] && selectedCount >= 3) return;
                            
                                    selected[index] = !selected[index];
                                    selectedAddOns.value = [...selected];
                                  },
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  spacing: 12.w,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmartText(
                                      addon.name,
                                      isExpanded: true,
                                      style: isUnavailable
                                          ? style.titleStyle.copyWith(color: Colors.grey)
                                          : style.subTitleStyle,
                                      maxLines: 2,
                                    ),
                                    SmartText(
                                      "+${addon.price.toCurrencyCodeFormat()}",
                                      style: style.titleStyle,
                                    ),
                                    if (!isUnavailable)
                                      Icon(
                                        selected[index]
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank,
                                        color: style.iconColor,
                                        size: 20.w,
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),

                          Divider(height: 32.h, color: Colors.grey.shade400),

                          /// Quantity + Add to Cart
                          SmartRow(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmartRow(
                                isExpanded: true,
                                spacing: 8.w,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (tempQuantity > 1) {
                                        setState(() => tempQuantity--);
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4.w),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: style.iconColor),
                                        borderRadius: BorderRadius.circular(4.r),
                                      ),
                                      child: Icon(Icons.remove, size: 16.w),
                                    ),
                                  ),
                                  SmartText("$tempQuantity", style: style.titleStyle),
                                  InkWell(
                                    onTap: () {
                                      setState(() => tempQuantity++);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4.w),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: style.iconColor),
                                        borderRadius: BorderRadius.circular(4.r),
                                      ),
                                      child: Icon(Icons.add, size: 16.w),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: SmartButton(
                                  title: "${LocaleKeys.addItem.tr} | ${totalPrice.toCurrencyCodeFormat()}",
                                  onTap: () {
                                    /// Save selections only here
                                    for (int i = 0; i < model.addons.length; i++) {
                                      model.addons[i].isSelected = selected[i];
                                    }
                                    model.quantity = tempQuantity;
                                    Navigator.pop(context);
                                    onAdd();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      );
    },
  );
}





