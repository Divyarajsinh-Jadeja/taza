import 'package:dartz/dartz.dart' as product;
import 'package:taza/taza.dart';
import 'package:taza/ui/subscription/components/schedule_button.dart';
import 'package:taza/ui/subscription/view/product_subscription_controller.dart';

class ProductSubscribePage extends GetView<ProductSubscriptionController> {
  const ProductSubscribePage({super.key});

  @override
  Widget build(BuildContext context) {
    final InstamartProductModel model = Get.arguments as InstamartProductModel;
    final loginStyle = AppTheme.of(context).loginPageStyle;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: loginStyle.lightGrayBgColor,
        appBar: SmartAppBar(title: 'Subscribe', isBack: true),
        body: SmartSingleChildScrollView(
          child: SmartColumn(
            color: loginStyle.lightGrayBgColor,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmartRow(
                decoration: BoxDecoration(
                  color: loginStyle.loginPageBgColor,
                  boxShadow: [
                    BoxShadow(
                      color: (const Color.fromRGBO(
                        178,
                        189,
                        194,
                        0.25,
                      )).withValues(alpha: 0.4),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                children: [
                  Hero(
                    tag: 'product_${product.id}',
                    child: SmartImage(
                      size: 80.w,
                      margin: EdgeInsetsDirectional.only(
                        start: 10.w,
                        bottom: 16.h,
                        top: 16.h,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: (const Color.fromRGBO(
                              178,
                              189,
                              194,
                              0.25,
                            )).withValues(alpha: 0.4),
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                        color: loginStyle.loginPageBgColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      clipBehavior: Clip.antiAlias,
                      path: model.imageUrl,
                      width: 80.w,
                      height: 80.w,
                      fit: BoxFit.cover,
                      imageBorderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: SmartColumn(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmartText(
                          model.name,
                          style: loginStyle.accountTextStyle.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                        SmartText('250 ml Carton'),
                        SizedBox(height: 4.w),
                        SmartRow(
                          children: [
                            SmartText(
                              (model.price - 2.00).toCurrencyCodeFormat(),
                              style: loginStyle.accountTextStyle.copyWith(fontSize: 14.sp),
                            ),
                            SizedBox(width: 8.w),
                            SmartText(
                              model.price.toCurrencyCodeFormat(),
                              decoration: TextDecoration.lineThrough,
                              style: loginStyle.bottomTextStyle.copyWith(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 16.0),
                    child: InstamartQuantityWidget(model: model),
                  ),
                ],
              ),
              SizedBox(height: 4.h,),
              SmartColumn(
                width: Get.width,
                margin: EdgeInsetsDirectional.all(10.w),
                padding: EdgeInsetsDirectional.only(bottom: 10.h),
                crossAxisAlignment: CrossAxisAlignment.start,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: (const Color.fromRGBO(
                        178,
                        189,
                        194,
                        0.25,
                      )).withValues(alpha: 0.4),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                  color: loginStyle.loginPageBgColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                children: [
                  SmartText(
                    'Pick Schedule',
                    style: loginStyle.lebelTextStyle,
                    optionalPadding: EdgeInsetsDirectional.symmetric(horizontal :16.w, vertical: 12.h),
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(start: 8.0),
                    child: Wrap(
                      children: [
                        ScheduleButton(
                          label: 'Daily',
                          onTap: (){
                            controller.openCalendar(loginStyle, context);
                          },
                        ),
                        ScheduleButton(label: 'Alternate Day',
                          onTap: (){
                            controller.openCalendar(loginStyle, context);
                          },),
                        ScheduleButton(label: 'Every 3 days',
                          onTap: (){
                            controller.openCalendar(loginStyle, context);
                          },),
                        ScheduleButton(label: 'Weekly',
                          onTap: (){
                          controller.showSelectDeliveryDaysBottomSheet(context, loginStyle);
                          },),
                        ScheduleButton(label: 'Monthly',
                          onTap: (){
                          showSelectDeliveryMonthBottomSheet(context, loginStyle, controller);
                          },),
                      ],
                    ),
                  ),
                  Obx((){
                    if(controller.selectedDate.value.isNotEmpty){
                      return SmartColumn(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(top: 8.h),
                              child: Divider(height: 1.h),
                            ),
                            ListTile(
                              contentPadding: EdgeInsetsDirectional.zero,
                              leading: Padding(
                                padding: EdgeInsetsDirectional.only(start: 10.w),
                                child: Icon(Icons.calendar_month_outlined, size: 30.w),
                              ),
                              title: SmartText('Subscription Start Date', style: loginStyle.bottomTextStyle),
                              subtitle: SmartText(controller.selectedDate.value, style: loginStyle.termsAndPrivacyTextStyle),
                              trailing: Padding(
                                padding: EdgeInsetsDirectional.only(end: 8.0.w),
                                child: Icon(Icons.keyboard_arrow_down),
                              ),
                              onTap: () {
                                controller.openCalendar(loginStyle, context);
                              },
                            ),
                          ]);
                    }
                    return SizedBox.shrink();

                  })
                ],
              ),
              SizedBox(height: 6.h),
              Container(
                margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: loginStyle.loginPageBgColor,
                  borderRadius: BorderRadius.circular(6.r),
                  boxShadow: [
                    BoxShadow(
                      color: (const Color.fromRGBO(
                        178,
                        189,
                        194,
                        0.25,
                      )).withValues(alpha: 0.4),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: EdgeInsetsDirectional.zero,
                  leading: SmartImage(
                    path: AppImages.imgSubscribeCoupon,
                    margin: EdgeInsetsDirectional.zero,
                  ),
                  title: SmartText('Apply coupons', style: loginStyle.lebelTextStyle,),
                  subtitle: SmartText('1 discount coupons available'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 6.h),
              SmartColumn(
                width: Get.width,
                margin: EdgeInsetsDirectional.all(10.w),
                padding: EdgeInsetsDirectional.all(10.h),
                crossAxisAlignment: CrossAxisAlignment.start,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: (const Color.fromRGBO(
                        178,
                        189,
                        194,
                        0.25,
                      )).withValues(alpha: 0.4),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                  color: loginStyle.loginPageBgColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                children: [
                  SmartText(
                    'Terms and Conditions',
                    style: loginStyle.lebelTextStyle,
                  ),
                  SizedBox(height: 10),
                  SmartText(
                    '🛍️ Subscription charges may change per market changes.',
                    style: loginStyle.bottomTextStyle.copyWith(color: loginStyle.dividerColor, fontSize: 11.sp),
                  ),
                  SizedBox(height: 8),
                  SmartText(
                    '💲No delivery charges on all groceries except Mumbai city. Delivery charge is applicable on all milk subscriptions and buy once orders. If your milk order contains a grocery item, no delivery charge. All your items are delivered together for the day, you will be charged only once per day.',
                    style: loginStyle.bottomTextStyle.copyWith(color: loginStyle.dividerColor,  fontSize: 11.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar:
        Obx((){
          if(controller.selectedDate.value.isNotEmpty){
            return SmartColumn(
                height: 123.h,
                children: [
                  _buildAddressTile(loginStyle),
                  _buildBottomView(loginStyle)
                ]);
          }
          return SizedBox(height: 1,);
        })
      ),
    );
  }

  Widget _buildAddressTile(LoginPageStyle style) {
    return SmartColumn(
      width: Get.width,
      spacing: 4.h,
      padding: EdgeInsetsDirectional.all(8.w),
      color: style.loginPageBgColor,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartRow(
          spacing: 8.w,
          children: [
            Icon(CupertinoIcons.location_fill, color: style.continueButtonDisableBgColor, size: 18.w,),
            SmartText(
              "Delivery Address",
              style: style.bottomTextStyle.copyWith(fontSize: 12.sp),
              maxLines: 1,
            ),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_down_sharp,
              color: style.dividerColor,
            ),
          ],
        ),
        SmartText(
          "1600 Amphitheatre Parkway, Mountain View, CA 94043",
          style: style.countryCodeTextStyle.copyWith(fontSize: 13.sp),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildBottomView(LoginPageStyle loginStyle) {
    return SmartColumn(
        onTap: () {},
        height: 60.h,
        width: Get.width,
        mainAxisAlignment: MainAxisAlignment.center,
        decoration: BoxDecoration(
          color: loginStyle.continueButtonBgColor,
          borderRadius: BorderRadius.circular(0.r),
        ),
        children: [
          SmartText("Start Subscription", style: loginStyle.continueButtonTextStyle,),
          SmartText("From ${controller.selectedDate.value}", style: loginStyle.continueButtonTextStyle,)
        ]);
  }

  void showSelectDeliveryMonthBottomSheet(
      BuildContext context,
      LoginPageStyle loginStyle, ProductSubscriptionController controller,
      ) {
    Utils.showSmartModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(6.r)),
      ),
      builder: (context) {
        return Obx((){
          return SmartSingleChildScrollView(
            child: SmartColumn(
              padding: EdgeInsetsDirectional.only(
                start: 16.w,
                end: 16.w,
                bottom: 16.h,
              ),
              width: Get.width,
              decoration: BoxDecoration(
                color: loginStyle.loginPageBgColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                SmartText(
                  'Select Delivery Days',
                  style: loginStyle.bottomTextStyle,
                ),
                SizedBox(height: 12.h),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.monthDates.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7, // 7 columns for calendar
                    crossAxisSpacing: 8.w,
                    mainAxisSpacing: 8.h,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (_, index) {
                    final date = controller.monthDates[index];
                    final isSelected = controller.selectedDeliveryDates.contains(date);
                    return GestureDetector(
                      onTap: () => controller.toggleDeliveryDate(date),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:
                          isSelected
                              ? loginStyle.continueButtonBgColor
                              : loginStyle.loginPageBgColor,
                          border: Border.all(
                            color:
                            isSelected
                                ? loginStyle.continueButtonBgColor
                                : loginStyle.continueButtonDisableBgColor,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: SmartText(
                          '${date.day}',
                          style: loginStyle.countryCodeTextStyle.copyWith(
                            color:
                            isSelected ? loginStyle.loginPageBgColor : null,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SmartColumn(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: loginStyle.continueButtonDisableBgColor,
                    ),
                  ),
                  children: [
                    ListTile(
                      contentPadding: EdgeInsetsDirectional.zero,
                      leading: Padding(
                        padding: EdgeInsetsDirectional.only(start: 10.w),
                        child: Icon(Icons.calendar_month_outlined, size: 30.w),
                      ),
                      title: SmartText(
                        'Subscription Start Date',
                        style: loginStyle.bottomTextStyle,
                      ),
                      subtitle: SmartText(
                        DateTime.now().dateToStringFormat(
                          outputDateFormat: DateFormatter.dateFormatDDMMMMYYYY,
                        ),
                        style: loginStyle.termsAndPrivacyTextStyle,
                      ),
                      trailing: Padding(
                        padding: EdgeInsetsDirectional.only(end: 8.0.w),
                        child: Icon(Icons.keyboard_arrow_down),
                      ),
                      onTap: () {
                        controller.openCalendar(loginStyle, context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                SmartButton(
                  title: 'Submit',
                  borderRadius: BorderRadius.circular(12.r),
                  onTap: () {
                    // Validate and use selectedDeliveryDates
                    print('Selected Dates: ${controller.selectedDeliveryDates}');
                    Get.back();
                  },
                ),
              ],
            ),
          );
        });
      },
    );
  }

}
