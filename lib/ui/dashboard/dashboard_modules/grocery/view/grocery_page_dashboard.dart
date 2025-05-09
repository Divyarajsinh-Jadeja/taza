import 'package:taza/taza.dart';

class GroceryPageDashboard extends GetView<GroceryDashboardController> {
  const GroceryPageDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnnotatedRegion(
        value: Utils.getOverlayStyle(controller.currentFoodTabData.themeColor),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          body: _buildBody(context),
        ),
      );
    });
  }

  Widget _buildBody(BuildContext context) {
    final style = AppTheme.of(context).foodCardStyle;
    final foodPageStyle = AppTheme.of(context).foodPageStyle;
    final groceryStyle = AppTheme.of(context).groceryStyle;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: CustomScrollView(
        controller: controller.scrollController,
        physics: const ClampingScrollPhysics(),
        slivers: [
          _buildSafeArea(context),
          _buildAddressHeaderSliver(groceryStyle),
          const PinnedHeaderSliver(child: GroceryHeaderSliver()),
          ..._buildContentSlivers(style, foodPageStyle, groceryStyle),
        ],
      ),
    );
  }

  Widget _buildSafeArea(BuildContext context) {
    return PinnedHeaderSliver(
      child: Obx(
        () => Container(
          color: controller.currentFoodTabData.themeColor,
          height: MediaQuery.of(context).padding.top,
        ),
      ),
    );
  }

  Widget _buildAddressHeaderSliver(GroceryStyle groceryStyle) {
    return _animatedBoxAdapter(
      child: SmartRow(
        color: controller.currentFoodTabData.themeColor,
        height: 50.h,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
        children: [
          SmartColumn(
            expanded: true,
            mainAxisSize: MainAxisSize.min,
            children: [
              SmartText(
                "🚚 Earliest Home Delivery time slot available",
                style: groceryStyle.subTitleStyle.copyWith(
                  color: Utils.getContrastColor(
                    controller.currentFoodTabData.themeColor,
                  ),
                ),
              ),
              SmartText(
                "🗓️ Saturday ⏰ 07:00 AM - 10:00 PM",
                style: groceryStyle.subTitleStyle.copyWith(
                  color: Utils.getContrastColor(
                    controller.currentFoodTabData.themeColor,
                  ),
                ),
              ),
            ],
          ),

          SmartImage(
            path: "https://i.ibb.co/HLgDnFFQ/Group.png",
            width: 40.w,
            onTap: () => Get.toNamed(AppRoutes.profilePage),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildContentSlivers(
    FoodCardStyle style,
    FoodPageStyle foodPageStyle,
    GroceryStyle groceryStyle,
  ) {
    final List<InstamartProductModel> products= Get.find<CategoryController>().randomProducts;
    return [
      _animatedBoxAdapter(
        child: SmartColumn(
          children: [
            Container(
              width: Get.width,
              decoration: BoxDecoration(

                gradient: LinearGradient(
                  stops: [0.0, 0.5, 0.85, 1.0],
                  colors: [
                    controller.currentFoodTabData.themeColor.withValues(alpha: 0.8),
                    controller.currentFoodTabData.themeColor.withValues(alpha: 0.1),
                    style.whiteColor.withValues(alpha: 0.0), // middle fade
                    style.whiteColor, // soft white base
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  SmartImage(path: AppImages.lowest1,fit: BoxFit.contain,),
                  SizedBox(
                    height: 120.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categoriesOfferZone.length,
                      padding: EdgeInsets.symmetric(
                        horizontal: 19.w,
                        vertical: 10.h,
                      ),
                      separatorBuilder: (_, __) => SizedBox(width: 8.w),
                      itemBuilder:
                          (context, index) => _buildCategoryCard(
                        context,
                        style,
                        controller.categoriesOfferZone[index],
                        foodPageStyle,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  
                ],
              ),
            ),

          ],
        ),
      ),
      _animatedBoxAdapter(child: SizedBox(height: 16.h)),
      _animatedBoxAdapter(child: _buildCarousel()),
      _buildInstamartCategory(groceryStyle),
      _animatedBoxAdapter(child: SmartColumn(
        mainAxisSize: MainAxisSize.min,
        spacing: 10.h,
        margin: EdgeInsetsDirectional.symmetric(vertical: 10.h),
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmartText("Recommended Products",style: groceryStyle.titleStyle,),
          SizedBox(
            height: 380.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsetsDirectional.only( start: 12.w),
                  child: ProductCard(
                    seeMore: true,
                    imageWidth: 120.w,
                    product: products[index],
                    index: index,
                    hasDiscount: true,
                    discountPercent: "\$10",
                    onAddTap: () {
                      // Add product logic
                    },
                    onProductTap: () {
                      // Navigate to product detail
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ))
    ];
  }


  Widget _buildCategoryCard(
    BuildContext context,
    FoodCardStyle style,
    Map<String, String> category,
    FoodPageStyle foodPageStyle,
  ) {
    return SmartColumn(
      onTap: () {
        Get.toNamed(AppRoutes.categoryPage, arguments: true);
      },
      width: 90.w,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SmartImage(
          path: category['image'] ?? "",
          height: 90.h,
          width: double.infinity,
          fit: BoxFit.fitHeight,
        ),
      ],
    );
  }

  Widget _buildCarousel() {
    return Padding(
      padding:  EdgeInsetsDirectional.only(bottom: 20.h),
      child: CarouselSlider.builder(
        itemCount: controller.foodBannerList.length,
        itemBuilder: (context, index, _) {
          return Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: SmartImage(
                onTap: () => Get.toNamed(AppRoutes.categoryPage,arguments: true),
                path: controller.foodBannerList[index],
                width: Get.width,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        carouselController: controller.sliderController,
        options: CarouselOptions(
          viewportFraction: 1,
          aspectRatio: 2.1,
          autoPlay: true,
          onPageChanged:
              (index, _) => controller.sliderController.animateToPage(index),
        ),
      ),
    );
  }


  Widget _animatedBoxAdapter({required Widget child}) {
    return SliverToBoxAdapter(
      child: AnimationLimiter(
        child: AnimationConfiguration.synchronized(
          duration: const Duration(milliseconds: 375), // Reduced animation time
          child: SlideAnimation(
            verticalOffset: 20.0,
            // Reduced slide distance for faster perception
            child: FadeInAnimation(child: child),
          ),
        ),
      ),
    );
  }

  Widget _buildInstamartCategory(GroceryStyle groceryStyle) {
    return _animatedBoxAdapter(
      child: ListView.builder(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.groceryList.length,
        itemBuilder:
            (context, index) => SmartColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SmartRow(
                  spacing: 6.w,
                  children: [
                    SmartText(
                      controller.groceryList[index].name!.toUpperCase(),
                      style: groceryStyle.titleStyle,
                    ),
                    Expanded(
                      child: Container(
                        height: 1.h,
                        color: groceryStyle.groceryCardDecoration.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                GridView.builder(
                  padding: EdgeInsetsDirectional.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 20.h,
                    childAspectRatio: 0.55,
                  ),
                  itemCount:
                      controller.groceryList[index].subCategories!.length,
                  // or controller.items.length
                  itemBuilder: (context, gridIndex) {
                    SubCategoriesModel subCategoriesModel =
                        controller.groceryList[index].subCategories![gridIndex];
                    return _buildInstamrtCategoryCard(
                      subCategoriesModel,
                      groceryStyle,
                    );
                  },
                ),
              ],
            ),
      ),
    );
  }

  Widget _buildInstamrtCategoryCard(
    SubCategoriesModel model,
    GroceryStyle style,
  ) {
    return SmartColumn(
      children: [
        SmartImage(
          onTap: () {
            Get.toNamed(AppRoutes.categoryPage, arguments: true);
          },
          decoration: style.groceryCardDecoration.copyWith(
            color: controller.currentFoodTabData.themeColor.withValues(
              alpha: 0.4,
            ),
          ),
          path: model.categoryUrl!,
          height: 90.h,
          width: 120.w,
          fit: BoxFit.contain,
          imageBorderRadius: BorderRadius.circular(12.r),
        ),
        SizedBox(height: 10.h),
        SmartText(
          model.name,
          isExpanded: true,
          textAlign: TextAlign.center,
          style: style.subTitleStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          optionalPadding: EdgeInsetsDirectional.symmetric(horizontal: 4.h),
        ),
      ],
    );
  }
}
