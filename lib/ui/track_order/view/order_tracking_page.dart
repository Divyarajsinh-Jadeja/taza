import 'package:taza/taza.dart';

class OrderTrackingPage extends GetView<OrderTrackingController> {
  const OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).orderTrackingPageStyle;
    return Scaffold(
      appBar: _buildAppBar(style),
      body: SafeArea(
        child: SmartSingleChildScrollView(
          child: SmartColumn(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            children: [
              SizedBox(height: 12.h),
              _buildMapWidget(),
              SizedBox(height: 20.h),
              _infoAssignDeliveryCard(style),
              SizedBox(height: 20.h),
              _tipCardWidget(style),
              SizedBox(height: 20.h),
              _paymentCardWidget(style),
              SizedBox(height: 20.h),
              _addDeliveryAddressCardWidget(style),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(OrderTrackingPageStyle style) {
    return SmartAppBar(
      backgroundColor: style.headerBgColor,
      leadingImage: AppImages.icArrowLeft,
      backIconColor: style.circleBgColor,
      showTitleAndSubtitle: true,
      onBack: () {
        Get.offAllNamed(AppRoutes.dashboardPage);
      },
    );
  }


  Widget _buildMapWidget() {
    return SmartImage(
        imageBorderRadius: BorderRadius.circular(12.r),
        clipBehavior: Clip.antiAlias,
        path: "https://i.ibb.co/S4037GTr/google-map.png",
        width:Get.width,
        height: 250.h,
      );
  }

  Widget _infoAssignDeliveryCard(OrderTrackingPageStyle style) {
    return SmartColumn(
      decoration: style.mainCardDecoration,
      children: [
        _infoRow(style),
        Divider(height: 8.h, color: style.dividerColor),
        _infoSecureRow(style),
      ],
    );
  }

  Widget _infoRow(OrderTrackingPageStyle style) {
    return _circleImageTextRow(
      image: AppImages.icDeliveryBoy,
      text: LocaleKeys.assignDeliveryPartner.tr,
      style: style,
    );
  }

  Widget _infoTipRow(OrderTrackingPageStyle style) {
    return SmartRow(
      padding: EdgeInsetsDirectional.all(10.w),
      children: [
        SmartImage(
          path: AppImages.icDeliveryBoy,
          size: 42.h,
          padding: EdgeInsetsDirectional.all(6.w),
          decoration: style.circleBgDecoration,
        ),
        SizedBox(width: 8.w),
        SmartText(
          LocaleKeys.deliveryPartnerName.tr,
          isExpanded: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: style.titleTextStyle,
        ),
        SmartImage(
          path: AppImages.icCall,
          height: 38.h,
          width: 38.h,
          padding: EdgeInsetsDirectional.all(6.w),
          decoration: style.circleBgDecoration,
        ),
      ],
    );
  }

  Widget _infoSecureRow(OrderTrackingPageStyle style) {
    return SmartRow(
      padding: EdgeInsetsDirectional.all(10.w),
      children: [
        SmartImage(path: AppImages.icShield, height: 30.h, width: 30.h),
        SizedBox(width: 8.w),
        SmartText(
          LocaleKeys.yourBlinkitStoreDistance.tr,
          isExpanded: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: style.subtitleTextStyle,
        ),
        SmartImage(path: AppImages.icArrowRight),
      ],
    );
  }

  Widget _paymentCardWidget(OrderTrackingPageStyle style) {
    return SmartColumn(
      decoration: style.mainCardDecoration,
      children: [
        SmartRow(
          padding: EdgeInsetsDirectional.all(10.w),
          children: [
            SmartImage(
              path: AppImages.icCard,
              size: 42.h,
              padding: EdgeInsetsDirectional.all(6.w),
              decoration: BoxDecoration(
                color: style.circleBgColor,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 8.w),
            SmartColumn(
              expanded: true,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmartText(LocaleKeys.payAmountBeforeDelivery.tr.interpolate([142]), style: style.titleTextStyle),
                SmartText(LocaleKeys.keepChangeOrPayOnline.tr.interpolate([142]), style: style.payOnlineSubTitleStyle),
              ],
            ),
          ],
        ),
        Divider(color: style.dividerColor),
        SmartText(LocaleKeys.payOnline.tr, style: style.payOnlineTextStyle, optionalPadding: EdgeInsetsDirectional.all(12.w)),
      ],
    );
  }

  Widget _addDeliveryAddressCardWidget(OrderTrackingPageStyle style) {
    return SmartColumn(
      decoration: style.mainCardDecoration,
      padding: EdgeInsetsDirectional.only(bottom: 10.w),
      children: [
        Theme(
          data: Theme.of(Get.context!).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: EdgeInsetsDirectional.only(end: 10.w),
            title: _circleImageTextRow(
              image: AppImages.icMic,
              text: LocaleKeys.addDeliveryInstructions.tr,
              subText: LocaleKeys.helpDeliveryPartner.tr,
              style: style,
            ),
            children: [_buildDeliveryInstructionsList(style, controller)],
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryInstructionsList(OrderTrackingPageStyle style, OrderTrackingController controller) {
    return SizedBox(
      height: 110.h,
      child: ListView.separated(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
        scrollDirection: Axis.horizontal,
        itemCount: controller.instructions.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (_, index) {
          final item = controller.instructions[index];
          return SmartColumn(
            width: 110.h,
            padding: EdgeInsetsDirectional.all(14.h),
            decoration: style.cardDecoration,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmartRow(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmartImage(path: item['icon'] ?? "", size : 24.w),
                  Obx(() {
                    final isSelected = controller.selectedInstructionIndexes.contains(index);
                    return SizedBox(
                      height: 28.w,
                      width: 28.w,
                      child: Checkbox(
                        value: isSelected,
                        onChanged: (_) => controller.toggleInstructionIndex(index),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        activeColor: style.headerBgColor,
                        side: BorderSide(color: style.headerBgColor),
                      ),
                    );
                  }),
                ],
              ),
              SmartText(item['label'] ?? '', style: style.subtitleTextStyle),
            ],
          );
        },
      ),
    );
  }

  Widget _tipCardWidget(OrderTrackingPageStyle style) {
    return SmartColumn(
      decoration: style.mainCardDecoration,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoTipRow(style),
        NotchedMessageBubble(
          margin:  EdgeInsetsDirectional.all(8.w),
          padding: EdgeInsetsDirectional.all(10.w),
          message: LocaleKeys.pickedUpOnWay.tr,
        ),
        _leavingATipWidget(style),
        SmartRow(
          padding: EdgeInsetsDirectional.all(10.w),
          children: [
            SmartImage(path: AppImages.icSun, height: 32.h, width: 32.h),
            SizedBox(width: 8.w),
            SmartText(
              LocaleKeys.hotDayKindness.tr,
              isExpanded: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: style.subtitleTextStyle,
            ),
          ],
        ),
      ],
    );
  }

  Widget _circleImageTextRow({
    required String image,
    required String text,
    String? subText,
    required OrderTrackingPageStyle style,
  }) {
    return SmartRow(
      padding: EdgeInsetsDirectional.all(10.w),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartImage(
          path: image,
          size: 42.w,
          padding: EdgeInsetsDirectional.all(6.w),
          decoration: style.circleBgDecoration,
        ),
        SizedBox(width: 8.w),
        SmartColumn(
          expanded: true,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmartText(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: style.titleTextStyle,
            ),
            if (subText != null)
              SmartText(
                subText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: style.subtitleTextStyle,
              ),
          ],
        ),
      ],
    );
  }

  Widget _leavingATipWidget(OrderTrackingPageStyle style) {
    return SmartColumn(
      margin: EdgeInsetsDirectional.all(10.w),
      height: 120.h,
      width: Get.width,
      padding: EdgeInsetsDirectional.all(10.w),
      decoration: style.tipCardDecoration,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartText(LocaleKeys.deliveringHappiness.tr, style: style.titleTextStyle),
        SmartText(LocaleKeys.thankThemByTip.tr, style: style.subtitleTextStyle),
        SizedBox(height: 10.h),
        SizedBox(
          height: 45.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            separatorBuilder: (builder, index) => SizedBox(width: 12.w),
            itemBuilder: (builder, index) {
              final tipItems = controller.tips[index];
              return SmartRow(
                crossAxisAlignment: CrossAxisAlignment.center,
                padding: EdgeInsetsDirectional.all(10.w),
                decoration: style.tipCardDecoration,
                children: [
                  SmartImage(path: AppImages.icEmoji),
                  SizedBox(width: 4.w,),
                  SmartText(
                    "${tipItems['rupees']}",
                    style: style.tipAmountTextStyle
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}