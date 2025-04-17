import 'package:taza/taza.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).tabBarStyle;

    BottomNavigationBarDataModel bottomNavData =
        controller.tabs[2].bottomNavData;
    return Scaffold(
      //extendBody: true,
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children:
                controller.tabs
                    .map((tab) => Builder(builder: tab.pageBuilder))
                    .toList(),
          ),
        //  Positioned(bottom: 0.h, left: 0.w, right: 0.w, child: CartWidget()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        backgroundColor: style.selectedIconColor,
        shape: const CircleBorder(),
        onPressed: () {
          Get.toNamed(AppRoutes.checkoutPage);
        },
        child: SmartImage(path: bottomNavData.icon),
      ),
      /*.animate(onPlay: (controller) => controller.repeat(reverse: true))
          .scale(
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          )*/
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(() {
        return CustomBottomBar(
          selectedIndex: controller.currentIndex.value,
          onItemSelected: (index) => controller.changeTab(index),
          items: controller.tabs.map((tab) => tab.bottomNavData).toList(),
        );
      }),
    );
  }
}

class CartWidget extends StatelessWidget {
  CartWidget({super.key});

  final ValueNotifier<bool> showMenu = ValueNotifier(false);
  final list = [
    "https://i.ibb.co/whRS5nY7/b.jpg",
    'https://i.ibb.co/XfpHPXFP/cake.jpg',
    'https://i.ibb.co/HLmQQsjy/chinease.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).tabBarStyle;
    return ValueListenableBuilder<bool>(
      valueListenable: showMenu,
      builder: (context, value, child) {
        return SmartColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!value) _buildHeader(style),
            if (!value) _buildProducts(style),
            _buildItemWidget(style),
          ],
        );
      },
    );
  }

  Widget _buildHeader(TabBarStyle style) {
    return SizedBox(
      height: 90.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 50.h,
            width: double.infinity,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: SmartColumn(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 50.w, top: 10.h),
                  child: SmartText(
                    "Hooray! FREE DELIVERY unlocked!",
                    style: style.labelStyle,
                  ),
                ),
                SizedBox(height: 15.h),
                Divider(),
              ],
            ),
          ),
          Positioned(
            top: 10.h,
            left: 20.w,
            child: CircleAvatar(
              backgroundColor: style.indicatorColor,
              radius: 25.r,
              child: SmartImage(path: AppImages.deliveryLottie),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProducts(TabBarStyle style) {
    return Container(
      height: 250.h,
      width: Get.width,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SmartColumn(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmartRow(
            children: [
              SmartText("Review Items",isExpanded: true,),
              IconButton(
                onPressed: () => showMenu.value = !showMenu.value,
                icon: Icon(Icons.close),
              ),
            ],
          ),
          SmartRow(
              spacing: 4.w,
              children: [
            SmartImage(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.withValues(alpha: 0.8),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6.r),
              ),
              size: 40.w,
              path: list.first,
              imageBorderRadius: BorderRadius.circular(6.r),
              clipBehavior: Clip.antiAlias,
            ),
          ])
        ],
      ),
    );
  }

  _buildItemWidget(style) {

    return SmartRow(
      color: Colors.white,
      padding: EdgeInsetsDirectional.only(bottom: 110.h,top: 10.h),
      mainAxisSize: MainAxisSize.min,
      width: Get.width,
      onTap: () {
        showMenu.value = !showMenu.value;
      },
      children: [
        Container(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
          width: 50.w,
          height: 35.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: List.generate(3, (index) {
              return Positioned(
                left: index * 10.w,
                child: Container(
                  width: 30.w,
                  height: 35.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: SmartImage(
                    path: list[index],
                    imageBorderRadius: BorderRadius.circular(6.r),
                    clipBehavior: Clip.antiAlias,
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(width: 30.w),
        SmartColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SmartText('4 Items', style: style.labelStyle),
                ValueListenableBuilder(
                  valueListenable: showMenu,
                  builder: (_, bool expanded, __) {
                    return Animate(
                      effects: [RotateEffect(duration: 300.ms)],
                      key: ValueKey(expanded),
                      child: Icon(
                        expanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.orange,
                        size: 20.w,
                      ),
                    );
                  },
                ),
              ],
            ),
            SmartText('You save ₹10', style: style.unselectedLabelStyle),
          ],
        ),
      ],
    );
  }
}
