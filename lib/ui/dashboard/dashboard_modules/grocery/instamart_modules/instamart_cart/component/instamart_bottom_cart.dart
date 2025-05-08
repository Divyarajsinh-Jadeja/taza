import 'package:taza/taza.dart';

class InstamartBottomCartWidget extends GetView<InstamartCartController> {
  InstamartBottomCartWidget({super.key});

  final ValueNotifier<bool> showMenu = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).checkoutStyle;
    return Obx(
      () =>
          (Get.find<DashboardController>().showInstamartBottomCart
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
    int visibleCount =
        controller.foodList.length > 4 ? 4 : controller.foodList.length;
    double totalWidth = 30.w + (visibleCount - 1) * 8.w;
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
          width: totalWidth,
          height: 35.h,
          margin: EdgeInsetsDirectional.only(end: 10.w),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: List.generate(
              controller.foodList.length > 4 ? 4 : controller.foodList.length,
              (index) {
                return Positioned(
                  left: index * 8.w,
                  child: SmartImage(
                    /// TODO: below image will change once we integrate api
                    path: controller.foodList[index].imageUrl,
                    imageBorderRadius: BorderRadius.circular(6.r),
                    clipBehavior: Clip.antiAlias,
                    width: 30.w,
                    height: 35.w,
                    decoration: BoxDecoration(
                      color: style.whiteColor,
                      border: Border.all(color: style.whiteColor, width: 1.w),
                      borderRadius: BorderRadius.circular(6.r),
                    ),

                  ),
                );
              },
            ),
          ),
        ),
        SmartColumn(
          expanded: true,
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
        SmartButton(
          width: 120.w,
          height: 40.h,
          onTap: () => Get.toNamed(AppRoutes.instamartCartPage),
          title: LocaleKeys.gotoCart.tr,
          titleStyle: style.gotoCartStyle,

        ),
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
                      InstamartProductCheckoutCard(model: controller.foodList[index]),
            ),
          ],
        ),
      ],
    );
  }
}
