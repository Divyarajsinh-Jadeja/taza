import 'package:taza/taza.dart';

class InstamartDashboardProductCard extends StatelessWidget {
  final InstamartProductModel product;
  final int index;
  final bool hasDiscount;
  final String discountPercent;
  final String? animatedDiscountPercentage;
  final double? imageWidth;
  final double? imageHeight;
  final VoidCallback onAddTap;
  final VoidCallback onProductTap;
  final bool seeMore;
  final Color? bgColor;
  final Color? discountTextColor;

  const InstamartDashboardProductCard({
    super.key,
    required this.product,
    required this.index,
    this.hasDiscount = false,
    this.discountPercent = "0%",
    this.imageWidth,
    this.imageHeight,
    this.animatedDiscountPercentage,
    required this.onAddTap,
    this.bgColor,
    this.discountTextColor,
    required this.onProductTap,
    this.seeMore=false,
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
                Stack(
                  children: [
                    Hero(
                      tag: 'product_${product.id}',
                      child: Container(
                        height: 120.h,
                        width: 110.h,
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Center(
                          child:
                          product.imageUrl.isNotEmpty
                              ? SmartImage(
                            clipBehavior: Clip.antiAlias,
                            path: product.imageUrl,
                            width: imageWidth ?? Get.width,
                            height: imageHeight ?? Get.height,
                            fit: BoxFit.cover,
                            imageBorderRadius: BorderRadius.circular(8.r),
                          )
                              : Icon(
                            Icons.image,
                            size: 40.r,
                            color: style.imageIconColor,
                          ),
                        ),
                      ),
                    ),
                    // InstamartQuantityWidget(model: product),
                  ],
                ),
                SizedBox(
                  width: 100.w,
                  child: SmartText(
                    "${product.name}\n",
                    maxLines: 1,
                    optionalPadding: EdgeInsetsDirectional.only(top: 8.h),
                    overflow: TextOverflow.ellipsis,
                    style: style.nameTextStyle.copyWith(fontSize: 14.sp),
                  ),
                ),
                SmartText("⭐⭐⭐⭐⭐(950)", style: style.sizeTextStyle.copyWith(fontSize: 10.sp),
                ),
                SmartRow(
                  spacing: 4.w,
                  padding: EdgeInsetsDirectional.only(top:6.h),
                  children: [
                    Icon(
                      Icons.bolt,
                      size: 14.r,
                    ),
                    SmartText("6 MINS", style: style.nameTextStyle.copyWith(fontSize:12.sp )),
                  ],
                ),
                SizedBox(height: 4.h,),
                SmartAnimator(
                  animateFadeIn: true,
                  animateSlideY: true,
                  slideYBegin: const Offset(0, 0.1),
                  animationDuration: const Duration(milliseconds: 500),
                  animationCurve: Curves.easeOut,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    transitionBuilder: (Widget child,
                        Animation<double> animation) {
                      final inAnimation = Tween<Offset>(
                        begin: Offset(0, 1),
                        end: Offset.zero,
                      ).animate(animation);
                      final outAnimation = Tween<Offset>(
                        begin: Offset(0, -1),
                        end: Offset(0, 0),
                      ).animate(animation);
                      final isEntering = child.key == ValueKey(animatedDiscountPercentage);
                      return ClipRect(
                        child: SlideTransition(
                          position: isEntering ? inAnimation : outAnimation,
                          child: child,
                        ),
                      );
                    },
                    child: SmartText(
                      animatedDiscountPercentage,
                      textAlign: TextAlign.start,
                      style: style.nameTextStyle.copyWith(fontSize: 13.sp, color: discountTextColor),
                      key: ValueKey(animatedDiscountPercentage),
                      optionalPadding: EdgeInsetsDirectional.only(top: 4.h),
                    ),
                  ),
                ),
                SmartRow(
                  padding: EdgeInsetsDirectional.only(top: 4.h),
                  spacing: 6.w,
                  children: [
                    SmartText(
                      hasDiscount
                          ? (product.price * 0.8).toCurrencyCodeFormat()
                          : product.price.toCurrencyCodeFormat(),
                      style: style.discountedPriceTextStyle,
                    ),
                    SmartText("MRP"),
                    if (hasDiscount)
                      SmartText(
                        product.price.toCurrencyCodeFormat(),
                        style: style.originalPriceTextStyle,
                      ),
                  ],
                ),
                if (seeMore)
                  SmartRow(
                    onTap: () async {
                      final controller = Get.find<CategoryController>();
                      controller.generateRandomProducts(count: 8);
                      await Utils.showSmartModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) {
                          return DraggableScrollableSheet(
                            initialChildSize: 0.8, // 50% of screen height
                            minChildSize: 0.4,
                            maxChildSize: 0.9,
                            expand: false,
                            builder: (context, scrollController) {
                              return Container(
                                padding: EdgeInsetsDirectional.only(
                                  start: 16.w,
                                  end: 16.w,
                                  top: 16.h,
                                ),
                                decoration: BoxDecoration(
                                  color: style.whiteColor,
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
                                ),
                                child: SafeArea(
                                  top: false,
                                  child: SmartColumn(
                                    children: [
                                      SmartRow(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SmartText(
                                            "More like this",
                                            style: style.nameTextStyle,
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.close,),
                                            onPressed: () => Get.back(),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 12.h),
                                      Expanded(
                                        child: Obx(() {
                                          final products = controller.randomProducts;
                                          return GridView.builder(
                                            controller: scrollController,
                                            itemCount: products.length,
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 12.w,
                                              mainAxisSpacing: 12.h,
                                              childAspectRatio: 0.35,
                                            ),
                                            itemBuilder: (context, index) {
                                              final product = products[index];
                                              return ProductCard(
                                                product: product,
                                                index: index,
                                                onAddTap: () {
                                                  // Add to cart logic
                                                },
                                                onProductTap: () {
                                                  // Navigate to product details
                                                },
                                              );
                                            },
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(color: style.primaryColor),
                    ),
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 4.w),
                    children: [
                      SmartText("See more like this", style: style.seeMoreStyle),
                      Icon(Icons.arrow_right, color: style.primaryColor),
                    ],
                  ),

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
