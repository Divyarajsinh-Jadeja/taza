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
          height: 110.h,
          child: TabBarView(
            controller: controller.tabController,
            children: tabBarViewWidgets ??
                [
                  _buildDeliveryOptions(style),
                  Center(child: Text('Tip Content')),
                  Center(child: Text('Instruction Content')),
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
          title: 'Express Delivery',
          subtitle: 'Get it faster with priority shipping!',
          timeRange: '10–15 min',
          value: 0,
          style: style,
        ),
        SizedBox(height: 12.h),
        _buildDeliveryTile(
          title: 'Regular Delivery',
          subtitle: 'Reliable delivery at a standard pace.',
          timeRange: '30–40 min',
          value: 1,
          style: style,
        ),
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
