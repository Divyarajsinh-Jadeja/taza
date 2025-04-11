import 'package:taza/taza.dart';
import 'package:taza/ui/widgets/smart_delivery_tabbar.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).checkoutStyle;
    return Scaffold(
      backgroundColor: style.backgroundColor,
      body: SafeArea(
        child: SmartColumn(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 19.w, vertical: 20.h),
          children: [
            SmartColumn(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              width: Get.width,
              padding: EdgeInsetsDirectional.all(16.w),
              decoration: BoxDecoration(color: style.whiteColor, borderRadius: BorderRadius.all(Radius.circular(16.r))),
              children: [
                SmartRow(
                  children: [
                    Expanded(
                      child: SmartColumn(
                        children: [
                          SmartRow(
                            children: [
                              SmartImage(path: AppImages.icNonVeg, height: 16.w, width: 16.w),
                              SizedBox(width: 8.w),
                              SmartText("Family Bucket", style: style.titleStyle, maxLines: 1, overflow: TextOverflow.ellipsis),
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
                              SmartImage(path: AppImages.icArrowDown, height: 16.w, width: 16.w),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: SmartRow(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 32.h,
                            width: 80.w,
                            decoration: BoxDecoration(color: style.primaryColor, borderRadius: BorderRadius.all(Radius.circular(16.r))),
                          ),
                          SizedBox(width: 16.w),
                          SmartText("89 SAR", style: style.titleStyle),
                        ],
                      ),
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
                    SmartText(LocaleKeys.cookingRequest.tr, style: style.subCardTitleStyle),
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
              decoration: BoxDecoration(color: style.whiteColor, borderRadius: BorderRadius.all(Radius.circular(16.r))),
              children: [
                SmartRow(children: [SmartText("Saving Corner", style: style.subCardTitleStyle)]),
                SizedBox(height: 16.h),
                SmartRow(
                  children: [
                    SmartImage(path: AppImages.icSaveTag, width: 16.w, height: 16.w),
                    SizedBox(width: 8.w),
                    SmartText("10 SAR saved with ‘Save 10’", style: style.savingTitleStyle),
                    Spacer(),
                    Icon(Icons.check, color: style.greenColor, size: 16.w),
                    SizedBox(width: 4.w),
                    SmartText("Applied", style: style.appliedTextStyle),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            Flexible(
              child: Container(
                decoration: BoxDecoration(color: style.whiteColor, borderRadius: BorderRadius.all(Radius.circular(16.r))),
                //height: 182.h,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 16.w),
                child: SmartDeliveryTabBar(
                  onDeliveryTypeChanged: (int selectedType) {
                    print("Selected Delivery Type: $selectedType");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
