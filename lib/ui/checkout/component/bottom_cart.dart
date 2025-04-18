import 'package:taza/taza.dart';
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
            if (value) _buildReviewItems(style),
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
            width: Get.width,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
            decoration: style.defaultDecoration,
            child: SmartColumn(
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

  Widget _buildReviewItems(BottomCartStyle style) {
    return SmartAnimator(
      animateSlideY: true,
      slideYBegin: const Offset(0, 2),
      slideEnd: Offset.zero,
      animationDelay: 10.ms,
      animationDuration: 200.ms,
      animationCurve: Curves.easeInOutCubic,
      child: Container(
        height: 350.h,
        width: Get.width,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        decoration: style.reviewDecoration,
        child: SmartColumn(
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
                  itemCount: 4,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder:
                      (context, index) => Stack(
                    children: [
                      SmartRow(
                        spacing: 10.w,
                        padding: EdgeInsetsDirectional.only(bottom: 10.h,top: 10.h),
                        children: [
                          SmartImage(
                            path: list.first,
                            size: 40.w,
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
                          if(index==1) SmartRow(
                            spacing: 4.w,
                            children: [
                              SmartText(LocaleKeys.outOfStock.tr,style: style.itemNameStyle,),
                              Icon(Icons.delete_forever,size: 20.w,)
                            ],
                          ),
                          if(index!=1)SmartAnimatedQuantity(
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

                      if (index == 1)
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: style.whiteColor.withValues(alpha: 0.6),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
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
                        expanded
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



}