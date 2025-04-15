import 'package:taza/taza.dart';

class FoodPage extends GetView<FoodController> {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).foodCardStyle;
    final foodPageStyle = AppTheme.of(context).foodPageStyle;

    return Obx(() {
      final FoodTabData tabData = controller.currentFoodTabData;
      return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          shrinkWrap: true,
          controller: controller.scrollController,
          physics: ClampingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(pinned: true, delegate: _StickyColorSpacerHeader(themeColor: tabData.themeColor, height: 62)),
            _animatedBoxAdapter(
              child: Container(
                color: tabData.themeColor.withValues(alpha: 0.4),
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 6),
                child: HomeAddressHeader(
                  onAddressTap: () {},
                  addressTypeTag: LocaleKeys.home.tr,
                  address: "Al Tadamun Al Arabi St., Mishfirah, Jeddah KSA",
                  textColor: Colors.black,
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickySearchAndTabsHeader(
                themeColor: tabData.themeColor.withValues(alpha: 0.4),
                tabController: controller.foodTabController,
                tabs: controller.tabs,
              ),
            ),

            _animatedBoxAdapter(child: tabData.bannerWidget),
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
            _animatedBoxAdapter(child: SizedBox(height: 42.h)),
          ],
        ),
      );
    });
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
            height: 50.h,
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
      height: 115.h,
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

class AnimatedTabBar extends GetView<FoodController> {
  final TabController tabController;
  final List<FoodTabData> tabs;
  final Function(int)? onTabChange;

  const AnimatedTabBar({super.key, required this.tabController, required this.tabs, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TabBar(
        tabAlignment: TabAlignment.start,
        controller: tabController,
        indicatorWeight: 0,
        dividerColor: Colors.transparent,
        isScrollable: true,
        indicatorColor: Colors.transparent,
        onTap: (index) {
          if (index != controller.selectedFoodTab.value) {
            onTabChange?.call(index);
          }
        },
        labelPadding: EdgeInsets.zero,
        indicator: BoxDecoration(color: Colors.transparent),
        tabs: List.generate(tabs.length, (index) {
          final data = tabs[index];
          final isSelected = index == controller.selectedFoodTab.value;

          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: index == 0 ? 19.w : 0, right: index == tabs.length - 1 ? 19.w : 0),
                key: ValueKey(index),
                width: 70.w,
                height: 60.h,
                child: CustomPaint(
                  painter: CustomTabBarPainter(isSelected: isSelected, themeColor: data.themeColor),
                  child: Center(child: SizedBox(height: 32.w, width: 32.w, child: SmartImage(path: data.imagePath))),
                ),
              ),
            ],
          );
        }),
      );
    });
  }
}

class CustomTabBarPainter extends CustomPainter {
  final bool isSelected;
  final Color themeColor;

  CustomTabBarPainter({required this.isSelected, required this.themeColor});

  @override
  void paint(Canvas canvas, Size size) {
    if (!isSelected) return;

    final paint =
        Paint()
          ..color = themeColor
          ..style = PaintingStyle.fill
          ..isAntiAlias = true;

    final path =
        Path()
          ..moveTo(0, size.height) // Start from bottom-left
          ..lineTo(0, 16) // Go up
          ..quadraticBezierTo(0, 0, 16, 0) // Top-left corner curve
          ..lineTo(size.width - 16, 0) // Top edge
          ..quadraticBezierTo(size.width, 0, size.width, 16) // Top-right corner curve
          ..lineTo(size.width, size.height) // Down to bottom-right
          ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _StickySearchAndTabsHeader extends SliverPersistentHeaderDelegate {
  final Color themeColor;
  final TabController tabController;
  final List<FoodTabData> tabs;

  _StickySearchAndTabsHeader({required this.themeColor, required this.tabController, required this.tabs});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final style = AppTheme.of(context).searchBarStyle;
    final controller = Get.find<FoodController>();
    print("Device height is :: ${Get.height}");
    return ColoredBox(
      color: Colors.white,
      child: Container(
        color: themeColor,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: SmartSearchBar(
                    items: [Get.find<FoodController>().hints[controller.currentHintIndex.value]],
                    controller: SearchController(),
                    onChanged: (val) {},
                    suffixIcon: SmartRow(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SmartImage(path: AppImages.icSearch, height: 24.h, width: 24.w),
                        Container(
                          height: 21.h,
                          width: 1.w,
                          margin: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
                          color: style.searchBarBorderColor,
                        ),
                        SmartImage(path: AppImages.icMic, width: 24.w, height: 24.h),
                      ],
                    ),
                  ),
                );
              }),
            ),
            AnimatedTabBar(tabController: tabController, tabs: tabs),
            Container(color: controller.currentFoodTabData.themeColor, height: 15),
          ],
        ),
      ),
    );
  }

  @override
  double get minExtent => Get.height < 738 ? 147 : 165;
  @override
  double get maxExtent => Get.height < 738 ? 147 : 165;

  @override
  bool shouldRebuild(covariant _StickySearchAndTabsHeader oldDelegate) => oldDelegate.themeColor != themeColor || oldDelegate.tabs != tabs;
}

class _StickyColorSpacerHeader extends SliverPersistentHeaderDelegate {
  final Color themeColor;
  final double height;

  _StickyColorSpacerHeader({required this.themeColor, required this.height});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: themeColor, height: height);
  }

  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;

  @override
  bool shouldRebuild(covariant _StickyColorSpacerHeader oldDelegate) =>
      oldDelegate.themeColor != themeColor || oldDelegate.height != height;
}
