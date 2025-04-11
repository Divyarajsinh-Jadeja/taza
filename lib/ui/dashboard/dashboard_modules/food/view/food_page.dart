import 'package:taza/taza.dart';

class FoodPage extends GetView<FoodController> {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).foodCardStyle;
    final foodPageStyle = AppTheme.of(context).foodPageStyle;

    return Scaffold(
      body: CustomScrollView(
        controller: controller.scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          _animatedBoxAdapter(child: SizedBox(height: 24.h)),
          _animatedBoxAdapter(child: const FoodScreenTabsView()),
          _animatedBoxAdapter(child: SizedBox(height: 24.h)),

          /// Categories
          _animatedBoxAdapter(
            child: SizedBox(
              height: 130.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categoriesOfferZone.length,
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                separatorBuilder: (_, __) => SizedBox(width: 8.w),
                itemBuilder: (context, index) {
                  final category = controller.categoriesOfferZone[index];
                  return _buildCategoryCard(context, style, category, foodPageStyle);
                },
              ),
            ),
          ),

          _animatedBoxAdapter(child: SizedBox(height: 16.h)),
          _animatedBoxAdapter(child: _buildCarousel(controller)),

          _animatedBoxAdapter(child: SizedBox(height: 12.h)),
          _animatedBoxAdapter(
            child: SmartImage(
              path: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3",
              width: 352.w,
              height: 200.h,
              fit: BoxFit.fill,
              margin: EdgeInsets.symmetric(horizontal: 19.w),
              imageBorderRadius: BorderRadius.circular(16.r),
              clipBehavior: Clip.antiAlias,
            ),
          ),

          _animatedBoxAdapter(child: SizedBox(height: 32.h)),
          _animatedBoxAdapter(
            child: SmartRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              children: [SmartText("Loved it? Reorder Now!", style: foodPageStyle.headerTextStyle, isFlexible: true)],
            ),
          ),
          _animatedBoxAdapter(child: SizedBox(height: 16.h)),
          _animatedBoxAdapter(child: _buildFoodList(controller.foodItemList)),

          _animatedBoxAdapter(child: SizedBox(height: 32.h)),
          _animatedBoxAdapter(
            child: SmartRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              children: [
                SmartText("Craving Something Special?", style: foodPageStyle.headerTextStyle, isFlexible: true),
                SmartImage(path: AppImages.icArrowRight),
              ],
            ),
          ),

          _animatedBoxAdapter(child: SizedBox(height: 16.h)),
          _animatedBoxAdapter(
            child: SmartTabBar(
              padding: EdgeInsets.only(left: 19.w),
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
              indicatorSize: TabBarIndicatorSize.tab,
              tabBarView: List.generate(
                controller.cravingTabs.length,
                (_) => Column(
                  children: [
                    SizedBox(height: 16.h),
                    _buildFoodList(controller.menuItems),
                    SizedBox(height: 16.h),
                    _buildFoodList(controller.menuItems2),
                  ],
                ),
              ),
            ),
          ),

          _animatedBoxAdapter(child: SizedBox(height: 32.h)),
          _animatedBoxAdapter(
            child: SmartRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              children: [
                SmartText("Ahmed, Pick Your Flavor", style: foodPageStyle.headerTextStyle, isFlexible: true),
                SmartImage(path: AppImages.icArrowRight),
              ],
            ),
          ),

          _animatedBoxAdapter(child: SizedBox(height: 16.h)),
          _animatedBoxAdapter(child: CategoryFilterBar()),

          _animatedBoxAdapter(child: SizedBox(height: 16.h)),
          _animatedBoxAdapter(child: _buildFoodList(controller.flavorItemList)),
          _animatedBoxAdapter(child: SizedBox(height: 64.h)),
        ],
      ),
    );
  }

  Widget _animatedBoxAdapter({required Widget child}) {
    return SliverToBoxAdapter(
      child: AnimationLimiter(
        child: AnimationConfiguration.synchronized(
          duration: const Duration(milliseconds: 500),
          child: SlideAnimation(verticalOffset: 30.0, child: FadeInAnimation(child: child)),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, FoodCardStyle style, Map<String, String> category, FoodPageStyle foodPageStyle) {
    return Container(
      height: 120.h,
      width: 88.w,
      decoration: BoxDecoration(border: Border.all(color: foodPageStyle.borderColor), borderRadius: BorderRadius.circular(12.r)),
      child: Column(
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
          SmartImage(
            path: category['image'] ?? "",
            height: 60.h,
            width: double.infinity,
            imageBorderRadius: BorderRadius.circular(12.r),
            clipBehavior: Clip.hardEdge,
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel(FoodController controller) {
    return CarouselSlider.builder(
      itemCount: controller.foodBannerList.length,
      itemBuilder: (context, index, _) {
        return SmartImage(path: controller.foodBannerList[index], width: 352.w, height: 128.h, fit: BoxFit.contain);
      },
      carouselController: controller.sliderController,
      options: CarouselOptions(
        viewportFraction: 1,
        aspectRatio: 2.7,
        onPageChanged: (index, reason) => controller.sliderController.animateToPage(index),
      ),
    );
  }

  Widget _buildFoodList(List<FoodItemModel> items) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          return FoodItemCard(item: items[index], onTapAdd: () => debugPrint('Item added: ${items[index].title}'));
        },
      ),
    );
  }
}

