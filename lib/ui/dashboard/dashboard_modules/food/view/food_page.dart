import 'package:taza/taza.dart';
import 'package:taza/ui/widgets/sticky_sliver_header.dart';

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
            StickySliver(child: Container(color: tabData.themeColor, child: SafeArea(child: SizedBox()))),
            _animatedBoxAdapter(
              child: SmartRow(
                padding: EdgeInsets.all(16.w),
                children: [
                  SmartColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmartRow(
                        children: [
                          SmartImage(path: AppImages.icHome),
                          SmartText(LocaleKeys.home.tr),
                          SmartImage(path: AppImages.icArrowUp),
                        ],
                      ),
                      SmartText("Al Tadamun Al Arabi St., Mishfirah, Jeddah  "),
                    ],
                  ),
                  Flexible(child: SmartImage(path: AppImages.icFood)),
                ],
              ),
            ),
            StickySliver(
              child: ColoredBox(
                color: Colors.white,
                child: Container(
                  color: tabData.themeColor.withValues(alpha: 0.4),
                  child: Column(
                    children: [
                      SmartTextField(padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h)),
                      AnimatedTabBar(tabController: controller.foodTabController, tabs: controller.tabs),
                    ],
                  ),
                ),
              ),
            ),
            StickySliver(child: Container(color: tabData.themeColor, child: SizedBox(height: 12))),
            _animatedBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(50),
                color: tabData.themeColor.withValues(alpha: 0.4),
                child: SmartText("Banner", textAlign: TextAlign.center),
              ),
            ),

            // _animatedBoxAdapter(child: SizedBox(height: 24.h)),
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
            _animatedBoxAdapter(child: SizedBox(height: 260.h)),
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

class AnimatedTabBar extends GetView<FoodController> {
  final TabController tabController;
  final List<FoodTabData> tabs;
  final Function(int)? onTabChange;

  const AnimatedTabBar({super.key, required this.tabController, required this.tabs, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(tabs.length, (index) {
            final data = tabs[index];
            final isSelected = index == controller.selectedFoodTab.value;
            return GestureDetector(
              onTap: () {
                if (!isSelected) {
                  tabController.animateTo(index);
                  onTabChange?.call(index);
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: index == 0 ? 19.w : 0, right: index == tabs.length - 1 ? 19.w : 0),
                width: 70.w,
                height: 60.h,
                child: CustomPaint(
                  painter: CustomTabBarPainter(isSelected: isSelected, themeColor: data.themeColor),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [SizedBox(height: 32, width: 32, child: SmartImage(path: data.imagePath))],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
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
