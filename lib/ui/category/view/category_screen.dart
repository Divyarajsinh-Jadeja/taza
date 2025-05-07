import 'package:taza/taza.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isFromInstamart = Get.arguments as bool;
    final style = AppTheme.of(context).appBarStyle;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Obx(() {
          return SmartAppBar(
            // leadingImage: controller.currentCategory.image,
            titleWidget: SmartColumn(
              // padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmartText(
                  !isFromInstamart ? controller.currentCategory.name : controller.currentInstamartCategory.name,
                  style: style.titleStyle,
                ),
                // SmartText(
                //   controller.currentCategory.name,
                //   style: style.subTitleStyle,
                // ),
              ],
            ),
            actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
          );
        }),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SmartRow(
              padding: EdgeInsetsDirectional.only(bottom: Get.find<DashboardController>().showInstamartBottomCart?130.h:0),
              children: [CategorySidebar(isFromInstamart), Expanded(child: CategoryProductGrid(isFromInstamart))],
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
    );
  }
}

class ProductInstamartListView extends GetView<CategoryController> {
  const ProductInstamartListView({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).productListViewStyle;
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        _buildProductCountSection(style),
        // Featured Ad Banner - Part of scrollable content
        if (controller.isShowBanner)
          AnimatedSliverBox(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.0.w),
              child: PromotionalBanner(),
            ),
          ),

        // Items count text
        ///Code commented - Don't Remove
        /*SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 16.w,
              bottom: 8.h,
              top: 16.h,
              end: 16.w,
            ),
            child: SmartText(
              "${controller.currentCategory.products?.length ?? 0} items in ${controller.currentCategory.name}",
              style: style.itemsStyle,
            ),
          ),
        ),*/
        // Products Grid converted to SliverList
        SliverPadding(
          padding: EdgeInsetsDirectional.all(16.0.w),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final int itemIndex = index * 2;
              if (itemIndex >=
                  (controller.currentInstamartCategory.products?.length ?? 0)) {
                return null; // End of list
              }
              return SmartRow(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductCard(
                      onProductTap:
                          () {
                        Get.toNamed(AppRoutes.foodDetailsPage, arguments: controller.currentInstamartCategory.products![itemIndex],);
                          },
                      product: controller.currentInstamartCategory.products![itemIndex],
                      index: itemIndex,
                      hasDiscount: itemIndex % 3 == 0,
                      discountPercent: "${(10 + (itemIndex % 3) * 5)}%",
                      onAddTap: () {},
                    ),
                  ),
                  SizedBox(width: 16.w),

                  Expanded(
                    child:
                    (itemIndex + 1 <
                        (controller.currentInstamartCategory.products?.length ??
                            0))
                        ? ProductCard(
                      onProductTap:
                          () {
                        Get.toNamed(AppRoutes.foodDetailsPage, arguments: controller.currentInstamartCategory.products![itemIndex + 1],);
                      },
                      product:
                      controller.currentInstamartCategory.products![itemIndex + 1],
                      index: itemIndex + 1,
                      hasDiscount: (itemIndex + 1) % 4 == 0,
                      discountPercent:
                      "${(5 + ((itemIndex + 1) % 4) * 3)}%",
                      onAddTap: () {},
                    )
                        : SizedBox(),
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildProductCountSection(ProductListViewStyle style) {
    return AnimatedSliverBox(
      child: SmartRow(
        padding: EdgeInsetsDirectional.all(16.w),
        children: [
          SmartColumn(
            expanded: true,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Code commented - Don't remove
              /*SmartText(
                controller.currentCategory.name ?? "",
                style: style.categoryHeaderStyle,
              ),*/
              SizedBox(height: 2.h),
              SmartText(
                LocaleKeys.itemCount.tr.interpolate([
                  controller.currentInstamartCategory.products?.length ?? 0,
                ]),
                style: style.categorysubHeaderStyle,
              ),
            ],
          ),
          FilterButton(onTap: () {}),
        ],
      ),
    );
  }
}

class ProductListView extends GetView<CategoryController> {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).productListViewStyle;
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        _buildProductCountSection(style),
        // Featured Ad Banner - Part of scrollable content
        if (controller.isShowBanner)
          AnimatedSliverBox(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.0.w),
              child: PromotionalBanner(),
            ),
          ),

        // Items count text
        ///Code commented - Don't Remove
        /*SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 16.w,
              bottom: 8.h,
              top: 16.h,
              end: 16.w,
            ),
            child: SmartText(
              "${controller.currentCategory.products?.length ?? 0} items in ${controller.currentCategory.name}",
              style: style.itemsStyle,
            ),
          ),
        ),*/

        // Products Grid converted to SliverList
        SliverPadding(
          padding: EdgeInsetsDirectional.all(16.0.w),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final int itemIndex = index * 2;
              if (itemIndex >=
                  (controller.currentCategory.products?.length ?? 0)) {
                return null; // End of list
              }
              return SmartRow(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductCard(
                      onProductTap:
                          () => Get.toNamed(AppRoutes.foodDetailsPage, arguments: controller.currentCategory.products![itemIndex]),
                      product: controller.currentCategory.products![itemIndex],
                      index: itemIndex,
                      hasDiscount: itemIndex % 3 == 0,
                      discountPercent: "${(10 + (itemIndex % 3) * 5)}%",
                      onAddTap: () {},
                    ),
                  ),
                  SizedBox(width: 16.w),

                  Expanded(
                    child:
                        (itemIndex + 1 <
                                (controller.currentCategory.products?.length ??
                                    0))
                            ? ProductCard(
                          onProductTap:
                              () => Get.toNamed(AppRoutes.foodDetailsPage, arguments: controller.currentCategory.products![itemIndex+1]),
                              product:
                                  controller
                                      .currentCategory
                                      .products![itemIndex + 1],
                              index: itemIndex + 1,
                              hasDiscount: (itemIndex + 1) % 4 == 0,
                              discountPercent:
                                  "${(5 + ((itemIndex + 1) % 4) * 3)}%",
                              onAddTap: () {},
                            )
                            : SizedBox(),
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildProductCountSection(ProductListViewStyle style) {
    return AnimatedSliverBox(
      child: SmartRow(
        padding: EdgeInsetsDirectional.all(16.w),
        children: [
          SmartColumn(
            expanded: true,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Code commented - Don't remove
              /*SmartText(
                controller.currentCategory.name ?? "",
                style: style.categoryHeaderStyle,
              ),*/
              SizedBox(height: 2.h),
              SmartText(
                LocaleKeys.itemCount.tr.interpolate([
                  controller.currentCategory.products?.length ?? 0,
                ]),
                style: style.categorysubHeaderStyle,
              ),
            ],
          ),
          FilterButton(onTap: () {}),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final VoidCallback onTap;

  const FilterButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: SmartRow(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.grey[300]!),
        ),
        children: [
          Icon(Icons.tune, size: 18),
          SizedBox(width: 4),
          Text("Filters", style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final InstamartProductModel product;
  final int index;
  final bool hasDiscount;
  final String discountPercent;
  final VoidCallback onAddTap;
  final VoidCallback onProductTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.index,
    this.hasDiscount = false,
    this.discountPercent = "0%",
    required this.onAddTap,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).productCardStyle;

    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 24.h),
      child: Bounceable(
        onTap: onProductTap,
        child: Stack(
          children: [
            SmartColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Hero(
                  tag: 'product_${product.id}',
                  child: Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                      color: style.imageBackgroundColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Center(
                      child:
                          product.imageUrl.isNotEmpty
                              ? ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: SmartImage(
                                  path: product.imageUrl,
                                  width: Get.width,
                                  height: Get.height,
                                  imageBorderRadius: BorderRadius.circular(8.r),
                                ),
                              )
                              : Icon(
                                Icons.image,
                                size: 40.r,
                                color: style.imageIconColor,
                              ),
                    ),
                  ),
                ),

                // Delivery Time
                SmartRow(
                  spacing: 4.w,
                  padding: EdgeInsetsDirectional.only(top: 8.h),
                  children: [
                    Icon(
                      Icons.bolt,
                      size: 14.r,
                      color: style.deliveryIconColor,
                    ),
                    SmartText("6 MINS", style: style.deliveryTimeTextStyle),
                  ],
                ),

                // Product Name
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 4.h),
                  child: SmartText(
                    "${product.name}\n",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: style.nameTextStyle,
                  ),
                ),

                // Product Size
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 4.h),
                  child: SmartText("250 ml", style: style.sizeTextStyle),
                ),

                // Price
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 4.h),
                  child: SmartRow(
                    spacing: 6.w,
                    children: [
                      SmartText(
                        hasDiscount
                            ? (product.price * 0.8).toCurrencyCodeFormat()
                            : product.price.toCurrencyCodeFormat(),
                        style: style.discountedPriceTextStyle,
                      ),
                      if (hasDiscount)
                        SmartText(
                          product.price.toCurrencyCodeFormat(),
                          style: style.originalPriceTextStyle,
                        ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h,),
                Center(child: InstamartQuantityWidget(model: product)),

              ],
            ),

            // Discount Badge
            if (hasDiscount)
              Positioned.directional(
                top: 8.h,
                start: 8.w,
                textDirection: TextDirection.ltr,
                child: Container(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 8.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: style.discountBadgeColor,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: SmartText(
                    "$discountPercent OFF",
                    style: style.discountBadgeTextStyle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class AnimatedSliverBox extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double verticalOffset;

  const AnimatedSliverBox({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 375),
    this.verticalOffset = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AnimationLimiter(
        child: AnimationConfiguration.synchronized(
          duration: duration,
          child: SlideAnimation(
            verticalOffset: verticalOffset,
            child: FadeInAnimation(child: child),
          ),
        ),
      ),
    );
  }
}
