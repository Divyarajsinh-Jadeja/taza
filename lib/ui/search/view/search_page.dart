import 'package:taza/taza.dart';

class SearchPage extends GetView<SearchPageController> {
  String? isFromWhere;
  SearchPage({this.isFromWhere, super.key});

  @override
  Widget build(BuildContext context) {
    isFromWhere = Get.arguments as String;
    final style = AppTheme.of(context).foodDetailsPageStyle;
    final searchBarStyle = AppTheme.of(context).searchBarStyle;
    final loginStyle = AppTheme.of(context).loginPageStyle;
    final foodCardStyle = AppTheme.of(context).foodCardStyle;
    final foodPageStyle = AppTheme.of(context).foodPageStyle;

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
                        onFieldSubmitted: (val){
                          controller.addSearchToHistory(val);
                        },
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
                                size: 24.w
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
                            if(isFromWhere == AppConst.isFromInstamart)...[
                              ...controller.searchCategories.map((category) {
                                return instaMartSection(style, category, searchBarStyle);
                              }),
                            ],
                            if(isFromWhere == AppConst.isFromHome)...[
                              buildPastSearchSection(foodPageStyle, loginStyle, searchBarStyle),
                              _buildPopularBrands(foodCardStyle, foodPageStyle),
                              // SmartText(
                              //   "Best Deals on Instamart",
                              //   style: foodPageStyle.headerTextStyle,
                              //   optionalPadding: EdgeInsetsDirectional.all(16.w),
                              // ),
                              /*SizedBox(
                                height: 140.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.searchCategories[2].foodTabData!.length,
                                  padding: EdgeInsetsDirectional.only(start: 12.w, end: 12.w),
                                  itemBuilder: (context, index) {
                                    final tab = controller.searchCategories[2].foodTabData![index];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.only(end: 12.w),
                                      child: SmartColumn(
                                        children: [
                                          Container(
                                            height: 100.w,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              color: tab.themeColor.withValues(alpha: 0.1),
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                            child: Center(
                                              child: SmartImage(path: tab.imagePath, width: 60.w, height: 60.w),
                                            ),
                                          ),
                                          SizedBox(height: 8.h),
                                          SmartText(tab.tabText!),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )*/

                            ],
                            if(isFromWhere == AppConst.isFromFood)...[
                              buildPastSearchSection(foodPageStyle, loginStyle, searchBarStyle),
                              _buildPopularBrands(foodCardStyle, foodPageStyle),
                              ..._buildExploreRestroSection(foodPageStyle),
                            ]
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

  Widget buildPastSearchSection(FoodPageStyle style, LoginPageStyle loginPageStyle, SearchBarStyle searchBarStyle) {
    return Obx(() {
      if (controller.pastSearches.isEmpty) return SizedBox.shrink();
      return SmartColumn(
        children: [
          SmartRow(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 6.h),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmartText("YOUR PAST SEARCHES", style: style.categoryTitleTextStyle),
              SmartText("Clear", onTap: controller.clearSearchHistory, style: style.categoryTitleTextStyle.copyWith(color: loginPageStyle.continueButtonBgColor)),
            ],
          ),
          SizedBox(
            height: 50.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.pastSearches.length,
              padding: EdgeInsetsDirectional.only(start: 12.w, end: 12.w, bottom: 8.w),
              itemBuilder: (context, index) {
                final product = controller.pastSearches[index];
                return Padding(
                    padding: EdgeInsetsDirectional.only(end: 12.w),
                    child: SmartRow(
                        spacing: 8.w,
                        padding: EdgeInsetsDirectional.symmetric(horizontal : 12.w, vertical: 4.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border.all(
                                color: searchBarStyle.searchBarBorderColor
                            )
                        ),
                        children: [
                          SmartImage(path: AppImages.icSearch, size: 20.w),
                          SmartText(product, style: searchBarStyle.searchBarTextStyle,),
                        ])
                );
              },
            ),
          )
        ],
      );
    });
  }

  Widget instaMartSection(FoodDetailsPageStyle style, SearchCategoryModel category, SearchBarStyle searchBarStyle) {
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
              onTap: (){
                if(category.title == 'Your Past Searches'){
                  controller.clearSearchHistory();
                }
                else{

                }
              },
              category.title == 'Your Past Searches'? "Clear" : "See all",
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
            if(category.title == 'Your Past Searches')...[
              SizedBox(width: 10.w),
            ],
            if(category.title != 'Your Past Searches')
              Padding(
                padding: EdgeInsetsDirectional.only(end: 8.0),
                child: Icon(Icons.arrow_forward_sharp, size: 20.w, color: style.iconColors),
              )
          ],
        ),
        Builder(
          builder: (context) {
            if (category.title == 'Your Past Searches' &&
                (category.pastSearches?.isEmpty ?? true)) {
              return SizedBox.shrink();
            }
            if(category.pastSearches?.isNotEmpty ?? false){
              return SizedBox(
                height: 50.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: category.pastSearches!.length,
                  padding: EdgeInsetsDirectional.only(start: 12.w, end: 12.w, bottom: 8.w),
                  itemBuilder: (context, index) {
                    final product = category.pastSearches![index];
                    return Padding(
                        padding: EdgeInsetsDirectional.only(end: 12.w),
                        child: SmartRow(
                            spacing: 8.w,
                            padding: EdgeInsetsDirectional.symmetric(horizontal : 12.w, vertical: 4.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                border: Border.all(
                                    color: searchBarStyle.searchBarBorderColor
                                )
                            ),
                            children: [
                              SmartImage(path: AppImages.icSearch, size: 20.w),
                              SmartText(product, style: searchBarStyle.searchBarTextStyle,),
                            ])
                    );
                  },
                ),
              );
            }
            if (category.products?.isNotEmpty ?? false) {
              return SizedBox(
                height: 320.h,
                child: ListView.builder(
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
                ),
              );
            } else if (category.foodTabData?.isNotEmpty ?? false) {
              return SizedBox(
                height: 140.h,
                child: ListView.builder(
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
                            height: 100.w,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: tab.themeColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: SmartImage(path: tab.imagePath, width: 60.w, height: 60.w),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          SmartText(tab.tabText!),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(child: Text('No data available'));
            }
          },
        ),
      ],
    );
  }

  Widget _buildPopularBrands(FoodCardStyle foodCardStyle, FoodPageStyle foodPageStyle) {
    return SmartColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartRow(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            children: [
              SmartText("Popular Brands", style: foodCardStyle.titleStyle,),
            ]),
        SizedBox(height: 10.h,),
        SizedBox(
          height: 80.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: demoRestaurantList.length,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            separatorBuilder: (_, __) => SizedBox(width: 20.w),
            itemBuilder: (context, index) =>
                SmartImage(
                  onTap: () => Get.toNamed(AppRoutes.exploreBrandPage,arguments: demoRestaurantList[index]),
                  path: demoRestaurantList[index].logo ?? "",
                  size: 90.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle
                  ),
                  clipBehavior: Clip.antiAlias,
                ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildExploreRestroSection(FoodPageStyle foodPageStyle) {
    return [
      SizedBox(height: 16.h),
      SmartText(

          "Top 7 Brands to explore",
          style: foodPageStyle.categoryTitleTextStyle,
        optionalPadding: EdgeInsetsDirectional.only(start: 16.w),
      ),
      SizedBox(height: 16.h),
      _buildRestaurantsList(demoRestaurantList),
    ];
  }

  Widget _buildRestaurantsList(List<RestaurantItemModel> items) {
    return SizedBox(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        separatorBuilder: (_, __) => SizedBox(height: 16.w),
        itemBuilder: (_, index) {
          final item = items[index];
          return RestaurantItemCard(item: item,
              onTap: () =>
                  Get.toNamed(AppRoutes.exploreBrandPage, arguments: item));
        },
      ),
    );
  }

}
