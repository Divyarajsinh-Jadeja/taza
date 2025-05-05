import 'package:taza/taza.dart';

class FoodPage extends GetView<FoodController> {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset : false, extendBodyBehindAppBar: true, body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    final style = AppTheme.of(context).foodCardStyle;
    final foodPageStyle = AppTheme.of(context).foodPageStyle;

    return Obx(() => AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              controller.currentFoodTabData.themeColor.withValues(alpha: 0.001),
              controller.currentFoodTabData.themeColor.withValues(alpha: 0.1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
        )),
      child: CustomScrollView(
        controller: controller.scrollController,
        physics: const ClampingScrollPhysics(),
        slivers: [
          _buildAppBarSliver(foodPageStyle, context),
          ..._buildTopHeaderSlivers(context, foodPageStyle),
          //_buildAppBarSliver(foodPageStyle, context),
          //_buildAddressHeaderSliver(),
          //const PinnedHeaderSliver(child: FoodHeaderSliver()),
          ..._buildContentSlivers(style, foodPageStyle),
        ],
      ),
    ));
    /*);*/
  }

  List<Widget> _buildTopHeaderSlivers(BuildContext context, FoodPageStyle foodPageStyle) {
    return [
      SliverToBoxAdapter(
        child: Obx(() => SmartColumn(
        color: controller.currentFoodTabData.themeColor,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              child: HomeAddressHeader(
                addressTypeTag: LocaleKeys.home.tr,
                address: "1600 Amphitheatre, Mountain View",
                userImagePath: "https://i.ibb.co/HLgDnFFQ/Group.png",
                textColor: Utils.getContrastColor(controller.currentFoodTabData.themeColor),
                homeIconColor: Utils.getContrastColor(controller.currentFoodTabData.themeColor),
              ),
            ),
          ],
        )),
      ),
      // Now separate pinned header for FoodHeaderSliver
      PinnedHeaderSliver(
        child: Obx(() => ColoredBox(
          color: controller.currentFoodTabData.themeColor,
          child: const FoodHeaderSliver(),
        )),
      ),
    ];
  }


  Widget _buildAppBarSliver(FoodPageStyle foodPageStyle, BuildContext context) {
    return PinnedHeaderSliver(
      child: Obx(
            () => ColoredBox(
          color: foodPageStyle.whiteColor,
          child: Container(
            color: controller.currentFoodTabData.themeColor.withValues(alpha: 0.8),
            height: MediaQuery.of(context).padding.top,
          ),
        ),
      ),
    );
  }

  Widget _buildAddressHeaderSliver() {
    return _animatedBoxAdapter(
      child: Obx(
            () => HomeAddressHeader(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 6),
              addressTypeTag: LocaleKeys.home.tr,
              address: "1600 Amphitheatre, Mountain View",
              userImagePath: "https://i.ibb.co/HLgDnFFQ/Group.png",
              textColor: Utils.getContrastColor(controller.currentFoodTabData.themeColor),
              homeIconColor: Utils.getContrastColor(controller.currentFoodTabData.themeColor),
              //homeIconColor: controller.currentFoodTabData.themeColor,
            ),
      ),
    );
  }

  List<Widget> _buildContentSlivers(FoodCardStyle style, FoodPageStyle foodPageStyle) {
    return [
      _animatedBoxAdapter(child: Obx(() => controller.currentFoodTabData.bannerWidget)),
      _animatedBoxAdapter(child: SizedBox(height: 16.h)),
      _buildCategoriesSliver(style, foodPageStyle),
      _animatedBoxAdapter(child: SizedBox(height: 20.h)),
      _buildPopularBrands(style, foodPageStyle),
      _animatedBoxAdapter(child: SizedBox(height: 16.h)),
      /*_animatedBoxAdapter(child: _buildCarousel()),
      _animatedBoxAdapter(child: SizedBox(height: 8.h)),*/
      _buildPromoBannerSliver(),
      ..._buildExploreRestroSection(foodPageStyle),
      ..._buildReorderSection(foodPageStyle),
      ..._buildCravingSection(foodPageStyle),
      ..._buildFlavorSection(foodPageStyle),
    ];
  }

  Widget _buildCategoriesSliver(FoodCardStyle style, FoodPageStyle foodPageStyle) {
    return _animatedBoxAdapter(
      child: SizedBox(
        height: 120.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoriesOfferZone.length,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          separatorBuilder: (_, __) => SizedBox(width: 8.w),
          itemBuilder: (context, index) => _buildCategoryCard(context, style, controller.categoriesOfferZone[index], foodPageStyle),
        ),
      ),
    );
  }

  Widget _buildPromoBannerSliver() {
    return _animatedBoxAdapter(
      child: SmartImage(
        onTap: ()=> Get.toNamed(AppRoutes.categoryPage),
        path: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3",
        width: 352.w,
        height: 200.h,
        fit: BoxFit.fill,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        imageBorderRadius: BorderRadius.circular(16.r),
        clipBehavior: Clip.antiAlias,
      ),
    );
  }

  List<Widget> _buildReorderSection(FoodPageStyle foodPageStyle) {
    return [
      _animatedBoxAdapter(child: SizedBox(height: 32.h)),
      _buildSectionHeader("Loved it? Reorder Now!", foodPageStyle, showArrow: false),
      _animatedBoxAdapter(child: SizedBox(height: 16.h)),
      _animatedBoxAdapter(child: _buildFoodList(controller.foodItemList)),
    ];
  }

  List<Widget> _buildCravingSection(FoodPageStyle foodPageStyle) {
    return [
      _animatedBoxAdapter(child: SizedBox(height: 32.h)),
      _buildSectionHeader("Craving Something Special?", foodPageStyle),
      _animatedBoxAdapter(child: SizedBox(height: 16.h)),
      _buildCravingTabsSliver(),
    ];
  }

  List<Widget> _buildFlavorSection(FoodPageStyle foodPageStyle) {
    return [
      _animatedBoxAdapter(child: SizedBox(height: 32.h)),
      _buildSectionHeader("Ahmed, Pick Your Flavor", foodPageStyle),
      _animatedBoxAdapter(child: SizedBox(height: 16.h)),
      _animatedBoxAdapter(child: CategoryFilterBar()),
      _animatedBoxAdapter(child: SizedBox(height: 16.h)),
      _animatedBoxAdapter(child: _buildFoodList(controller.flavorItemList)),
      _animatedBoxAdapter(child: SizedBox(height: 120.h)),
    ];
  }

  Widget _buildSectionHeader(String title, FoodPageStyle foodPageStyle, {bool showArrow = true}) {
    return _animatedBoxAdapter(
      child: SmartRow(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SmartText(title, style: foodPageStyle.headerTextStyle, isFlexible: true),
          if (showArrow) SmartImage(path: AppImages.icArrowRight),
        ],
      ),
    );
  }

  Widget _buildExploreSectionHeader(String title, FoodPageStyle foodPageStyle, {bool showArrow = true}) {
    return _animatedBoxAdapter(
      child: SmartRow(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SmartText(title, style: foodPageStyle.headerTextStyle, isFlexible: true),
          if (showArrow) SmartImage(path: AppImages.icArrowRight),
        ],
      ),
    );
  }

  Widget _buildCravingTabsSliver() {
    return _animatedBoxAdapter(
      child: SmartTabBar(
        length: controller.cravingTabs.length,
        isExpanded: false,
        isScrollable: true,
        physics: const ScrollPhysics(),
        tabAlignment: TabAlignment.start,
        onTabInitialized: (tabController) {
          controller.cravingTabController = tabController;
        },
        onTapTab: (_) {},
        tabs: controller.cravingTabs,
        padding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.label,
        tabBarView: List.generate(controller.cravingTabs.length, (_) => _buildCravingTabContent()),
      ),
    );
  }

  Widget _buildCravingTabContent() {
    return SmartColumn(
      children: [
        SizedBox(height: 16.h),
        _buildFoodList(controller.menuItems),
        SizedBox(height: 16.h),
        _buildFoodList(controller.menuItems2),
      ],
    );
  }

  Widget _buildCategoryCard(BuildContext context, FoodCardStyle style, Map<String, String> category, FoodPageStyle foodPageStyle) {
    return SmartColumn(
      onTap: () {
        // Get.toNamed(AppRoutes.foodDetailsPage);
        Get.toNamed(AppRoutes.categoryPage);
      },
      width: 88.w,
      decoration: BoxDecoration(border: Border.all(color: foodPageStyle.borderColor), borderRadius: BorderRadius.circular(12.r)),
      clipBehavior: Clip.antiAlias,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SmartText(
          category['title'],
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          optionalPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
          style: foodPageStyle.categoryTitleTextStyle,
        ),
        const Spacer(),
        SmartImage(path: category['image'] ?? "", height: 50.h, width: Get.width, fit: BoxFit.cover),
      ],
    );
  }


  /*Widget _buildCarousel() {
    return CarouselSlider.builder(
      itemCount: controller.foodBannerList.length,
      itemBuilder: (context, index, _) {
        return SmartImage(path: controller.foodBannerList[index], width: 352.w, height: 128.h, fit: BoxFit.contain);
      },
      carouselController: controller.sliderController,
      options: CarouselOptions(
        viewportFraction: 1,
        aspectRatio: 2.7,
        onPageChanged: (index, _) => controller.sliderController.animateToPage(index),
      ),
    );
  }*/

  Widget _buildFoodList(List<FoodItemModel> items) {
    return SizedBox(
      height: 115.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (_, index) {
          final item = items[index];
          return FoodItemCard(item: item, onTapAdd: () => debugPrint('Item added: ${item.title}'));
        },
      ),
    );
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
          return RestaurantItemCard(item: item, onTap: () => Get.toNamed(AppRoutes.exploreBrandPage, arguments: item));
        },
      ),
    );
  }

  Widget _animatedBoxAdapter({required Widget child}) {
    return SliverToBoxAdapter(
      child: AnimationLimiter(
        child: AnimationConfiguration.synchronized(
          duration: const Duration(milliseconds: 375), // Reduced animation time
          child: SlideAnimation(
            verticalOffset: 20.0, // Reduced slide distance for faster perception
            child: FadeInAnimation(child: child),
          ),
        ),
      ),
    );
  }

  Widget _buildPopularBrands(FoodCardStyle style, FoodPageStyle foodPageStyle) {
    return _animatedBoxAdapter(
      child: SmartColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmartRow(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
              children: [
                SmartText("Popular Brands", style: style.titleStyle,),
          ]),
          SizedBox(height: 10.h,),
          SizedBox(
            height: 80.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: demoRestaurantList.length,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              separatorBuilder: (_, __) => SizedBox(width: 20.w),
              itemBuilder: (context, index) => SmartImage(
                  path: demoRestaurantList[index].logo??"",
                  size: 90.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle
                  ),
                  clipBehavior: Clip.antiAlias,
              ),
            ),
          ),
        ],
      ),
    );
  }


  List<Widget> _buildExploreRestroSection(FoodPageStyle foodPageStyle) {
    return [
      _animatedBoxAdapter(child: SizedBox(height: 32.h)),
      _buildExploreSectionHeader("Top 7 Brands to explore", foodPageStyle, showArrow: false),
      _animatedBoxAdapter(child: SizedBox(height: 16.h)),
      _animatedBoxAdapter(child: _buildRestaurantsList(demoRestaurantList)),
    ];
  }
}

