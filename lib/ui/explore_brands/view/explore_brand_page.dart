import 'package:taza/taza.dart';

class ExploreBrandPage extends GetView<ExploreBrandController> {
  const ExploreBrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).groceryStyle;
    var loginStyle = AppTheme.of(context).loginPageStyle;
    final foodItemStyle = AppTheme.of(context).foodItemCardStyle;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: SmartAppBar(
          isBack: true,
          actions: [
            SmartRow(
              spacing: 3.w,
              padding: EdgeInsetsDirectional.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: loginStyle.dividerColor
                )
              ),
                children: [
              Icon(Icons.group_add_outlined, size: 18.w,),

              SmartText("Group Order", style: style.subTitleStyle,)
            ]),
            Icon(Icons.more_vert, size: 24.w,),
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              SmartColumn(
                height: Get.height,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                    child: SmartColumn(
                      margin: EdgeInsetsDirectional.symmetric(vertical: 4.h),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      decoration: BoxDecoration(
                        color: loginStyle.loginPageBgColor,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: (const Color.fromRGBO(178, 189, 194, 0.25)).withValues(alpha: 0.4),
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(14.r), topLeft: Radius.circular(14.r)),
                              child: SmartImage(
                                path: controller.item.imageUrl ?? "",
                                height: 100.h,
                                width: Get.width,
                                fit: BoxFit.cover,
                                imageBorderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.r),
                                  topRight: Radius.circular(16.r),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8.h,
                              right: 8.w,
                              child: SmartRow(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.favorite_border, color: loginStyle.loginPageBgColor, size: 20.w),
                                  SizedBox(width: 8.w),
                                  Icon(Icons.more_vert, color: loginStyle.loginPageBgColor, size: 20.w),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0.h,
                              right: 0.w,
                              child: Container(
                                padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: loginStyle.dividerColor.withValues(alpha:0.7),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: SmartText(
                                  controller.item.deliveryTime,
                                  style: style.titleStyle.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SmartColumn(
                          padding: EdgeInsetsDirectional.all(12.w),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmartRow(
                              children: [
                                SmartText("🚀 Food in 15 min", style: foodItemStyle.ratingStyle),
                                SizedBox(width: 8.w),
                                SmartText("🏆 Best In Pizza", style: foodItemStyle.ratingStyle),
                              ],
                            ),
                            SizedBox(height: 6.h),
                            SmartText(
                              controller.item.title,
                              style: style.titleStyle.copyWith(fontSize: 16.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 6.h),
                            SmartRow(
                              children: [
                                Icon(Icons.star, size: 14.w, color: Colors.green),
                                SizedBox(width: 4.w),
                                SmartText("${controller.item.rating}", style: foodItemStyle.ratingStyle),
                                SizedBox(width: 4.w),
                                SmartText("(${controller.item.reviews})", style: foodItemStyle.ratingStyle),
                                SizedBox(width: 6.w),
                                SmartText("• ${controller.item.distance}", style: foodItemStyle.ratingStyle),
                              ],
                            ),

                            SizedBox(height: 4.h),
                            // Cuisines and price for two
                            SmartText(
                              "${controller.item.cuisines} • ₹${controller.item.priceForTwo} for two",
                              style: style.titleStyle.copyWith(fontSize: 14.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10.h),
                            // Bottom row

                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      start: 20.r,
                      top: 16.r,
                      bottom: 16.r,
                    ),
                    height: 32.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Obx(() {
                          return SmartSwitch(
                            value: controller.isVeg.value,
                            onToggle: controller.toggleVeg,
                            activeColor: Colors.green,
                            activeIcon: SmartImage(path: AppImages.icVeg),
                            inactiveIcon: SmartImage(path: AppImages.icVeg),
                          );
                        }),
                        8.horizontalSpace,
                        Obx(() {
                          return SmartSwitch(
                            value: controller.isNonVeg.value,
                            onToggle: controller.toggleNonVeg,
                            activeColor: Colors.red,
                            activeIcon: SmartImage(path: AppImages.icNonVeg),
                            inactiveIcon: SmartImage(path: AppImages.icNonVeg),
                          );
                        }),
                        8.horizontalSpace,
                        _buildChip(context: context, text: "10 Mins Delivery"),
                        8.horizontalSpace,
                        _buildChip(context: context, text: "Ratings 4.0+"),
                        8.horizontalSpace,
                        _buildChip(context: context, text: "Price 10-50"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.item.menu.length,
                      padding: EdgeInsetsDirectional.only(start: 20.w,end: 20.w,bottom: 110.h),
                      itemBuilder:
                          (context, index) =>
                          FoodCard(
                            onIncrease: () => Get.find<QuantityController>().increment(index),
                            onDecrease: () => Get.find<QuantityController>().decrement(index),
                            model: controller.item.menu[index],
                          ),

                    ),
                  ),
                  /// Todo: need to verify that do we have to keep below ui or not
                  /*Expanded(
                    child: Obx(() {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.foodList.length,
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                        itemBuilder:
                            (context, index) =>
                            ExploreBrandItemCard(
                              index: index,
                              onIncrease: () => Get.find<QuantityController>().increment(index),
                              onDecrease: () => Get.find<QuantityController>().decrement(index),
                              model: controller.foodList[index],
                            ),

                      );
                    }),
                  ),*/
                ],
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                bottom: 0.h,
                end: 0.w,
                start: 0.w,
                child: BottomCartWidget(),
              )
            ],
          )
        ),
      ),
    );
  }

  _buildChip({
    required BuildContext context,
    required String text,
    Function()? onTap,
  }) {
    var style = AppTheme
        .of(context)
        .smartChipStyle;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(120.r),
          border: Border.all(color: style.color),
        ),
        padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
        child: Center(
          child: SmartText(
              text,
              style: style.titleStyle
          ),
        ),
      ),
    );
  }


}
