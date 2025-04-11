import 'package:taza/taza.dart';
import 'package:taza/ui/widgets/smart_delivery_tabbar.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).checkoutStyle;
    final quantityController = Get.put(QuantityController())..initializeQuantities(1);

    return Scaffold(
      backgroundColor: style.backgroundColor,
      /// TODO: appbar need to change
      appBar: SmartAppBar(),
      body: SafeArea(
        child: SmartColumn(
          padding: EdgeInsetsDirectional.all(20.w),
          children: [
            SmartColumn(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              width: Get.width,
              padding: EdgeInsetsDirectional.all(16.w),
              decoration: style.cardDecoration,
              children: [
                SmartRow(
                  children: [
                    SmartColumn(
                      expanded: true,
                      children: [
                        SmartRow(
                          children: [
                            SmartImage(
                              path: AppImages.icNonVeg,
                              height: 16.w,
                              width: 16.w,
                            ),
                            SizedBox(width: 8.w),
                            SmartText(
                              "Family Bucket",
                              style: style.titleStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        SmartRow(
                          children: [
                            Flexible(
                              child: SmartText(
                                "12 pieces broast, 6 pieces bread,3 coleslaw,6 garlic sauce, 1 ltr Pepsi, family fries",
                                style: style.subTitleStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            SmartImage(
                              path: AppImages.icArrowDown,
                              height: 16.w,
                              width: 16.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 12.w),
                    SmartRow(
                      isExpanded: true,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SmartAnimatedQuantity(
                          index: 0,
                          model: FoodModel(
                              name: 'Family Bucket',
                              imageUrl: 'https://i.ibb.co/whRS5nY7/b.jpg',
                              rating: 4.2,
                              reviewsCount: 1200,
                              deliveryTime: '30-35 min',
                              price: 89.0,
                              quantity: 1
                          ),
                        ),
                        SizedBox(width: 16.w),
                        SmartText("89 SAR", style: style.titleStyle),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                SmartRow(
                  height: 32.h,
                  padding: EdgeInsetsDirectional.only(start: 8.w, end: 12.w),
                  mainAxisSize: MainAxisSize.min,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    border: Border.all(color: style.requestColor),
                  ),
                  children: [
                    SmartImage(path: AppImages.icEditPen),
                    SizedBox(width: 4.w),
                    SmartText(
                      LocaleKeys.cookingRequest.tr,
                      style: style.subCardTitleStyle,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            SmartColumn(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              width: Get.width,
              padding: EdgeInsetsDirectional.all(16.w),
              decoration: style.cardDecoration,
              children: [
                SmartRow(
                  children: [
                    SmartText(LocaleKeys.savingCorner.tr, style: style.subCardTitleStyle),
                  ],
                ),
                SizedBox(height: 16.h),
                SmartRow(
                  children: [
                    SmartImage(
                      path: AppImages.icSaveTag,
                      width: 16.w,
                      height: 16.w,
                    ),
                    SizedBox(width: 8.w),
                    SmartText(
                      "10 SAR saved with ‘Save 10’",
                      style: style.savingTitleStyle,
                    ),
                    Spacer(),
                    Icon(Icons.check, color: style.greenColor, size: 16.w),
                    SizedBox(width: 4.w),
                    SmartText(LocaleKeys.applied.tr, style: style.appliedTextStyle),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                color: style.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
              ),
              //height: 182.h,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 16.w,
                vertical: 16.w,
              ),
              child: SmartDeliveryTabBar(
                onDeliveryTypeChanged: (int selectedType) {
                  printWrapped("Selected Delivery Type: $selectedType");
                },
              ),
            ),
            20.verticalSpace,
            SmartColumn(
              decoration: style.cardDecoration,
              padding: EdgeInsetsDirectional.all(16.w),
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.h,
              children: [
                SmartRow(
                  spacing: 8.w,
                  children: [
                    SmartImage(
                      path: AppImages.icDoc,
                      height: 20.w,
                      width: 20.w,
                    ),
                    Expanded(
                      child: SmartRichText(
                        spans: [
                          SmartTextSpan(
                            text: "${LocaleKeys.toPayPrefix.tr} ",
                            style: style.toPayTitleStyle,
                          ),
                          SmartTextSpan(
                            text: "89 SAR",
                            style: style.toPayTitleDiscountedStyle,
                          ),
                          SmartTextSpan(
                            text: " 79 SAR",
                            style: style.toPayTitleStyle,
                          ),
                        ],
                      ),
                    ),
                    SmartImage(
                      path: AppImages.icArrowDropDown,
                      height: 16.w,
                      width: 16.w,
                    ),
                  ],
                ),
                SmartText(
                  "10 SAR saved on the total!",
                  style: style.appliedTextStyle.copyWith(fontSize: 11.sp),
                  optionalPadding: EdgeInsetsDirectional.only(start: 28.w),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SmartRow(
        height: 88.h,
        decoration: BoxDecoration(color: style.whiteColor),
        padding: EdgeInsetsDirectional.only(
          top: 16.h,
          bottom: 26.h,
          start: 19.w,
          end: 19.w,
        ),
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmartColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4.h,
            expanded: true,
            children: [
              SmartRow(
                spacing: 4.w,
                children: [
                  SmartText(LocaleKeys.payUsing.tr, style: style.payUsingTextStyle),
                  SmartImage(path: AppImages.icArrowUp, size: 16.w),
                ],
              ),
              SmartText(LocaleKeys.payPal.tr, style: style.paymentTextStyle),
            ],
          ),
          Expanded(child: SmartButton(onTap: () {}, title: "Pay 79 SAR")),
        ],
      ),
    );
  }
}
