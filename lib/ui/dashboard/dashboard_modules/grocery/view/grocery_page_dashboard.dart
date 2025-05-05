import 'package:taza/taza.dart';


class GroceryPageDashboard extends GetView<GroceryDashboardController> {
  const GroceryPageDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset : false, extendBodyBehindAppBar: true, body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    final style = AppTheme.of(context).foodCardStyle;
    final foodPageStyle = AppTheme.of(context).foodPageStyle;
    final groceryStyle = AppTheme.of(context).groceryStyle;


    return Obx(
          () => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              controller.currentFoodTabData.themeColor.withValues(alpha: 0.001),
              controller.currentFoodTabData.themeColor.withValues(alpha: 0.1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          controller: controller.scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            _buildAppBarSliver(foodPageStyle, context),
            _buildAddressHeaderSliver(),
            const PinnedHeaderSliver(child: GroceryHeaderSliver()),
            ..._buildContentSlivers(style, foodPageStyle, groceryStyle),
          ],
        ),
      ),
    );
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
            () => Container(
          color: controller.currentFoodTabData.themeColor.withValues(alpha: 0.4),
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 6),
          child: HomeAddressHeader(
            addressTypeTag: LocaleKeys.home.tr,
            address: "1600 Amphitheatre, Mountain View",
            userImagePath: "https://i.ibb.co/HLgDnFFQ/Group.png",
            textColor: Utils.getContrastColor(controller.currentFoodTabData.themeColor),
            homeIconColor: controller.currentFoodTabData.themeColor,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContentSlivers(FoodCardStyle style, FoodPageStyle foodPageStyle, GroceryStyle groceryStyle) {
    return [
      _animatedBoxAdapter(child: Obx(() => controller.currentFoodTabData.bannerWidget)),
      _animatedBoxAdapter(child: SizedBox(height: 16.h)),
      _buildCategoriesSliver(style, foodPageStyle),
      _animatedBoxAdapter(child: SizedBox(height: 16.h)),
      _animatedBoxAdapter(child: _buildCarousel()),
      _animatedBoxAdapter(child: SizedBox(height: 16.h)),
      _buildInstamartCategory(groceryStyle),
      // _animatedBoxAdapter(child: SizedBox(height: 8.h)),
      // _buildPromoBannerSliver(),
      ..._buildReorderSection(foodPageStyle),
      // ..._buildCravingSection(foodPageStyle),
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
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          separatorBuilder: (_, __) => SizedBox(width: 8.w),
          itemBuilder: (context, index) => _buildCategoryCard(context, style, controller.categoriesOfferZone[index], foodPageStyle),
        ),
      ),
    );
  }

  Widget _buildPromoBannerSliver() {
    return _animatedBoxAdapter(
      child: SmartImage(
        path: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3",
        width: 352.w,
        height: 200.h,
        fit: BoxFit.fill,
        margin: EdgeInsets.symmetric(horizontal: 19.w),
        imageBorderRadius: BorderRadius.circular(16.r),
        clipBehavior: Clip.antiAlias,
      ),
    );
  }

  List<Widget> _buildReorderSection(FoodPageStyle foodPageStyle) {
    return [
      _buildSectionHeader("It's Fresh? Reorder Now!", foodPageStyle, showArrow: false),
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
      _buildSectionHeader("Ahmed, Pick Your Vegetables", foodPageStyle),
      _animatedBoxAdapter(child: SizedBox(height: 16.h)),
      _animatedBoxAdapter(child: GroceryCategoryFilterBar()),
      _animatedBoxAdapter(child: SizedBox(height: 16.h)),
      _animatedBoxAdapter(child: _buildFoodList(controller.flavorItemList)),
      _animatedBoxAdapter(child: SizedBox(height: 42.h)),
    ];
  }

  Widget _buildSectionHeader(String title, FoodPageStyle foodPageStyle, {bool showArrow = true}) {
    return _animatedBoxAdapter(
      child: SmartRow(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        padding: EdgeInsets.symmetric(horizontal: 19.w),
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
        Get.toNamed(AppRoutes.categoryPage, arguments: false);
      },
      width: 90.w,
      decoration: BoxDecoration(border: Border.all(color: foodPageStyle.borderColor), borderRadius: BorderRadius.circular(12.r)),
      clipBehavior: Clip.antiAlias,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SmartText(
          category['title'],
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          optionalPadding: EdgeInsets.symmetric(vertical: 12.h),
          style: foodPageStyle.categoryTitleTextStyle,
        ),
        const Spacer(),
        SmartImage(path: category['image'] ?? "", height: 66.h, width: double.infinity, fit: BoxFit.cover),
      ],
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider.builder(
      itemCount: controller.foodBannerList.length,
      itemBuilder: (context, index, _) {
        return Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SmartImage(path: controller.foodBannerList[index],
              width: Get.width, height: 140.h,),
          ),
        );
      },
      carouselController: controller.sliderController,
      options: CarouselOptions(
        viewportFraction: 1,
        aspectRatio: 2.7,
        onPageChanged: (index, _) => controller.sliderController.animateToPage(index),
      ),
    );
  }

  Widget _buildFoodList(List<FoodItemModel> items) {
    return SizedBox(
      height: 115.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (_, index) {
          final item = items[index];
          return FoodItemCard(item: item, onTapAdd: () => debugPrint('Item added: ${item.title}'));
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

  Widget _buildInstamartCategory(GroceryStyle groceryStyle) {
    return _animatedBoxAdapter(
      child: ListView.builder(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.groceryList.length,
        itemBuilder: (context, index) => SmartColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
          SmartRow(
            spacing: 6.w,
            children: [
              SmartText(
                  controller.groceryList[index].name!.toUpperCase() ,
                  style: groceryStyle.titleStyle
              ),
              Expanded(child: Container(height: 1.h, color: groceryStyle.groceryCardDecoration.color,))
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
            itemCount: controller.groceryList[index].subCategories!.length, // or controller.items.length
            itemBuilder: (context, gridIndex) {
              SubCategoriesModel subCategoriesModel = controller.groceryList[index].subCategories![gridIndex];
              return _buildInstamrtCategoryCard(subCategoriesModel,groceryStyle);
            },
          ),
        ]),),
    );
  }

  Widget _buildInstamrtCategoryCard(SubCategoriesModel model, GroceryStyle style) {
    return SmartColumn(
      children: [
        SmartImage(
          onTap: (){Get.toNamed(AppRoutes.categoryPage,arguments: true);},
          decoration: style.groceryCardDecoration.copyWith(color: controller.currentFoodTabData.themeColor.withValues(alpha: 0.4)),
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

