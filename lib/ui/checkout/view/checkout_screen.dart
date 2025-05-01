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
          return [
            PopupMenuItem(
              padding: EdgeInsets.zero,
              child: SmartRow(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10.w,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
                children: [
                  SmartText(LocaleKeys.clearCart.tr, style: style.missingStyle),
                ],
              ),
              onTap: () {},
            ),
          ];
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
                SizedBox(height: 5.h,),
                _buildUnavailable(style),
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
                Get.offNamed(AppRoutes.paymentPage);
              },
              title: LocaleKeys.payAmount.tr.interpolate(["120"]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMissingSomething(CheckoutStyle style) {
    return SmartRow(
      decoration: style.cardDecoration,
      padding: EdgeInsetsDirectional.all(15.w),
      spacing: 5.w,
      mainAxisAlignment: MainAxisAlignment.center,
      onTap: () {
        Get.offAllNamed(AppRoutes.dashboardPage);
      },
      children: [
        SmartText(LocaleKeys.missingSomething.tr, style: style.missingStyle),
        SmartText(LocaleKeys.addMoreItems.tr, style: style.missingStylePrimary),
      ],
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
                  text: LocaleKeys.savedWithCoupon.tr.interpolate([
                    120.toCurrencyCodeFormat(),
                    100.toCurrencyCodeFormat(),
                  ]),
                  style: style.appliedTextStyle,
                ),
                SmartTextSpan(
                  text: " ${LocaleKeys.freeDeliveryBannerLine2.tr}",
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartText(
          LocaleKeys.billingDetails.tr,
          style: style.deliveryHeaderStyle,
          optionalPadding: EdgeInsetsDirectional.only(bottom: 10.h),
        ),
        SmartColumn(
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
                      SmartTextSpan(
                        text: " ${79.toCurrencyCodeFormat()}",
                        style: style.toPayTitleStyle,
                      ),
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
                  LocaleKeys.savedWithCoupon.tr.interpolate([
                    120.toCurrencyCodeFormat(),
                    100.toCurrencyCodeFormat(),
                  ]),
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
            SizedBox(height: 10.h),
            SmartRow(
              color: style.whiteColor,
              onTap: () {
                Get.toNamed(AppRoutes.couponsPage);
              },
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmartText(
                  LocaleKeys.viewMoreCoupons.tr,
                  style: style.subCardTitleStyle,
                  textAlign: TextAlign.center,

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
          LocaleKeys.reviewYourOrder.tr,
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

  Widget _buildUnavailable(CheckoutStyle style) {
    return SmartColumn(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      width: Get.width,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w,vertical: 10.h),
      decoration: style.cardDecoration.copyWith(
        border: Border.all(color: style.redColor)
      ),
      spacing: 10.h,
      children: [
        SmartRow(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SmartText(
              LocaleKeys.unavailableItems.tr,
              style: style.deliveryHeaderStyle,
              isExpanded: true,
            ),
            SmartRow(
              spacing: 5.w,
              children: [
                SmartText(LocaleKeys.removeAll.tr, style: style.deliveryInStyle),
                SmartImage(path: AppImages.icClose),
              ],
            ),
          ],
        ),
        SmartDashedDivider(),
        ListView.builder(
          padding: EdgeInsetsDirectional.only(top: 8.h),
          itemCount: 1,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder:
              (context, index) =>
                  ProductCheckoutCard(model: FoodModel(
                    id: "8",
                    name: 'Crispy Fries',
                    imageUrl: 'https://i.ibb.co/Wp59vWJz/fries.jpg',
                    rating: 4.1,
                    reviewsCount: 620,
                    deliveryTime: '10-15 min',
                    price: 19.0,
                  ),isOutOfStock: true,),
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
