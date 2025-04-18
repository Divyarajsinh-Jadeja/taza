import 'package:taza/taza.dart';

class OtpVerificationPage extends GetView<OtpVerificationController> {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).otpPageStyle;
    final loginStyle = AppTheme.of(context).loginPageStyle;
    return Scaffold(
      backgroundColor: style.enterOtpButtonBgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: SmartColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SmartImage(width: 80.w, path: AppImages.icSplashLogo),
            10.verticalSpace,
            SmartText(
              optionalPadding: EdgeInsetsDirectional.symmetric(
                horizontal: 36.w,
              ),
              LocaleKeys.groceryDeliverTag.tr,
              style: loginStyle.tagTextStyle,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            12.verticalSpace,
            SmartImage(
              fit: BoxFit.fill,
              height: 130.h,
              width: 280.w,
              path: AppImages.icFood,
            ),
            SmartColumn(
              expanded: true,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: loginStyle.loginPageBgColor,
              ),
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.verticalSpace,
                SmartText(
                  LocaleKeys.enterOTP.tr,
                  style: loginStyle.accountTextStyle,
                  textAlign: TextAlign.start,
                ),
                4.verticalSpace,
                _otpPageBody(style),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _otpPageBody(OtpPageStyle style) {
    return SmartColumn(
      expanded: true,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartText(
          LocaleKeys.otpSentTo.tr.interpolate(["+91 6261212334"]),
          style: style.subTitlesTextStyle,
        ),
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
                ? LocaleKeys.otpRetryIn.tr.interpolate([
                  controller.secondsRemaining,
                ])
                : LocaleKeys.otpRetryNow.tr,
            style: style.subTitlesTextStyle,
          );
        }),
        SizedBox(height: 16.h),
        _buildBottomWidget(style),
      ],
    );
  }

  Widget _resendOption(OtpPageStyle style, String icon, String label) {
    return SmartRow(
      height: 48.h,
      width: 170.w,
      mainAxisAlignment: MainAxisAlignment.center,
      padding: EdgeInsetsDirectional.symmetric(vertical: 6.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color:
            controller.isTimerCompleted.value
                ? style.enterOtpButtonBgColor
                : style.enterOtpButtonDisableBgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      children: [
        SizedBox(width: 6.w),
        SmartText(
          label,
          style: style.verifyTextStyle.copyWith(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildOtpFields(OtpPageStyle style) {
    return OtpTextField(
      controller: controller.otpController,
      appContext: Get.context!,
      autoFocus: true,
      length: 6,
      keyboardType: TextInputType.number,
      onCompleted: (onSubmit) {
        controller.navigateToDashboardPage();
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textStyle: style.otpInputTextStyle,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12.r),
        fieldHeight: 48.w,
        fieldWidth: 48.w,
        activeColor: style.activeColor,
        inactiveColor: style.inactiveColor,
        selectedColor: style.selectedColor,
        errorBorderColor: style.errorBorderColor,
      ),
    );
  }

  Widget _buildBottomWidget(OtpPageStyle style) {
    return Obx(() {
      return SmartRow(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _resendOption(style, AppImages.icMessage, LocaleKeys.getViaSms.tr),
          _resendOption(style, AppImages.icCall, LocaleKeys.getViaCall.tr),
        ],
      );
    });
  }
}
