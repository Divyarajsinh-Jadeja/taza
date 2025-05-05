import 'package:taza/taza.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.model,
    this.onIncrease,
    this.onDecrease,
    required this.index,
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
          fit: BoxFit.fitHeight,
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
                  model.price.toCurrencyCodeFormat(),
                  style: style.amountStyle,
                  animator: SmartAnimator(
                    animateScale: true,
                    animationDelay: 300.ms,
                    animationDuration: 500.ms,
                    animationCurve: Curves.decelerate,
                  ),
                ),

                SmartAnimatedQuantity(model: model),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ReorderCard extends StatelessWidget {
  const ReorderCard({
    super.key,
    required this.model,
    this.onIncrease,
    this.onDecrease,
    required this.index,
  });

  final FoodModel model;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final int index;

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).foodCardStyle;
    return SmartColumn(
      mainAxisSize: MainAxisSize.min,
      decoration: style.cardDecoration,
      margin: EdgeInsetsDirectional.only(bottom: 20.h),
      padding: EdgeInsetsDirectional.only(bottom: 10.h),
      spacing: 10.h,
      children: [
        SmartRow(
          padding: EdgeInsetsDirectional.all(10.w),
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.w,
          margin: EdgeInsetsDirectional.all(4.w),
          decoration: style.halfCardDecoration,
          children: [
            SmartImage(
              size: 50.w,
              path: model.imageUrl,
              clipBehavior: Clip.antiAlias,
              imageBorderRadius: style.imageDecoration,
            ),
            SmartColumn(
              expanded: true,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SmartRow(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SmartText(
                      model.restaurantName,
                      style: style.titleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      isExpanded: true,
                    ),
                  ],
                ),
                SmartRow(
                  spacing: 4.w,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmartImage(path: AppImages.icStar, height: 14.h),
                    SmartText(
                      "${model.rating} • ${model.deliveryTime}",
                      style: style.subTitleStyle,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SmartRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
          spacing: 10.w,
          children: [
            SmartRow(
              spacing: 10.w,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmartImage(
                  path: model.isVeg ? AppImages.icVeg : AppImages.icNonVeg,
                  size: 10.w,
                  margin: EdgeInsetsDirectional.only(top: 5.h),
                ),
                SmartColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SmartText(model.name, style: style.reorderTitleStyle),
                    SmartText(
                      model.price.toCurrencyCodeFormat(),
                      style: style.reorderAmountStyle,
                    ),
                  ],
                ),
              ],
            ),
            SmartAnimatedQuantity(model: model),
          ],
        ),
        /*SmartRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
          spacing: 10.w,
          children: [
            SmartRow(
              spacing: 10.w,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmartImage(
                  path: model.isVeg ? AppImages.icVeg : AppImages.icNonVeg,
                  size: 10.w,
                  margin: EdgeInsetsDirectional.only(top: 5.h),
                ),
                SmartColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SmartText(model.name, style: style.reorderTitleStyle),
                    SmartText(
                      model.price.toCurrencyCodeFormat(),
                      style: style.reorderAmountStyle,
                    ),
                  ],
                ),
              ],
            ),
            SmartAnimatedQuantity(model: model),
          ],
        ),*/
      ],
    );
  }
}

class MyOrderCard extends StatelessWidget {
  const MyOrderCard({
    super.key,
    required this.model,
    this.onIncrease,
    this.onDecrease,
    required this.index,
  });

  final FoodModel model;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final int index;

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).foodCardStyle;
    return SmartColumn(
      color: Colors.transparent,
      onTap: () => Get.toNamed(AppRoutes.orderDetailsPage, arguments: model),
      mainAxisSize: MainAxisSize.min,
      margin: EdgeInsetsDirectional.only(bottom: 20.h),
      padding: EdgeInsetsDirectional.only(bottom: 10.h),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SmartRow(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 4.w,
              children: [
                SmartText(
                  model.restaurantName,
                  style: style.titleStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  isExpanded: true,
                ),
                SmartText(
                  "Delivered",
                  style: style.reorderTitleStyle,
                  maxLines: 1,
                ),
                CircleAvatar(
                  radius: 8.r,
                  backgroundColor: style.greenColor,
                  child: Icon(Icons.done, color: style.whiteColor, size: 10.w),
                ),
              ],
            ),
            SmartText(
              "1600 Amphitheatre, Mountain View",
              style: style.grayStyle,
              maxLines: 1,
            ),
            SmartRow(
              children: [
                SmartText(
                  535.toCurrencyCodeFormat(),
                  style: style.grayStyle,
                  maxLines: 1,
                ),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: style.grayStyle.color,
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(vertical: 10.h),
          child: SmartDashedDivider(),
        ),
        SmartText(model.name, style: style.grayStyle),
        SmartText("December 31, 12:29 PM", style: style.grayStyle),
        SizedBox(height: 10.h),
        SmartRow(
          spacing: 20.w,
          children: [
            Expanded(
              child: SmartButton.white(
                height: 40.h,
                borderColor: style.buttonGrayStyle.color,
                titleStyle: style.buttonGrayStyle,
                onTap: () {},
                title: LocaleKeys.reorder.tr.toUpperCase(),
              ),
            ),
            Expanded(
              child: SmartButton.white(
                height: 40.h,
                borderColor: style.buttonPrimaryStyle.color,
                titleStyle: style.buttonPrimaryStyle,
                onTap: () {},
                title: "RATE ORDER",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
