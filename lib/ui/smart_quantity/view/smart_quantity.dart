import 'package:taza/taza.dart';

class SmartAnimatedQuantity extends GetView<QuantityController> {
  final TextStyle style;
  final int index;

  const SmartAnimatedQuantity({
    super.key,
    required this.index,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    RxInt previousQuantity = controller.quantities[index].value.obs;

    return Obx(() {
      final int current = controller.quantities[index].value;
      final bool isIncreasing = current > previousQuantity.value;
      final Offset slideOffset = isIncreasing
          ? const Offset(0, 0.4)
          : const Offset(0, -0.4);

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
          "$current",
          style: style,
        ),
      );

      previousQuantity.value = current;

      return animated;
    });
  }
}

