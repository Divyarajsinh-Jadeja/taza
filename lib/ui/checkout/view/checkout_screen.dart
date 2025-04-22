import 'package:taza/taza.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({super.key});


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 500), () {
        Get.dialog(RewardDialog());
      });
    });

    final style = AppTheme.of(context).checkoutStyle;
    return Scaffold(
      backgroundColor: style.backgroundColor,
      appBar: SmartAppBar(
        showHomeWithAddress: true,
        popupMenuItemBuilder: (p0) {
          return [PopupMenuItem(
            padding: EdgeInsets.zero,
            child: SmartRow(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10.w,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
            children: [
              SmartText("Clear Cart",style: style.missingStyle,),
            ],
          ), onTap: () {},)];
        },
      ),
      body: Stack(
        children: [
          SmartSingleChildScrollView(
            padding: EdgeInsetsDirectional.only(top: 20.h),
            child: SmartColumn(
              padding: EdgeInsetsDirectional.all(20.w),
              mainAxisSize: MainAxisSize.min,
              spacing: 20.h,
              children: [
                _buildReviewYourOrder(style),
                _buildMissingSomething(style),
                _buildSavingCorner(style),
                SmartDeliveryTabBar(),
                _buildToPaySar(style),
              ],
            ),
          ),
          _buildTopAppliedOrder(style),
        ],
      ),
      bottomNavigationBar: SmartRow(
        height: 95.h,
        decoration: BoxDecoration(color: style.whiteColor),
        padding: EdgeInsetsDirectional.only(
          top: 16.h,
          bottom: 26.h,
          start: 19.w,
          end: 19.w,
        ),
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmartColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4.h,
            expanded: true,
            children: [
              SmartRow(
                spacing: 4.w,
                children: [
                  SmartText(
                    LocaleKeys.payUsing.tr,
                    style: style.payUsingTextStyle,
                  ),
                  SmartImage(path: AppImages.icArrowUp, size: 16.w),
                ],
              ),
              SmartText(LocaleKeys.payPal.tr, style: style.paymentTextStyle),
            ],
          ),
          Expanded(
            child: SmartButton(
              onTap: () {
                Get.offNamed(AppRoutes.orderTrackingPage);
              },
              title: "Pay 79 SAR",
            ),
          ),
        ],
      ),
    );
  }

  Container _buildMissingSomething(CheckoutStyle style) {
    return Container(
      decoration: style.cardDecoration,
      padding: EdgeInsetsDirectional.all(15.w),
      child: SmartRow(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmartText("Missing Something? ", style: style.missingStyle),
          SmartText("Add more items ", style: style.missingStylePrimary),
        ],
      ),
    );
  }

  Widget _buildTopAppliedOrder(CheckoutStyle style) {
    return Stack(
      children: [
        Container(
          height: 30.h,
          width: Get.width,
          decoration: style.topAppliedDecoration,
        ),
        Container(
          height: 30.h,
          width: Get.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                style.primaryColor.withValues(alpha: 0.1),
                style.primaryColor.withValues(alpha: 0.4),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: SmartRichText(
              spans: [
                SmartTextSpan(
                  text: "${58.toCurrencyCodeFormat()} saved! FREE DELIVERY",
                  style: style.appliedTextStyle,
                ),
                SmartTextSpan(
                  text: " applied on this order",
                  style: style.appliedTextStyleThin,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  SmartColumn _buildToPaySar(CheckoutStyle style) {
    return SmartColumn(
      decoration: style.cardDecoration,
      padding: EdgeInsetsDirectional.all(16.w),
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6.h,
      children: [
        SmartRow(
          spacing: 8.w,
          children: [
            SmartImage(path: AppImages.icDoc, height: 20.w, width: 20.w),
            Expanded(
              child: SmartRichText(
                spans: [
                  SmartTextSpan(
                    text: "${LocaleKeys.toPayPrefix.tr} ",
                    style: style.toPayTitleStyle,
                  ),
                  SmartTextSpan(
                    text: 89.toCurrencyCodeFormat(),
                    style: style.toPayTitleDiscountedStyle,
                  ),
                  SmartTextSpan(text: " 79 SAR", style: style.toPayTitleStyle),
                ],
              ),
            ),
          ],
        ),
        SmartText(
          LocaleKeys.savedOnTotal.tr.interpolate([10.toCurrencyCodeFormat()]),
          style: style.appliedTextStyle,
          optionalPadding: EdgeInsetsDirectional.only(start: 28.w),
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(vertical: 4.0.h),
          child: SmartDashedDivider(),
        ),
        _buildBillingRow(
          style: style,
          title: LocaleKeys.itemTotal.tr,
          originalPrice: 258.toCurrencyCodeFormat(),
          price: 150.toCurrencyCodeFormat(),
        ),
        _buildBillingRow(
          style: style,
          title: LocaleKeys.extraDiscount.tr,
          price: "- ${20.toCurrencyCodeFormat()}",
        ),
        _buildBillingRow(
          style: style,
          title: LocaleKeys.deliveryFee.tr,
          price: 50.toCurrencyCodeFormat(),
        ),
        _buildBillingRow(
          style: style,
          title: LocaleKeys.platformFee.tr,
          price: 50.toCurrencyCodeFormat(),
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(vertical: 4.0.h),
          child: SmartDashedDivider(),
        ),
        SmartRow(
          padding: EdgeInsetsDirectional.only(bottom: 4.h),
          children: [
            SmartText(
              LocaleKeys.toPayPrefix.tr,
              style: style.titleStyle,
              isExpanded: true,
            ),
            SmartText(300.toCurrencyCodeFormat(), style: style.titleStyle),
          ],
        ),
      ],
    );
  }

  Widget _buildSavingCorner(CheckoutStyle style) {
    return SmartColumn(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartText(
          LocaleKeys.savingCorner.tr,
          style: style.deliveryHeaderStyle,
          optionalPadding: EdgeInsetsDirectional.only(bottom: 10.h),
        ),
        SmartColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          width: Get.width,
          padding: EdgeInsetsDirectional.all(16.w),
          decoration: style.cardDecoration,
          children: [
            SmartRow(
              children: [
                SmartImage(
                  path: AppImages.icSaveTag,
                  width: 16.w,
                  height: 16.w,
                ),
                SizedBox(width: 8.w),
                SmartText(
                  "10 SAR saved with ‘Save 10’",
                  style: style.savingTitleStyle,
                ),
                Spacer(),
                Icon(Icons.check, color: style.greenColor, size: 16.w),
                SizedBox(width: 4.w),
                SmartText(LocaleKeys.applied.tr, style: style.appliedTextStyle),
              ],
            ),
            SizedBox(height: 10.h),
            SmartDashedDivider(),
            10.height,
            SmartRow(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmartText(
                  LocaleKeys.viewMoreCoupons.tr,
                  style: style.subCardTitleStyle,
                  textAlign: TextAlign.center,
                  onTap: () {
                    Get.toNamed(AppRoutes.couponsPage);
                  },
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: style.subCardTitleStyle.color,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildReviewYourOrder(CheckoutStyle style) {
    return SmartColumn(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartText(
          "Review your Order",
          style: style.deliveryHeaderStyle,
          optionalPadding: EdgeInsetsDirectional.only(bottom: 10.h),
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
                  (context, index) =>
                      ProductCheckoutCard(model: controller.foodList[index]),
            ),
          ],
        ),
      ],
    );
  }

  _buildBillingRow({
    required CheckoutStyle style,
    required String title,
    required String price,
    String? originalPrice,
  }) {
    return SmartRow(
      padding: EdgeInsetsDirectional.only(bottom: 4.h),
      spacing: 10.w,
      children: [
        SmartText(
          title,
          style: style.billingTitleStyle,
          isExpanded: true,
          maxLines: 2,
        ),
        if (originalPrice.isNotNullNorEmpty)
          SmartText(
            originalPrice,
            decoration: TextDecoration.lineThrough,
            style: style.billingSubTitleStyle,
          ),
        SmartText(price, style: style.billingSubTitleStyle, maxLines: 2),
      ],
    );
  }
}
