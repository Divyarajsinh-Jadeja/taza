import 'package:taza/taza.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.model,
    this.onIncrease,
    this.onDecrease,
  });

  final FoodModel model;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).foodCardStyle;

    return SmartRow(
      onTap: () => Utils.showSmartModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => OfferPopup(),
      ),
      height: 96.h,
      margin: EdgeInsetsDirectional.only(bottom: 16.h),
      decoration: style.cardDecoration,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmartImage(
          width: 90.w,
          height: 96.h,
          path: model.imageUrl,
          clipBehavior: Clip.antiAlias,
          animator: SmartAnimator(
            animateFade: true,
            animateScale: true,
            animationDelay: 400.ms,
            animationDuration: 400.ms,
          ),
          imageBorderRadius: style.imageDecoration,
        ),
        8.horizontalSpace,
        SmartColumn(
          expanded: true,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 8.h),
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmartRow(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SmartText(
                  model.name,
                  style: style.titleStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  isExpanded: true,
                  animator: SmartAnimator(
                    animateFade: true,
                    animateSlideX: true,
                    animationDuration: 300.ms,
                    animationDelay: 600.ms,
                    animationCurve: Curves.decelerate,
                  ),
                ),
                SmartImage(
                  path: AppImages.icNonVeg,
                  height: 16.h,
                  width: 16.w,
                  animator: SmartAnimator(
                    animateFade: true,
                    animateScale: true,
                    animationDelay: 400.ms,
                    animationDuration: 400.ms,
                  ),
                ),
              ],
            ),
            4.verticalSpace,
            SmartRow(
              isExpanded: true,
              spacing: 4,
              children: [
                SmartImage(
                  path: AppImages.icStar,
                  height: 14.h,
                  animator: SmartAnimator(
                    animateFade: true,
                    animateScale: true,
                    animationDelay: 400.ms,
                    animationDuration: 400.ms,
                  ),
                ),
                SmartText(
                  "${model.rating} • ${model.deliveryTime}",
                  style: style.subTitleStyle,
                  animator: SmartAnimator(
                    animateFade: true,
                    animateSlideX: true,
                    animationDuration: 300.ms,
                    animationDelay: 500.ms,
                  ),
                ),
              ],
            ),
            SmartRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmartText(
                  model.price.toString(),
                  style: style.amountStyle,
                  animator: SmartAnimator(
                    animateScale: true,
                    animationDelay: 300.ms,
                    animationDuration: 500.ms,
                    animationCurve: Curves.decelerate,
                  ),
                ),
                SmartRow(
                  height: 32.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: style.iconColor),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  animator: SmartAnimator(
                    animationCurve: Curves.decelerate,
                    animationDelay: 600.ms,
                    animationDuration: 300.ms,
                    animateFade: true,
                    animateSlideX: true,
                  ),
                  children: [
                    IconButton(
                      iconSize: 16.r,
                      onPressed: onDecrease,
                      icon:  Icon(Icons.remove, color: style.iconColor),
                    ),
                    SmartAnimatedQuantity(quantity: model.quantity,  style: style.titleStyle.copyWith(fontSize: 13.sp),),
                    IconButton(
                      iconSize: 16.r,
                      onPressed: onIncrease,
                      icon:  Icon(Icons.add, color: style.iconColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
class SmartAnimatedQuantity extends StatefulWidget {
  final int quantity;
  final TextStyle style;

  const SmartAnimatedQuantity({
    super.key,
    required this.quantity,
    required this.style,
  });

  @override
  State<SmartAnimatedQuantity> createState() => _SmartAnimatedQuantityState();
}

class _SmartAnimatedQuantityState extends State<SmartAnimatedQuantity> {
  int? _previousQuantity;

  @override
  void didUpdateWidget(covariant SmartAnimatedQuantity oldWidget) {
    super.didUpdateWidget(oldWidget);
    _previousQuantity = oldWidget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    final bool isIncreasing = _previousQuantity == null ||
        widget.quantity > _previousQuantity!;
    final slideOffset = isIncreasing
        ? const Offset(0, 0.4) // Slide up
        : const Offset(0, -0.4); // Slide down

    return Animate(
      key: ValueKey(widget.quantity),
      effects: [
        SlideEffect(
          begin: slideOffset,
          end: Offset.zero,
          duration: 100.ms,
        ),
      ],
      child: SmartText(
        "${widget.quantity}",
        style: widget.style,
      ),
    );
  }
}
