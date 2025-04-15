import 'package:taza/taza.dart';


class CouponsPage extends GetView<CouponsController> {
  const CouponsPage({super.key});
  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).checkoutStyle;
    return Scaffold(
      backgroundColor: style.backgroundColor,
      // TODO: appbar need to change
      appBar: AppBar(title:Text(LocaleKeys.coupons.tr)),
      body: ListView.builder(
        itemCount: controller.coupons.length,
        itemBuilder: (context, index) {
          final coupon = controller.coupons[index];
          return Obx(() {
            final isSelected = controller.selected.value == coupon;
            return Container(
              decoration: isSelected ? style.couponsSelectedDecoration : style.couponsUnSelectedDecoration,
              margin: EdgeInsetsDirectional.symmetric(vertical: 10.h,horizontal: 15.w),
              child: InkWell(
                onTap: () => controller.selectCoupon(coupon),
                child: ListTile(
                  contentPadding:  EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 8.h),
                  trailing: Icon(
                    isSelected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off,
                    color: isSelected ? style.primaryColor : style.whiteColor,
                  ),
                  title: SmartText(
                    coupon,
                    style: style.savingTitleStyle,
                    animator: SmartAnimator(
                      animateFade: true,
                      animateSlideX: true,
                      animationDuration: 300.ms,
                      animationDelay: 600.ms,
                      animationCurve: Curves.decelerate,
                    ),
                  ),
                  subtitle: SmartText(
                    "Save 70% with this code",
                    style: style.subCardTitleStyle,
                    animator: SmartAnimator(
                      animateFade: true,
                      animateSlideX: true,
                      animationDuration: 300.ms,
                      animationDelay: 500.ms,
                    ),
                  ),
                  leading: SmartImage(path: AppImages.couponLottie,size: 40.w,animator: SmartAnimator(
                    animateFade: true,
                    animateScale: true,
                    animationDelay: 400.ms,
                    animationDuration: 400.ms,
                  ),),
                ),
              ),
            );
          });
        },
      ),
      bottomNavigationBar: Obx(() {
        return controller.selected.value.isNotEmpty?SmartColumn(
          height: 100.h,
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
            SmartButton(onTap: () {Get.back();}, title: LocaleKeys.tapToApply.tr,animator: SmartAnimator(
              animateSlideY: true,
              slideYBegin: const Offset(0, 2),
              slideEnd: Offset.zero,
              animationDelay: 200.ms,
              animationDuration: 600.ms,
              animationCurve: Curves.easeInOutCubic,
            ),),
          ],
        ):SizedBox();
      }),
    );
  }
}
