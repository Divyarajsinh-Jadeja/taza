import 'package:taza/taza.dart';

class SmartDeliveryTabBar extends GetView<SmartDeliveryTabController> {
  final List<Widget>? tabBarViewWidgets;

  const SmartDeliveryTabBar({
    super.key,
    this.tabBarViewWidgets,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).checkoutStyle;

    return SmartColumn(
      decoration: BoxDecoration(
        color: style.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 16.w,
        vertical: 16.w,
      ),
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 40.h,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: style.tabDisableBgColor,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: TabBar(
            controller: controller.tabController,
            labelColor: style.whiteColor,
            dividerHeight: 0.0,
            unselectedLabelStyle: style.tabDisableTextStyle,
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: EdgeInsetsDirectional.symmetric(horizontal: 0.w),
            splashBorderRadius: BorderRadius.circular(50.r),
            splashFactory: NoSplash.splashFactory,
            indicator: BoxDecoration(
              color: style.tabSelectedBgColor,
              borderRadius: BorderRadius.circular(50.r),
            ),
            labelStyle: style.tabSelectedTextStyle,
            tabs: [
              Tab(text: LocaleKeys.deliveryType.tr),
              Tab(text: LocaleKeys.tip.tr),
              Tab(text: LocaleKeys.instruction.tr),
            ],
          ),
        ),
        SizedBox(
          height: 180.h,
          child: TabBarView(
            controller: controller.tabController,
            children: tabBarViewWidgets ??
                [
                  _buildDeliveryOptions(style),
                  _buildTipOptions(style),
                  _buildInstruction(style)
                ],
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryOptions(CheckoutStyle style) {
    return SmartColumn(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 12.h),
        _buildDeliveryTile(
          title: LocaleKeys.expressDelivery.tr,
          subtitle: LocaleKeys.expressDeliveryDesc.tr,
          timeRange: '10–15 min',
          value: 0,
          style: style,
        ),
        SizedBox(height: 12.h),
        _buildDeliveryTile(
          title: LocaleKeys.regularDelivery.tr,
          subtitle: LocaleKeys.regularDeliveryDesc.tr,
          timeRange: '30–40 min',
          value: 1,
          style: style,
        ),
      ],
    );
  }

  Widget _buildTipOptions(CheckoutStyle style) {
    final selectedTip = controller.selectedTip;

    return SmartColumn(
      mainAxisSize: MainAxisSize.min,
      children: [
        SmartRow(
          children: [
            SmartText(
             LocaleKeys.tipYourDeliveryPartner.tr,
              isExpanded: true,
              style: style.tabDisableTextStyle,
            ),
            SmartImage(
              path: AppImages.tipLottie,
              height: 80.h,
              width: 120.w,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
        Spacer(),
        Obx(() => Wrap(
          spacing: 8.w,
          crossAxisAlignment: WrapCrossAlignment.start,
          alignment: WrapAlignment.start,
          children: controller.tipOptions.map((tip) {
            final bool isSelected = (selectedTip.value == tip);
            return GestureDetector(
              onTap: () => controller.changeTip(tip),
              child: Container(
                height: 35.h,
                width: 70.w,
                decoration: isSelected ? style.tipSelectedDecoration:style.tipUnSelectedDecoration,
                child: SmartColumn(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: SmartText(
                          tip.toCurrencyCodeFormat(),
                          style: isSelected ? style.tipSelectedStyle:style.tipUnSelectedStyle,
                        ),
                      ),
                    ),
                    if(tip==20)Container(
                      height: 15.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.r),bottomRight: Radius.circular(12.r)),
                        color: style.redColor
                      ),
                      child: Center(child: SmartText("Most Tipped",style: style.mostTippedStyle,)),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        )),
      ],
    );
  }

  Widget _buildInstruction(CheckoutStyle style) {

    return SmartColumn(
      mainAxisSize: MainAxisSize.min,
      children: [
        SmartRow(

          children: [
            SmartText(
              LocaleKeys.addInstructionForRestaurant.tr,
              isExpanded: true,
              style: style.tabDisableTextStyle,
            ),
            SmartImage(
              path: AppImages.notesLottie,
              height: 80.h,
              width: 120.w,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
        Spacer(),
        SmartTextField(
          hintText: LocaleKeys.instructionExample.tr,
          hintStyle: style.subCardTitleStyle,
          color: style.tabDisableBgColor,
          maxLines: 2,
        )
      ],
    );
  }



  Widget _buildDeliveryTile({
    required String title,
    required String subtitle,
    required String timeRange,
    required int value,
    required CheckoutStyle style,
  }) {
    return SmartRow(
      crossAxisAlignment: CrossAxisAlignment.start,
      onTap: () {
        controller.changeDelivery(value);
      },
      children: [
        SizedBox(
          height: 24.w,
          width: 24.w,
          child: Obx(() => Radio(
            value: value,
            groupValue: controller.selectedDelivery.value,
            onChanged: (val) {
              controller.changeDelivery(value);
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: style.primaryColor,
          )),
        ),
        SizedBox(width: 8.w),
        SmartColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          expanded: true,
          children: [
            SizedBox(height: 2.h),
            SmartText(title, style: style.titleStyle),
            SizedBox(height: 4.h),
            SmartText(subtitle, style: style.subTitleStyle),
          ],
        ),
        SmartText(timeRange, style: style.titleStyle),
      ],
    );
  }
}
