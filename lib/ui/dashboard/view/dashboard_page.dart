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
          Positioned.directional(
              textDirection: TextDirection.ltr,
              bottom: 0.h, end: 0.w, start: 0.w, child: BottomCartWidget()),
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

class BottomCartWidget extends StatelessWidget {
  BottomCartWidget({super.key});

  final ValueNotifier<bool> showMenu = ValueNotifier(false);
  final list = [
    "https://i.ibb.co/whRS5nY7/b.jpg",
    'https://i.ibb.co/XfpHPXFP/cake.jpg',
    'https://i.ibb.co/HLmQQsjy/chinease.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).bottomCartStyle;
    return ValueListenableBuilder<bool>(
      valueListenable: showMenu,
      builder: (context, value, child) {
        return SmartColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!value) _buildHeader(style),
            if (value) _buildProducts(style),
            _buildItemWidget(style),
          ],
        );
      },
    );
  }

  Widget _buildHeader(BottomCartStyle style) {
    return SizedBox(
      height: 90.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 50.h,
            width: double.infinity,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
            decoration: style.defaultDecoration,
            child: SmartColumn(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmartText(
                  "Hooray! FREE DELIVERY unlocked!",
                  style: style.titleStyle,
                ),
                SizedBox(height: 10.h),
                Divider(),
              ],
            ),
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

  Widget _buildProducts(BottomCartStyle style) {
    return SmartAnimator(
      animateSlideY: true,
      slideYBegin: const Offset(0, 2),
      slideEnd: Offset.zero,
      animationDelay: 10.ms,
      animationDuration: 200.ms,
      animationCurve: Curves.easeInOutCubic,
      child: Container(
        height: 250.h,
        width: Get.width,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        decoration: style.reviewDecoration,
        child: SmartColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmartRow(
              children: [
                SmartText("Review Items", isExpanded: true,style: style.reviewTitleStyle,),
                SmartImage(path: AppImages.icClose,onTap: () => showMenu.value = !showMenu.value,),

              ],
            ),
            SizedBox(height: 10.h,),
            Expanded(
              child: Container(
                padding: EdgeInsetsDirectional.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: 5,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder:
                      (context, index) => SmartRow(
                        spacing: 10.w,
                        padding: EdgeInsetsDirectional.only(bottom: 10.h),
                        children: [
                          SmartImage(

                            size: 40.w,
                            path: list.first,
                            imageBorderRadius: BorderRadius.circular(6.r),
                            clipBehavior: Clip.antiAlias,
                          ),
                          SmartColumn(
                            expanded: true,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SmartText("Burger loaded with cheese",style: style.itemNameStyle,),
                              SmartText(180.toCurrencyCodeFormat(),style: style.itemAmountStyle,),
                            ],
                          ),
                          SmartAnimatedQuantity(
                            index: 19,
                            onIncrease:
                                () => Get.find<QuantityController>().increment(19),
                            onDecrease:
                                () => Get.find<QuantityController>().decrement(19),
                            model: FoodModel(
                              name: 'Family Bucket',
                              imageUrl: 'https://i.ibb.co/whRS5nY7/b.jpg',
                              rating: 4.2,
                              reviewsCount: 1200,
                              deliveryTime: '30-35 min',
                              price: 89.0,
                              quantity: 1,
                            ),
                          ),
                        ],
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildItemWidget(BottomCartStyle style) {
    return SmartRow(
      color: style.whiteColor,
      padding: EdgeInsetsDirectional.only(bottom: 10.h, top: 10.h),
      margin: EdgeInsetsDirectional.only(start: 10.h, end: 10.h),
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
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 1),
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
        SmartColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SmartText('4 Items', style: style.itemNameStyle),
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
            SmartText('You save ₹10', style: style.itemAmountStyle),
          ],
        ),
      ],
    );
  }
}
