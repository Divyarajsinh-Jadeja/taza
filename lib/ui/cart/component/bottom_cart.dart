import 'package:taza/taza.dart';

class BottomCartWidget extends GetView<CartController> {
  BottomCartWidget({super.key});

  final ValueNotifier<bool> showMenu = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).checkoutStyle;
    return Obx(
      () =>
          (Get.find<DashboardController>().showFoodBottomCart
              ? ValueListenableBuilder(
                valueListenable: showMenu,
                builder: (context, value, child) {
                  return SmartColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      value
                          ? _buildReviewYourOrder(style)
                          : _buildHeader(style),
                      _buildItemWidget(style),
                    ],
                  );
                },
              )
              : SizedBox()),
    );
  }

  Widget _buildHeader(CheckoutStyle style) {
    return SmartColumn(
      height: 60.h,
      width: Get.width,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
      decoration: style.defaultDecoration,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SmartRow(
          spacing: 10.w,
          children: [
            SizedBox(
              width: 40.w,
              height: 40.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: 0.0,
                      end: controller.cartProgress,
                    ),
                    duration: const Duration(milliseconds: 400),
                    builder: (context, value, _) {
                      final isComplete = value >= 1;
                      return Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              isComplete
                                  ? style.primaryColor.withValues(alpha: 0.2)
                                  : Colors.transparent,
                        ),
                        child: CircularProgressIndicator(
                          value: value,
                          strokeWidth: 3.w,
                          backgroundColor: style.backgroundColor,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            style.primaryColor,
                          ),
                        ),
                      );
                    },
                  ),

                  SmartText(controller.cartProgressEmoji)
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                        duration: 2000.ms,
                        color: style.backgroundColor.withValues(alpha: 0.6),
                        angle: 20, // optional: shimmer angle in degrees
                      ),
                ],
              ),
            ),
            SmartText(controller.cartTitle, style: style.bottomCartTitleStyle)
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(
                  duration: 2000.ms,
                  color: style.backgroundColor.withValues(alpha: 0.6),
                  angle: 20, // optional: shimmer angle in degrees
                ),
          ],
        ),
        SizedBox(height: 5.h),
        Divider(),
      ],
    );
  }

  _buildItemWidget(CheckoutStyle style) {
    double imageSize = 35.w;
    double overlap = 15.w;
    int visibleCount =
        controller.foodList.length > 4 ? 4 : controller.foodList.length;
    double totalWidth = imageSize + (visibleCount - 1) * overlap;

    return SmartRow(
      color: style.whiteColor,
      padding: EdgeInsetsDirectional.only(
        bottom: 10.h,
        top: 10.h,
        start: 20.w,
        end: 20.w,
      ),
      mainAxisSize: MainAxisSize.min,
      width: Get.width,
      onTap: () {
        showMenu.value = !showMenu.value;
      },

      children: [
        Container(
          width: totalWidth, // this must match the space needed for overlapping
          height: imageSize,
          margin: EdgeInsetsDirectional.only(end: 10.w),
          child: Stack(
            clipBehavior: Clip.none,
            children: List.generate(visibleCount, (index) {
              return Positioned(
                left: index * overlap,
                child: Container(
                  width: imageSize,
                  height: imageSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: style.primaryColor.withValues(alpha: 0.4),
                      width: 2.w,
                    ),
                    color: style.whiteColor,
                  ),
                  child: ClipOval(
                    child: SmartImage(
                      path: controller.foodList[index].imageUrl,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        SmartColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmartRow(
              children: [
                SmartText(
                  LocaleKeys.itemsCount.tr.interpolate([
                    controller.cartQuantity,
                  ]),
                  style: style.itemNameStyle,
                ),
                ValueListenableBuilder(
                  valueListenable: showMenu,
                  builder: (_, bool expanded, __) {
                    return Animate(
                      effects: [RotateEffect(duration: 300.ms)],
                      key: ValueKey(expanded),
                      child: Icon(
                        !expanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: style.primaryColor,
                        size: 20.w,
                      ),
                    );
                  },
                ),
              ],
            ),
            SmartText(
              "You save ${50.toCurrencyCodeFormat()}",
              style: style.bottomCartGreenStyle,
            ),
          ],
        ),
        SmartRow(
          onTap: () => Get.toNamed(AppRoutes.foodCartPage),
            isExpanded: true,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
          SmartRow(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: style.primaryColor)
            ),
            padding: EdgeInsetsDirectional.all(8.w),
            spacing: 10.w,
            children: [
              Icon(Icons.shopping_cart,color: style.primaryColor,),
              SmartText(
                "TOTAL ${controller.cartTotal.toCurrencyCodeFormat()}",
                style: style.gotoCartStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          SizedBox(width: 10.w,),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: style.primaryColor,
            size: 15.w,
          ),
        ]),
      ],
    );
  }

  Widget _buildReviewYourOrder(CheckoutStyle style) {
    return SmartColumn(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      decoration: style.reviewDecoration,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      children: [
        SmartRow(
          padding: EdgeInsetsDirectional.symmetric(vertical: 10.h),
          children: [
            SmartText(
              LocaleKeys.reviewYourOrder.tr,
              style: style.deliveryHeaderStyle,
              optionalPadding: EdgeInsetsDirectional.only(bottom: 10.h),
              isExpanded: true,
            ),
            SmartImage(
              path: AppImages.icClose,
              onTap: () => showMenu.value = !showMenu.value,
            ),
          ],
        ),
        SmartColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          width: Get.width,
          padding: EdgeInsetsDirectional.all(16.w),
          decoration: style.cardDecoration,
          spacing: 10.h,
          children: [
            SmartColumn(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SmartRow(
                  children: [
                    SmartText(
                      LocaleKeys.deliveryIn.tr,
                      style: style.deliveryInStyle,
                      isExpanded: true,
                    ),
                    SmartText(
                      LocaleKeys.itemsCount.tr.interpolate([
                        controller.totalCartItems,
                      ]),
                      style: style.deliveryInStyle,
                    ),
                  ],
                ),
                SmartText(
                  LocaleKeys.minsWithTime.tr.interpolate(["12"]),
                  style: style.deliveryHeaderStyle,
                ),
              ],
            ),
            SmartDashedDivider(),
            ListView.builder(
              padding: EdgeInsetsDirectional.only(top: 8.h),
              itemCount: controller.foodList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:
                  (context, index) =>
                      ProductCheckoutCard(model: controller.foodList[index]),
            ),
          ],
        ),
      ],
    );
  }
}
