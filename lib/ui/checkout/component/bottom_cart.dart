import 'package:taza/taza.dart';
class BottomCartWidget extends GetView<CheckoutController> {
  BottomCartWidget({super.key});

  final ValueNotifier<bool> showMenu = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).checkoutStyle;
    return ValueListenableBuilder(
      valueListenable: showMenu,
      builder: (context, value, child) {
        return SmartColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            value ? _buildReviewYourOrder(style):_buildHeader(style),
            _buildItemWidget(style)
          ],
        );
      },
    );
  }

  Widget _buildHeader(CheckoutStyle style) {
    return SizedBox(
      height: 90.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SmartColumn(
            height: 50.h,
            width: Get.width,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
            decoration: style.defaultDecoration,

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SmartText(
                LocaleKeys.freeDeliveryMessage.tr,
                style: style.titleStyle,
              ),
              SizedBox(height: 10.h),
              Divider(),
            ],
          ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            top: 35.h,
            start: 10.w,
            child: SmartImage(path: AppImages.deliveryLottie,size: 50.w,),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItems(CheckoutStyle style) {
    return SmartAnimator(
      animateSlideY: true,
      slideYBegin: const Offset(0, 2),
      slideEnd: Offset.zero,
      animationDelay: 10.ms,
      animationDuration: 200.ms,
      animationCurve: Curves.easeInOutCubic,
      child: SmartColumn(
        height: 350.h,
        width: Get.width,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        decoration: style.reviewDecoration,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          SmartRow(
            children: [
              SmartText(LocaleKeys.reviewItems.tr, isExpanded: true,style: style.reviewTitleStyle,),
              SmartImage(path: AppImages.icClose,onTap: () => showMenu.value = !showMenu.value,),

            ],
          ),

          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.all(12.w),
              decoration: style.fullDefaultDecoration,
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: controller.foodList.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder:
                    (context, index) => ProductCheckoutCard(model: controller.foodList[index],),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildItemWidget(CheckoutStyle style) {
    return SmartRow(
      color: style.whiteColor,
      padding: EdgeInsetsDirectional.only(bottom: 10.h, top: 10.h,start: 20.w,end: 20.w),
      mainAxisSize: MainAxisSize.min,
      width: Get.width,
      onTap: () {
        showMenu.value = !showMenu.value;
      },
      spacing: 10.w,
      children: [
        SizedBox(
          width: 50.w,
          height: 35.h,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: List.generate(3, (index) {
              return Positioned(
                left: index * 10.w,
                child: Container(
                  width: 30.w,
                  height: 35.w,
                  decoration: BoxDecoration(
                    color: style.whiteColor,
                    border: Border.all(color: style.whiteColor, width: 1.w),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: SmartImage(
                    /// TODO: below image will change once we integrate api
                    path: "https://i.ibb.co/MkqsDTsx/salad.jpg",
                    imageBorderRadius: BorderRadius.circular(6.r),
                    clipBehavior: Clip.antiAlias,
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
                SmartText(LocaleKeys.itemsCount.tr.interpolate([10.toCurrencyCodeFormat()]), style: style.itemNameStyle),
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
            SmartText(LocaleKeys.youSave.tr.interpolate([20.toCurrencyCodeFormat()]), style: style.itemAmountStyle),
          ],
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
            SmartText("Review your Order",style: style.deliveryHeaderStyle,optionalPadding: EdgeInsetsDirectional.only(bottom: 10.h),isExpanded: true,),
            SmartImage(path: AppImages.icClose,onTap: () => showMenu.value=!showMenu.value,)
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
                      LocaleKeys.itemsCount.tr.interpolate(["2"]),
                      style: style.deliveryInStyle,
                    ),
                  ],
                ),
                SmartText("35 Mins", style: style.deliveryHeaderStyle),
              ],
            ),
            SmartDashedDivider(),
            ListView.builder(
              padding: EdgeInsetsDirectional.only(top: 8.h),
              itemCount: controller.foodList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:
                  (context, index) => ProductCheckoutCard(
                model: controller.foodList[index],
              ),
            ),
          ],
        ),
      ],
    );
  }


}