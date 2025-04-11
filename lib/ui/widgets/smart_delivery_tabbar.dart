import 'package:taza/taza.dart';

class SmartDeliveryTabBar extends StatefulWidget {
  final Function(int) onDeliveryTypeChanged;
  final List<Widget>? tabBarViewWidgets;

  const SmartDeliveryTabBar({super.key, required this.onDeliveryTypeChanged, this.tabBarViewWidgets});

  @override
  State<SmartDeliveryTabBar> createState() => _SmartDeliveryTabBarState();
}

class _SmartDeliveryTabBarState extends State<SmartDeliveryTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedDelivery = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).checkoutStyle;
    return SmartColumn(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 40.h,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(50.r)),
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            dividerHeight: 0.0,
            unselectedLabelStyle: style.tabDisableTextStyle,
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: EdgeInsetsDirectional.symmetric(horizontal: 0.w),
            splashBorderRadius: BorderRadius.circular(50.r),
            splashFactory: NoSplash.splashFactory,
            indicator: BoxDecoration(color: style.tabSelectedBgColor, borderRadius: BorderRadius.circular(50.r)),
            labelStyle: style.tabSelectedTextStyle,
            tabs: [Tab(text: LocaleKeys.deliveryType.tr), Tab(text: LocaleKeys.tip.tr), Tab(text: LocaleKeys.instruction.tr)],
          ),
        ),
        SizedBox(
          height: 110.h,
          child: TabBarView(
            controller: _tabController,
            children:
                widget.tabBarViewWidgets ??
                [_buildDeliveryOptions(), Center(child: Text('Tip Content')), Center(child: Text('Instruction Content'))],
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryOptions() {
    return SmartColumn(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 12.h),
        _buildDeliveryTile(title: 'Express Delivery', subtitle: 'Get it faster with priority shipping!', timeRange: '10–15 min', value: 0),
        SizedBox(height: 12.h),
        _buildDeliveryTile(title: 'Regular Delivery', subtitle: 'Reliable delivery at a standard pace.', timeRange: '30–40 min', value: 1),
      ],
    );
  }

  Widget _buildDeliveryTile({required String title, required String subtitle, required String timeRange, required int value}) {
    final style = AppTheme.of(context).checkoutStyle;
    return SmartRow(
      crossAxisAlignment: CrossAxisAlignment.start,
      onTap: () {
        setState(() => _selectedDelivery = value);
        widget.onDeliveryTypeChanged(value);
      },
      children: [
        SizedBox(
          height: 24.w,
          width: 24.w,
          child: Theme(
            data: Theme.of(context).copyWith(
              visualDensity: VisualDensity.compact, // reduces vertical and horizontal padding
            ),
            child: Radio(
              value: value,
              groupValue: _selectedDelivery,
              onChanged: (val) {
                setState(() => _selectedDelivery = value);
                widget.onDeliveryTypeChanged(value);
              },
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: Colors.teal,
            ),
          ),
        ),
        SizedBox(width: 8.w,),
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
