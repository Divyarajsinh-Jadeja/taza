import 'package:taza/taza.dart';

class SmartAnimatedQuantity extends GetView<QuantityController> {
  final int index;
  final FoodModel model;
  final VoidCallback? onDecrease;
  final VoidCallback? onIncrease;

  const SmartAnimatedQuantity({
    super.key,
    required this.index,
    required this.model,
    this.onDecrease,
    this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    RxInt previousQuantity = controller.quantities[index].value.obs;
    var style = AppTheme.of(context).foodCardStyle;
    return SmartRow(
      height: 32.h,
      padding: EdgeInsets.all(8.w),
      spacing: 10.w,
      decoration: BoxDecoration(
        border: Border.all(color: style.iconColor),
        borderRadius: BorderRadius.circular(32.r),
      ),
      animator: SmartAnimator(
        animationCurve: Curves.decelerate,
        animationDelay: 600.ms,
        animationDuration: 300.ms,
        animateFade: true,
        animateSlideX: true,
      ),
      children: [
        if (model.quantity > 0) ...[
          InkWell(
            onTap: onDecrease,
            child: Icon(Icons.remove, color: style.iconColor, size: 16.r),
          ),
          Obx(() {
            final int current = controller.quantities[index].value;
            final bool isIncreasing = current > previousQuantity.value;
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
                style: style.titleStyle.copyWith(fontSize: 13.sp),
              ),
            );

            previousQuantity.value = current;

            return animated;
          }),
        ],
        InkWell(
          onTap: onIncrease,
          child: Icon(Icons.add, color: style.iconColor, size: 16.r),
        ),
      ],
    );
  }
}
