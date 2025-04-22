import 'package:taza/taza.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.model,
    this.onIncrease,
    this.onDecrease, required this.index,
  });

  final FoodModel model;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final int index;
  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).foodCardStyle;

    return SmartRow(
      onTap:
          () => Utils.showSmartModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => OfferPopup(),
          ),
      height: 110.h,
      margin: EdgeInsetsDirectional.only(bottom: 16.h),
      decoration: style.cardDecoration,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmartImage(
          width: 90.w,
          height: 110.h,
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
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 8.w,
            vertical: 8.h,
          ),
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
                  height: 16.w,
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
            6.verticalSpace,
            SmartRow(
              isExpanded: true,
              spacing: 4.w,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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

                SmartAnimatedQuantity( model: model,)
              ],
            ),
          ],
        ),
      ],
    );
  }
}

