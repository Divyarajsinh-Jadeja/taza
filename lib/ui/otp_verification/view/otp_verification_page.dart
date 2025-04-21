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
        child: !controller.isInitialLogin ?
        _buildInitialOtpBodyWidget(context, style, loginStyle)
         : _buildOtpBodyWidget(context, style, loginStyle)
      ),
    );
  }

  Widget _otpPage2Header(OtpPageStyle style) {
    return SmartColumn(
      width: Get.height,
      height: 145.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: EdgeInsetsDirectional.all(16.w),
      color: style.headerCardColor,
      children: [
        SmartImage(
          onTap: () {
            Get.back();
          },
          path: AppImages.icArrowLeft,
          padding: EdgeInsetsDirectional.symmetric(vertical: 6.h),
        ),
        SmartRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmartColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmartText(
                  LocaleKeys.verifyDetails.tr.toUpperCase(),
                  style: style.verifyTextStyle,
                ),
                SizedBox(height: 4.h),
                SmartText(
                  LocaleKeys.otpSentTo.tr.interpolate(["+91-6261212334"]),
                  style: style.subTitlesTextStyle,
                ),
              ],
            ),
            SmartImage(path: AppImages.imgOtp, height: 65.h, width: 85.w),
          ],
        ),
      ],
    );
  }

  Widget _otpPage2Body(OtpPageStyle style) {
    return SmartColumn(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartText(
          LocaleKeys.enterOTP.tr.toUpperCase(),
          style: style.subTitlesTextStyle,
        ),
        SizedBox(height: 12.h),
        _buildOtpFields2(style),
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
        Obx(() {
          return controller.isTimerCompleted.value
              ? SmartRow(
            children: [
              _resendOption2(
                style,
                AppImages.icMessage,
                LocaleKeys.sms.tr.toUpperCase(),
              ),
              SizedBox(width: 20.w),
              _resendOption2(
                style,
                AppImages.icCall,
                LocaleKeys.call.tr.toUpperCase(),
              ),
            ],
          )
              : SizedBox();
        }),
        SizedBox(height: 26.h),
        Obx(() {
          return SmartButton(
            onTap: () {
              if (controller.isOtpValid.value) {
                controller.navigateToDashboardPage();
              }
            },
            title:
            controller.isOtpValid.value
                ? LocaleKeys.verifyAndProceed.tr.toUpperCase()
                : LocaleKeys.enterOTP.tr.toUpperCase(),
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

  Widget _resendOption2(OtpPageStyle style, String icon, String label) {
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

  Widget _buildOtpFields2(OtpPageStyle style) {
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

  Widget _otpPageBody(OtpPageStyle style) {
    final bottomInset = MediaQuery.of(Get.context!).viewInsets.bottom;
    return AnimatedPadding(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      padding: EdgeInsetsDirectional.only(bottom: bottomInset),
      child: SmartColumn(
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
      ),
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
          isExpanded: true,
          overflow: TextOverflow.ellipsis,
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

  Widget _buildInitialOtpBodyWidget(BuildContext context, OtpPageStyle style, LoginPageStyle loginStyle) {
    return SmartColumn(
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
    );
  }

  Widget _buildOtpBodyWidget(BuildContext context, OtpPageStyle style, LoginPageStyle loginStyle) {
    return SmartColumn(
      color: style.otpPageBgColor,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _otpPage2Header(style),
        SizedBox(height: 24.h),
        _otpPage2Body(style),
      ],
    );
  }
}
