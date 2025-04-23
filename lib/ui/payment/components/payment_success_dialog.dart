import 'package:taza/taza.dart';

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final style = theme.rewardDialogStyle;

    return Center(
      child: Dialog(
        child: SmartColumn(
          width: 300.w,
          decoration: BoxDecoration(
            color: style.backgroundColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w,),
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.h,),
            /*SmartImage(
              path: AppImages.icClose,
              onTap: () => Get.back(),
              alignment: AlignmentDirectional.topEnd,
            ),*/
            SmartImage(path: AppImages.imgPaymentSuccess, size: 150.w),
            /// TODO : below string will chane and come from api
            SmartText("Payment Successful", style: style.highlightTextStyle),
            SizedBox(height: 12.h),
            SmartText(
              "You've earned 100 SAR in rewards!",
              style: style.highlightTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            SmartRow(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
              SmartText("Your order is on the way!", style: style.subtitleTextStyle,),
              SmartImage(path: AppImages.deliveryLottie , size: 30,)
            ]),
            SizedBox(height: 16.h),
            SmartText("Order More", style: style.celebrateTextStyle, onTap: (){Get.offAllNamed(AppRoutes.dashboardPage);},),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
