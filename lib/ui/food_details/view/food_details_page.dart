import 'package:taza/taza.dart';

class FoodDetailsPage extends GetView<FoodDetailsController> {
  const FoodDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final InstamartProductModel category =
        Get.arguments as InstamartProductModel;
    final style = AppTheme.of(context).foodDetailsPageStyle;
    final loginStyle = AppTheme.of(context).loginPageStyle;

    return Scaffold(
      backgroundColor: style.grayColor,
      appBar: SmartAppBar(
        title: category.name,
        titleStyle: style.titleTextStyle,
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            child: Icon(Icons.share_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SmartColumn(
              children: [
                Expanded(
                  child: SmartSingleChildScrollView(
                    child: Obx(() {
                      return SmartColumn(
                        padding: EdgeInsetsDirectional.only(
                          bottom:
                              Get.find<DashboardController>()
                                      .showInstamartBottomCart
                                  ? 130.h
                                  : 0,
                        ),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12.h),
                          SmartColumn(
                            decoration: BoxDecoration(
                              color: style.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromRGBO(
                                    178,
                                    189,
                                    194,
                                    0.25,
                                  ),
                                  offset: const Offset(0, 0),
                                  blurRadius: 5.0.r,
                                  spreadRadius: 5.r,
                                ),
                              ],
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            margin: EdgeInsetsDirectional.symmetric(
                              horizontal: 10.w,
                            ),
                            clipBehavior: Clip.antiAlias,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.r),
                                  border: Border.all(
                                    color: style.grayColor,
                                    width: 0.7.w,
                                  ),
                                ),
                                margin: EdgeInsetsDirectional.all(10.w),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14.r),
                                      child: SizedBox(
                                        height: 350.h,
                                        child: PageView.builder(
                                          controller: controller.pageController,
                                          itemCount:
                                              controller.productImages.length,
                                          onPageChanged:
                                              controller.onPageChanged,
                                          itemBuilder: (context, index) {
                                            return SmartImage(
                                              width: Get.width,
                                              path: category.imageUrl,
                                              height: 350.h,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    // Discount badge on the top-left corner.
                                    SmartColumn(
                                      padding: EdgeInsetsDirectional.symmetric(
                                        horizontal: 10.w,
                                        vertical: 5.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: style.iconColors,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(14.r),
                                          bottomRight: Radius.circular(4.r),
                                        ),
                                      ),
                                      children: [
                                        SmartText(
                                          10.toCurrencyCodeFormat(),
                                          style: style.percentageTextStyle,
                                        ),
                                        SmartText(
                                          "OFF",
                                          style: style.percentageTextStyle,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Center the image indicators.
                              Center(
                                child: SmartRow(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (int i = 0; i < 3; i++)
                                      Obx(
                                        () => GestureDetector(
                                          onTap:
                                              () => controller.changeImage(i),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 5.w,
                                            ),
                                            width: 10.w,
                                            height: 10.w,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  controller
                                                              .currentImageIndex
                                                              .value ==
                                                          i
                                                      ? style.iconColors
                                                      : style.flashColors,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Padding(
                                padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 15.w,
                                ),
                                child: Divider(height: 0.7.h),
                              ),
                              SizedBox(height: 20.h),
                              SmartRow(
                                children: [
                                  SmartColumn(
                                    expanded: true,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                    SmartRow(
                                      padding: EdgeInsetsDirectional.only(
                                        start: 12.w,
                                        end: 12.w,
                                      ),
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      spacing: 2.w,
                                      children: [
                                        SmartImage(path: AppImages.icFlash),
                                        SmartText(
                                          "8 MINS",
                                          style: style.rattingTextStyle,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6.h),
                                    SmartText(
                                      category.name,
                                      optionalPadding:
                                      EdgeInsetsDirectional.symmetric(
                                        horizontal: 15.w,
                                      ),
                                      style: style.titleTextStyle,
                                      animator: SmartAnimator(
                                        animateFade: true,
                                        animateSlideX: true,
                                        animationDuration: 300.ms,
                                        animationDelay: 600.ms,
                                        animationCurve: Curves.decelerate,
                                      ),
                                    ),
                                  ]),
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(end: 10.0),
                                    child: InstamartQuantityWidget(model: category),
                                  ),
                                ],
                              ),

                              SizedBox(height: 12.h),
                              SmartColumn(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SmartRow(
                                    padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 15.w,
                                    ),
                                    children: [
                                      SmartText(
                                        category.price.toCurrencyCodeFormat(),
                                        style: loginStyle.tagTextStyle.copyWith(
                                          color: loginStyle.continueButtonBgColor,
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6.w,
                                          vertical: 3.h,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Colors.orange.shade200, Colors.orange.shade50],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            4.r,
                                          ),
                                        ),
                                        child: SmartText(
                                          "${44.toCurrencyCodeFormat()} OFF",
                                          style: style.descriptionTextStyle
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.orange.shade800,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6.h),
                                  SmartRichText(
                                    padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 15.w,
                                    ),
                                    spans: [
                                      SmartTextSpan(
                                        text:
                                            "MRP ${84.toCurrencyCodeFormat()}",
                                        style: style.descriptionTextStyle
                                            .copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                      ),
                                      SmartTextSpan(
                                        text: "(MRP inclusive of all taxes)",
                                        style: style.descriptionTextStyle,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  SmartText(
                                    "Weight: 870 g",
                                    optionalPadding:
                                        EdgeInsetsDirectional.symmetric(
                                          horizontal: 15.w,
                                        ),
                                    style: style.titleTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  SmartRow(
                                    padding: EdgeInsetsDirectional.symmetric(horizontal: 14.w),
                                    spacing: 10.w,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(2, (index) {
                                      final bool isSelected = controller.selectedVariantIndex.value == index;
                                      return GestureDetector(
                                        onTap: () => controller.selectVariant(index),
                                        child: SmartColumn(
                                          children: [
                                            SmartColumn(
                                              width: 120.w,
                                              padding: EdgeInsetsDirectional.all(5.w),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8.r),
                                                border: Border.all(
                                                  color: isSelected
                                                      ? loginStyle.continueButtonBgColor
                                                      : loginStyle.continueButtonDisableBgColor,
                                                ),
                                              ),
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: EdgeInsetsDirectional.all(4.w),
                                                  width: Get.width,
                                                  decoration: BoxDecoration(
                                                    color: isSelected
                                                        ? loginStyle.continueButtonBgColor
                                                        : loginStyle.continueButtonDisableBgColor,
                                                    borderRadius: BorderRadius.circular(4.r),
                                                  ),
                                                  child: SmartText(
                                                    index == 0 ? "870 g" : "${4.toCurrencyCodeFormat()} kg",
                                                    style: loginStyle.tagTextStyle.copyWith(fontSize: 16.sp),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SizedBox(height: 6.h),
                                                SmartText(
                                                  index == 0
                                                      ? "(${8.toCurrencyCodeFormat()} / 1 gm)"
                                                      : "(${186.toCurrencyCodeFormat()} / 1 kg)",
                                                  style: style.descriptionTextStyle.copyWith(fontSize: 14.sp),
                                                ),
                                              ],
                                            ),
                                            if (index == 1)
                                              Container(
                                                width: 110.w,
                                                padding: EdgeInsetsDirectional.symmetric(horizontal: 6.w, vertical: 3.h),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [Colors.orange.shade200, Colors.orange.shade50],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                  borderRadius: BorderRadius.circular(4.r),
                                                ),
                                                child: SmartText(
                                                  "${210.toCurrencyCodeFormat()} OFF",
                                                  style: style.descriptionTextStyle.copyWith(
                                                    color: Colors.orange.shade800,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      );
                                    }),
                                  )

                                ],
                              ),
                              ///Old code
                              SmartRow(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /*SmartColumn(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  expanded: true,
                                  children: [
                                    SmartText(
                                      optionalPadding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
                                      "400g",
                                      style: style.descriptionTextStyle,
                                      animator: SmartAnimator(
                                        animateFade: true,
                                        animateSlideX: true,
                                        animationDuration: 300.ms,
                                        animationDelay: 600.ms,
                                        animationCurve: Curves.decelerate,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    SmartRow(
                                      padding:  EdgeInsetsDirectional.symmetric(horizontal: 15.w),
                                      children: [
                                        SmartText(
                                          category.price.toCurrencyCodeFormat(),
                                          style: style.titleTextStyle,
                                          animator: SmartAnimator(
                                            animateFade: true,
                                            animateSlideX: true,
                                            animationDuration: 300.ms,
                                            animationDelay: 600.ms,
                                            animationCurve: Curves.decelerate,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        SmartText(
                                          (category.price + 50).toCurrencyCodeFormat(),
                                          style: style.descriptionTextStyle.copyWith(decoration: TextDecoration.lineThrough),
                                          animator: SmartAnimator(
                                            animateFade: true,
                                            animateSlideX: true,
                                            animationDuration: 300.ms,
                                            animationDelay: 600.ms,
                                            animationCurve: Curves.decelerate,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                  ],
                                ),*/
                                  // Add to cart button.
                                  // InstamartQuantityWidget(model: category),
                                  SizedBox(width: 10.w),
                                ],
                              ),
                              /*SmartRow(
                              mainAxisSize: MainAxisSize.min,
                              padding: EdgeInsetsDirectional.symmetric(
                                vertical: 6.h,
                                horizontal: 12.w,
                              ),
                              margin: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    foodOptionCardStyle.tagStartGradientStartColor,
                                    foodOptionCardStyle.tagEndGradientStartColor,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              children: [
                                SmartText(10.toCurrencyCodeFormat(), style: style.titleTextStyle),
                                SizedBox(width: 5.w),
                                SmartText("MAXX SAVER PRICE", style: style.maxSaverTitleStyle, overflow: TextOverflow.ellipsis,),
                              ],
                            ),*/
                              SizedBox(height: 14.h),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          SmartColumn(
                            margin: EdgeInsetsDirectional.symmetric(
                              horizontal: 10.w,
                            ),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: style.whiteColor,
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            children: [
                              SmartColumn(
                                width: Get.width,
                                padding: EdgeInsetsDirectional.all(20.w),
                                color: style.whiteColor,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SmartText(
                                    "Highlights",
                                    style: style.titleTextStyle,
                                    animator: SmartAnimator(
                                      animateFade: true,
                                      animateSlideX: true,
                                      animationDuration: 300.ms,
                                      animationDelay: 600.ms,
                                      animationCurve: Curves.decelerate,
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  SmartColumn(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    children: [
                                      SmartRow(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: SmartColumn(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    10.r,
                                                  ),
                                                  bottomLeft: Radius.circular(
                                                    10.r,
                                                  ),
                                                ),
                                                color: Colors.grey.shade200,
                                              ),
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                _buildSideText(
                                                  "Food Contents",
                                                  style.highlightTitleStyle,
                                                ),
                                                _buildDivider(),
                                                _buildSideText(
                                                  "Pack Size",
                                                  style.highlightTitleStyle,
                                                ),
                                                _buildDivider(),
                                                _buildSideText(
                                                  "Source",
                                                  style.highlightTitleStyle,
                                                ),
                                                _buildDivider(),
                                                _buildSideText(
                                                  "Speciality",
                                                  style.highlightTitleStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: SmartColumn(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                    10.r,
                                                  ),
                                                  bottomRight: Radius.circular(
                                                    10.r,
                                                  ),
                                                ),
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.grey.shade200,
                                                ),
                                              ),
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                _buildSideText(
                                                  category.name,
                                                  style
                                                      .highlightDescriptionStyle,
                                                ),
                                                _buildDivider(),
                                                _buildSideText(
                                                  "400g",
                                                  style
                                                      .highlightDescriptionStyle,
                                                ),
                                                _buildDivider(),
                                                _buildSideText(
                                                  "Product of India",
                                                  style
                                                      .highlightDescriptionStyle,
                                                ),
                                                _buildDivider(),
                                                _buildSideText(
                                                  "Delicious Test",
                                                  style
                                                      .highlightDescriptionStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          // Description Section
                          SmartColumn(
                            margin: EdgeInsetsDirectional.symmetric(
                              horizontal: 10.w,
                            ),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: style.whiteColor,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(14.r),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromRGBO(
                                    178,
                                    189,
                                    194,
                                    0.25,
                                  ),
                                  offset: const Offset(0, 0),
                                  blurRadius: 5.0.r,
                                  spreadRadius: 5.r,
                                ),
                              ],
                            ),
                            children: [
                              SmartColumn(
                                width: Get.width,
                                padding: EdgeInsetsDirectional.all(20.w),
                                color: style.whiteColor,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SmartText(
                                    "Description",
                                    style: style.titleTextStyle,
                                    animator: SmartAnimator(
                                      animateFade: true,
                                      animateSlideX: true,
                                      animationDuration: 300.ms,
                                      animationDelay: 600.ms,
                                      animationCurve: Curves.decelerate,
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  SmartText(
                                    "Experience the aromatic and versatile flavour of Grilled Salmon Super. Perfect for creating gourmet dishes with superior quality.",
                                    style: style.highlightTitleStyle,
                                    animator: SmartAnimator(
                                      animateFade: true,
                                      animateSlideX: true,
                                      animationDuration: 300.ms,
                                      animationDelay: 600.ms,
                                      animationCurve: Curves.decelerate,
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  Obx(
                                    () =>
                                        controller.showFullDescription.value
                                            ? SmartColumn(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                _buildBulletPoint(
                                                  "Create gourmet dishes with Daawat Basmati Rice Rozana Super",
                                                ),
                                                SizedBox(height: 10.h),
                                                _buildBulletPoint(
                                                  "Versatile aromatic rice perfect for various cuisines",
                                                ),
                                                SizedBox(height: 10.h),
                                                _buildBulletPoint(
                                                  "Premium quality from the Himalayan foothills.",
                                                ),
                                                SizedBox(height: 10.h),
                                                _buildBulletPoint(
                                                  "Returns: 3 - 5 Days of Delivery. This item is eligible for returns.",
                                                ),
                                              ],
                                            )
                                            : _buildBulletPoint(
                                              "Returns: 3 - 5 Days of Delivery. This item is eligible for returns.",
                                            ),
                                  ),
                                  SizedBox(height: 15.h),
                                  GestureDetector(
                                    onTap: () => controller.toggleDescription(),
                                    child: SmartRow(
                                      children: [
                                        Obx(() {
                                          return SmartText(
                                            controller.showFullDescription.value
                                                ? "- Show Less"
                                                : "+ Show More",
                                            style: style.showMoreLessTextStyle,
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          SmartColumn(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            margin: EdgeInsetsDirectional.symmetric(
                              horizontal: 10.w,
                            ),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: style.whiteColor,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(14.r),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromRGBO(
                                    178,
                                    189,
                                    194,
                                    0.25,
                                  ),
                                  offset: const Offset(0, 0),
                                  blurRadius: 5.0.r,
                                  spreadRadius: 5.r,
                                ),
                              ],
                            ),
                            children: [
                              SmartRow(
                                children: [
                                  SmartText(
                                    "Similar Products",
                                    isExpanded: true,
                                    optionalPadding: EdgeInsetsDirectional.all(
                                      14.w,
                                    ),
                                    style: style.titleTextStyle,
                                    animator: SmartAnimator(
                                      animateFade: true,
                                      animateSlideX: true,
                                      animationDuration: 300.ms,
                                      animationDelay: 600.ms,
                                      animationCurve: Curves.decelerate,
                                    ),
                                  ),
                                  SmartText(
                                    "View All",
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
                                    padding: EdgeInsetsDirectional.only(
                                      end: 8.0,
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward_sharp,
                                      size: 20.w,
                                      color: style.iconColors,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 320.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  padding: EdgeInsetsDirectional.only(
                                    end: 12.w,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        start: 12.w,
                                      ),
                                      child: ProductCard(
                                        imageWidth: 120.w,
                                        product: InstamartProductModel(
                                          id: category.id,
                                          name: category.name,
                                          description: category.description,
                                          price: category.price,
                                          imageUrl: category.imageUrl,
                                        ),
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
                          ),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSideText(String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      child: SmartText(
        text,
        style: style,
        animator: SmartAnimator(
          animateFade: true,
          animateSlideX: true,
          animationDuration: 300.ms,
          animationDelay: 600.ms,
          animationCurve: Curves.decelerate,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, thickness: 1);
  }

  // Helper method to build a bullet point for description.
  Widget _buildBulletPoint(String text) {
    return SmartRow(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartText(
          "• ",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          animator: SmartAnimator(
            animateFade: true,
            animateSlideX: true,
            animationDuration: 300.ms,
            animationDelay: 600.ms,
            animationCurve: Curves.decelerate,
          ),
        ),
        Expanded(
          child: SmartText(
            text,
            style: const TextStyle(fontSize: 16),
            animator: SmartAnimator(
              animateFade: true,
              animateSlideX: true,
              animationDuration: 300.ms,
              animationDelay: 600.ms,
              animationCurve: Curves.decelerate,
            ),
          ),
        ),
      ],
    );
  }
}
