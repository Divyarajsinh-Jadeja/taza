import 'package:taza/taza.dart';

class FoodDetailsPage extends GetView<FoodDetailsController> {
  const FoodDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).foodDetailsPageStyle;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: SmartAppBar(title: "DAAWAT Basmati Rice - Rozana Super"),
      body: SmartColumn(
        children: [
          Expanded(
            child: SmartSingleChildScrollView(
              child: SmartColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  Card(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                    child: SmartColumn(
                      color: Colors.white,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(color: Colors.grey.shade500, width: 0.7.w),
                          ),
                          margin: EdgeInsets.all(10.w),
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsetsDirectional.all(15.w),
                                width: Get.width,
                                child: SmartImage(
                                  path: 'https://i.ibb.co/wZDz4H7c/daawat-basmati-rice-rozana-gold-1-kg-quick-pantry.jpg',
                                  height: 350.h,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              PositionedDirectional(
                                top: 10.h,
                                start: 10.w,
                                child: SmartColumn(
                                  padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 5.h),
                                  decoration: BoxDecoration(color: Colors.deepOrange, borderRadius: BorderRadius.circular(4)),
                                  children: [
                                    Text("27%", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp)),
                                    Text("OFF", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: controller.currentImageIndex.value == i ? Colors.deepOrange : Colors.grey[300],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 15.w), child: Divider(height: 0.7.h)),
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 12.w, end: 12.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.flash_on, color: style.flashColors, size: 18.w),
                              SizedBox(width: 2.w),
                              Text("8 MINS", style: style.rattingTextStyle),
                            ],
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Padding(
                          padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
                          child: SmartText(
                            "DAAWAT Basmati Rice - Rozana Super",
                            style: style.titleTextStyle,
                            animator: SmartAnimator(
                              animateFade: true,
                              animateSlideX: true,
                              animationDuration: 300.ms,
                              animationDelay: 600.ms,
                              animationCurve: Curves.decelerate,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        SmartRow(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmartColumn(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              expanded: true,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                                  child: SmartText(
                                    "5 kg",
                                    style: style.descriptionTextStyle,
                                    animator: SmartAnimator(
                                      animateFade: true,
                                      animateSlideX: true,
                                      animationDuration: 300.ms,
                                      animationDelay: 600.ms,
                                      animationCurve: Curves.decelerate,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    children: [
                                      SmartText(
                                        "₹359",
                                        style: style.descriptionTextStyle,
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
                                        "₹495",
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
                                ),
                                SizedBox(height: 10.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                                  child: SmartRow(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                    decoration: BoxDecoration(color: Colors.yellow[100], borderRadius: BorderRadius.circular(4)),
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SmartText("₹354", style: style.maxSaverPriceTextStyle),
                                      SizedBox(width: 5.w),
                                      SmartText("MAXXSAVER PRICE", style: style.maxSaverTitleStyle),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 40.h,
                              padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide(color: style.greenColor),
                                  elevation: 2,
                                ),
                                onPressed: () => controller.addToCart(),
                                child: SmartText(
                                  "ADD",
                                  style: style.addButtonStyle,
                                  optionalPadding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14.h),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Highlights Section
                  Card(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                    child: SmartColumn(
                      children: [
                        SmartColumn(
                          width: Get.width,
                          padding: EdgeInsets.all(20.w),
                          color: Colors.white,
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
                                _buildHighlightRow("Box Contents", "1 x Daawat Basmati Rice - Rozana Super", style),
                                _buildDivider(),
                                _buildHighlightRow("Pack Size", "5kg", style),
                                _buildDivider(),
                                _buildHighlightRow("Source", "Product of India", style),
                                _buildDivider(),
                                _buildHighlightRow("Speciality", "Regional Rice", style),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Description Section
                  Card(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                    child: SmartColumn(
                      children: [
                        SmartColumn(
                          width: Get.width,
                          padding: EdgeInsets.all(20.w),
                          color: Colors.white,
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
                              "Experience the aromatic and versatile flavour of Daawat Basmati Rice Rozana Super. Perfect for creating gourmet dishes with superior quality.",
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
                              child: Row(
                                children: [
                                  Obx(() {
                                    return Text(
                                      controller.showFullDescription.value ? "- Show Less" : "+ Show More",
                                      style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 16),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // const SizedBox(height: 100), // Space for bottom cart bar
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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

  Widget _buildDivider() {
    return Divider(height: 1, thickness: 1, color: Colors.grey[300]);
  }

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
