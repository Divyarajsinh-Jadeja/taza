import 'package:taza/taza.dart';

class OtpVerificationPage extends GetView<OtpVerificationController> {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).otpPageStyle;
    return Scaffold(
      backgroundColor: style.enterOtpButtonBgColor,
      body: SafeArea(
        bottom: false,
        child: SmartColumn(
          color: style.otpPageBgColor,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _otpPageHeader(style),
            SizedBox(height: 24.h),
            _otpPageBody(style),
          ],
        ),
      ),
    );
  }

  Widget _otpPageHeader(OtpPageStyle style) {
    return SmartColumn(
      width: Get.height,
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: EdgeInsetsDirectional.all(16.w),
      color: style.headerCardColor,
      children: [
        SmartImage(onTap: (){ Get.back(); },path: AppImages.icArrowLeft, padding: EdgeInsetsDirectional.symmetric(vertical: 6.h)),
        SmartRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmartColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmartText(
                  LocaleKeys.verifyDetails.tr.toUpperCase(),
                  style: style.verifyTextStyle
                ),
                SizedBox(height: 4.h),
                SmartText(
                  LocaleKeys.otpSentTo.tr.interpolate(["+91-6261212334"]),
                  style: style.subTitlesTextStyle,
                ),
              ],
            ),
            SmartImage(path: AppImages.imgOtp, height: 65.h, width: 85.w,),
          ],
        ),
      ],
    );
  }

  Widget _otpPageBody(OtpPageStyle style) {
    return SmartColumn(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartText(LocaleKeys.enterOTP.tr.toUpperCase(), style: style.subTitlesTextStyle),
        SizedBox(height: 12.h),
        _buildOtpFields(style),
        Obx(() {
          return controller.errorText.value != null
              ? SmartText(
            controller.errorText.value!,
            style: style.errorTextStyle,
          )
              : SizedBox();
        }),
        SizedBox(height: 20.h),
        Obx(() {
          return SmartText(
            !controller.isTimerCompleted.value
                ? LocaleKeys.otpRetryIn.tr.interpolate([controller.secondsRemaining])
                : LocaleKeys.otpRetryNow.tr,
            style: style.subTitlesTextStyle,
          );
        }),
        SizedBox(height: 16.h),
        Obx(() {
          return controller.isTimerCompleted.value
              ? SmartRow(children: [
            _resendOption(style, AppImages.icMessage, LocaleKeys.sms.tr.toUpperCase()),
            SizedBox(width: 20.w),
            _resendOption(style, AppImages.icCall, LocaleKeys.call.tr.toUpperCase()),
          ])
              : SizedBox();
        }),
        SizedBox(height: 26.h),
        Obx((){
          return SmartButton(
            onTap: () {
              if (controller.isOtpValid.value) {
                if (controller.otpController.text.trim() == "123456") {
                  controller.errorText.value = null;
                  Get.offNamed(AppRoutes.dashboardPage);
                } else {
                  controller.errorText.value = LocaleKeys.otpInvalid.tr;
                }
              }
            },
            title: controller.isOtpValid.value ? LocaleKeys.verifyAndProceed.tr.toUpperCase() : LocaleKeys.enterOTP.tr.toUpperCase(),
            width: double.infinity,
            disableTitleStyle: style.enterOtpButtonTextStyle,
            isEnabled: controller.isOtpValid.value,
            borderRadius: BorderRadius.circular(8.r),
            activeBackgroundColor: style.enterOtpButtonBgColor,
            disableBackgroudColor: style.enterOtpButtonDisableBgColor,
            titleStyle: style.enterOtpButtonTextStyle,
          );
        }),

      ],
    );
  }

  Widget _resendOption(OtpPageStyle style, String icon, String label) {
    return SmartRow(
      mainAxisAlignment: MainAxisAlignment.center,
      padding: EdgeInsetsDirectional.symmetric(vertical: 6.h, horizontal: 10.w),
      decoration: style.callBoxDecoration,
      children: [
        SmartImage(path: icon, size: 24.w),
        SizedBox(width: 6.w),
        SmartText(label, style: style.callBoxTitleStyle),
      ],
    );
  }

  Widget _buildOtpFields(OtpPageStyle style) {
    return OtpTextField(
      controller: controller.otpController,
      appContext: navigator!.context,
      autoFocus: true,
      length: 6,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textStyle: style.otpInputTextStyle,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.underline,
        fieldHeight: 48.h,
        fieldWidth: 40.w,
        activeColor: style.activeColor,
        inactiveColor: style.inactiveColor,
        selectedColor: style.selectedColor,
        errorBorderColor: style.errorBorderColor,
        borderWidth: 2.w,
      ),
    );
  }
}
