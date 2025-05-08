import 'package:taza/taza.dart';

class SearchPage extends GetView<SearchPageController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).foodDetailsPageStyle;
    final searchBarStyle = AppTheme.of(context).searchBarStyle;
    final loginStyle = AppTheme.of(context).loginPageStyle;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: style.whiteColor,
        body: SafeArea(
          child: Stack(
            children: [
              SmartColumn(
                children: [
                  GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Obx(() {
                      return SmartSearchBar(
                        margin: EdgeInsetsDirectional.symmetric(horizontal: 14.w),
                        items: [controller.hints[controller.currentHintIndex.value]],
                        controller: controller.searchController.value,
                        onChanged: (val) {},
                        autoFocus: true,
                        isSearchWithPrefix: false,
                        isEnabled: true,
                        prefixIcon: InkWell(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_back_ios_new, color: searchBarStyle.searchBarBorderColor,size: 20.w,),
                        ),
                        suffixIcon: SmartRow(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 21.h,
                              width: 1.w,
                              margin: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
                              color: searchBarStyle.searchBarBorderColor,
                            ),
                            SmartImage(
                                onTap: (){
                                  controller.openMic();
                                  showMicListeningSheet(context, loginStyle);
                                },
                                path: AppImages.icMic,
                                width: 24.w, height: 24.h
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 16.h,),
                  Expanded(
                    child: SmartSingleChildScrollView(
                      child: Obx((){
                        return SmartColumn(
                          padding: EdgeInsetsDirectional.only(
                            bottom: Get.find<DashboardController>().showInstamartBottomCart?120.h:0,
                          ),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...controller.searchCategories.map((category) {
                              return SmartColumn(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SmartRow(
                                    children: [
                                      SmartText(
                                        category.title.toUpperCase() ?? '',
                                        isExpanded: true,
                                        optionalPadding: EdgeInsetsDirectional.all(14.w),
                                        style: style.titleTextStyle.copyWith(fontSize: 14.sp),
                                        animator: SmartAnimator(
                                          animateFade: true,
                                          animateSlideX: true,
                                          animationDuration: 300.ms,
                                          animationDelay: 600.ms,
                                          animationCurve: Curves.decelerate,
                                        ),
                                      ),
                                      SmartText(
                                        "See All",
                                        style: style.showMoreLessTextStyle,
                                        animator: SmartAnimator(
                                          animateFade: true,
                                          animateSlideX: true,
                                          animationDuration: 300.ms,
                                          animationDelay: 600.ms,
                                          animationCurve: Curves.decelerate,
                                        ),
                                      ),
                                      SizedBox(width: 2.w),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(end: 8.0),
                                        child: Icon(Icons.arrow_forward_sharp, size: 20.w, color: style.iconColors),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: (category.foodTabData?.isNotEmpty ?? false) ? 130.h : 320.h,
                                    child: Builder(
                                      builder: (context) {
                                        if (category.products?.isNotEmpty ?? false) {
                                          return ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: category.products!.length,
                                            padding: EdgeInsetsDirectional.only(start: 12.w, end: 12.w),
                                            itemBuilder: (context, index) {
                                              final product = category.products![index];
                                              return Padding(
                                                padding: EdgeInsetsDirectional.only(end: 12.w),
                                                child: ProductCard(
                                                  imageWidth: 120.w,
                                                  product: product,
                                                  index: index,
                                                  hasDiscount: true,
                                                  discountPercent: "\$10",
                                                  onAddTap: () => controller.addToCart(context, product),
                                                  onProductTap: () {},
                                                ),
                                              );
                                            },
                                          );
                                        } else if (category.foodTabData?.isNotEmpty ?? false) {
                                          // Show food tab data
                                          return ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: category.foodTabData!.length,
                                            padding: EdgeInsetsDirectional.only(start: 12.w, end: 12.w),
                                            itemBuilder: (context, index) {
                                              final tab = category.foodTabData![index];
                                              return Padding(
                                                padding: EdgeInsetsDirectional.only(end: 12.w),
                                                child: SmartColumn(
                                                  children: [
                                                    Container(
                                                      height: 100.h,
                                                      width: 100.w,
                                                      decoration: BoxDecoration(
                                                        color: tab.themeColor.withOpacity(0.1),
                                                        borderRadius: BorderRadius.circular(16),
                                                      ),
                                                      child: Center(
                                                        child: SmartImage(path: tab.imagePath, width: 60.w, height: 60.h),
                                                      ),
                                                    ),
                                                    SizedBox(height: 8.h),
                                                    SmartText(tab.tabText!),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          // Nothing to show
                                          return Center(child: Text('No data available'));
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ],
                        );
                      }),
                    ),
                  ),

                ],
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                bottom: 0.h,
                end: 0.w,
                start: 0.w,
                child: InstamartBottomCartWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showMicListeningSheet(BuildContext context, LoginPageStyle loginStyle) {
    Utils.showSmartModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        controller.closeMic();
        return SmartColumn(
          width: Get.width,
          height: 280.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmartImage(
              path: AppImages.imgAnimatedMic,
              size: 110.w,
            ),
            Obx((){
              return SmartText(controller.spokenText.value,style: loginStyle.tagTextStyle,);
            })
          ],
        );
      },
    );
  }

}
