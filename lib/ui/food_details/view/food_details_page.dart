import 'package:taza/taza.dart';

class FoodDetailsPage extends GetView<FoodDetailsController> {
  const FoodDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).foodDetailsPageStyle;
    return Scaffold(
      backgroundColor: style.grayColor,
      appBar: SmartAppBar(title: "Grilled Salmon",
        titleStyle: style.titleTextStyle,
      ),
      body: SmartColumn(
        children: [
          Expanded(
            child: SmartSingleChildScrollView(
              child: SmartColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  SmartColumn(
                    decoration: BoxDecoration(
                        color: style.whiteColor,
                      boxShadow: [BoxShadow(
                        color: const Color.fromRGBO(178, 189, 194, 0.25),
                        offset: const Offset(0, 0),
                        blurRadius: 5.0.r,
                        spreadRadius: 5.r,
                      ),],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(14.r)
                    ),
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                    clipBehavior: Clip.antiAlias,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          border: Border.all(color: style.grayColor, width: 0.7.w),
                        ),
                        margin: EdgeInsetsDirectional.all(10.w),
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 350.h,
                              child: PageView.builder(
                                controller: controller.pageController,
                                itemCount: controller.productImages.length,
                                onPageChanged: controller.onPageChanged,
                                itemBuilder: (context, index) {
                                  return SmartImage(
                                    padding: EdgeInsetsDirectional.all(15.w),
                                    width: Get.width,
                                    path: controller.productImages[index],
                                    height: 350.h,
                                    fit: BoxFit.contain,
                                  );
                                },
                              ),
                            ),
                            // Discount badge on the top-left corner.
                            SmartColumn(
                              padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                color: style.iconColors,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(14.r), bottomRight: Radius.circular(4.r)),
                              ),
                              children: [
                                SmartText("10%", style: style.percentageTextStyle),
                                SmartText("OFF", style: style.percentageTextStyle),
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
                                  onTap: () => controller.changeImage(i),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                                    width: 10.w,
                                    height: 10.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: controller.currentImageIndex.value == i ? style.iconColors : style.flashColors,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      // Divider to separate sections.
                      Padding(padding: EdgeInsets.symmetric(horizontal: 15.w), child: Divider(height: 0.7.h)),
                      SizedBox(height: 20.h),
                      // Row for delivery time.
                      SmartRow(
                        padding: EdgeInsetsDirectional.only(start: 12.w, end: 12.w),
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 2.w,
                        children: [
                          SmartImage(path: AppImages.icFlash),
                          SmartText("8 MINS", style: style.rattingTextStyle),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      // Product title.
                      SmartText(
                        "Grilled Salmon",
                        optionalPadding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
                        style: style.titleTextStyle,
                        animator: SmartAnimator(
                          animateFade: true,
                          animateSlideX: true,
                          animationDuration: 300.ms,
                          animationDelay: 600.ms,
                          animationCurve: Curves.decelerate,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      // Row for product details and add to cart button.
                      SmartRow(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmartColumn(
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
                                    16.toCurrencyCodeFormat(),
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
                                    20.toCurrencyCodeFormat(),
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
                          ),
                          // Add to cart button.
                          Container(
                            height: 40.h,
                            padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: style.whiteColor,
                                side: BorderSide(color: style.iconColors),
                                elevation: 2,
                              ),
                              onPressed: () => controller.addToCart(context),
                              child: SmartText(
                                "ADD",
                                style: style.addButtonStyle,
                                optionalPadding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SmartRow(
                        margin: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 5.h),
                        decoration: BoxDecoration(color: Colors.yellow[100], borderRadius: BorderRadius.circular(4.r)),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SmartText(4.toCurrencyCodeFormat(), style: style.titleTextStyle),
                          SizedBox(width: 5.w),
                          SmartText("MAXX SAVER PRICE", style: style.maxSaverTitleStyle, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                      SizedBox(height: 14.h),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SmartColumn(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                    clipBehavior: Clip.antiAlias,
                    decoration : BoxDecoration(
                      shape: BoxShape.rectangle, color: style.whiteColor,
                      borderRadius: BorderRadius.circular(14.r)
                    ),
                    children: [
                      SmartColumn(
                        width: Get.width,
                        padding: EdgeInsets.all(20.w),
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
                            decoration: BoxDecoration(color: style.highlightBgColor, borderRadius: BorderRadius.circular(8.r)),
                            children: [
                              _buildHighlightRow("Food Contents", "Grilled Salmon Super", style),
                              _buildDivider(),
                              _buildHighlightRow("Pack Size", "400g", style),
                              _buildDivider(),
                              _buildHighlightRow("Source", "Product of India", style),
                              _buildDivider(),
                              _buildHighlightRow("Speciality", "Delicious Test", style),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  // Description Section
                  SmartColumn(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: style.whiteColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(14.r),
                      boxShadow: [BoxShadow(
                        color: const Color.fromRGBO(178, 189, 194, 0.25),
                        offset: const Offset(0, 0),
                        blurRadius: 5.0.r,
                        spreadRadius: 5.r,
                      ),]
                    ),
                    children: [
                      SmartColumn(
                        width: Get.width,
                        padding: EdgeInsets.all(20.w),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        _buildBulletPoint("Create gourmet dishes with Daawat Basmati Rice Rozana Super"),
                                        SizedBox(height: 10.h),
                                        _buildBulletPoint("Versatile aromatic rice perfect for various cuisines"),
                                        SizedBox(height: 10.h),
                                        _buildBulletPoint("Premium quality from the Himalayan foothills."),
                                        SizedBox(height: 10.h),
                                        _buildBulletPoint("Returns: 3 - 5 Days of Delivery. This item is eligible for returns."),
                                      ],
                                    )
                                    : _buildBulletPoint("Returns: 3 - 5 Days of Delivery. This item is eligible for returns."),
                          ),
                          SizedBox(height: 15.h),
                          GestureDetector(
                            onTap: () => controller.toggleDescription(),
                            child: SmartRow(
                              children: [
                                Obx(() {
                                  return SmartText(
                                    controller.showFullDescription.value ? "- Show Less" : "+ Show More",
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
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a row for highlights.
  Widget _buildHighlightRow(String label, String value, FoodDetailsPageStyle style) {
    return SmartRow(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      children: [
        Expanded(
          flex: 2,
          child: SmartText(
            label,
            style: style.highlightTitleStyle,
            animator: SmartAnimator(
              animateFade: true,
              animateSlideX: true,
              animationDuration: 300.ms,
              animationDelay: 600.ms,
              animationCurve: Curves.decelerate,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: SmartText(
            value,
            style: style.highlightDescriptionStyle,
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

  // Helper method to build a divider.
  Widget _buildDivider() {
    return Divider(height: 1, thickness: 1,);
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
