import 'package:taza/taza.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).loginPageStyle;
    return Scaffold(
      backgroundColor: style.continueButtonBgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          bottom: false,
          child: !controller.isInitialLogin ? _buildInitialLoginWidget(context, style)
              :  _buildLoginWidget(context, style)
      ),
    );
  }

  void _showLoginBottomSheet(BuildContext context, LoginPageStyle style) {
    Utils.showSmartModalBottomSheet(
      context: context,
      isDismissible: false,
      barrierColor: Colors.transparent,
      sheetAnimationStyle: AnimationStyle(curve: Curves.easeInOut, duration: Duration(milliseconds: 500)),
      backgroundColor: style.loginPageBgColor,
      builder:
          (context) => LoginBottomSheet(),
    ).whenComplete((){
      controller.isExpanded.value = false;
    });
  }

  Widget _buildTextFieldWidget(LoginPageStyle style) {
    return SmartTextField(
      controller: controller.phoneController,
      prefixIcon: CountryCodePicker(
        onChanged: print,
        padding: EdgeInsetsDirectional.zero,
        textStyle: style.countryCodeTextStyle,
        initialSelection: 'IN',
        favorite: ['+91', 'IN'],
        showCountryOnly: false,
        showFlagDialog: true,
        alignLeft: false,
        flagWidth: 26.w,
        margin: EdgeInsetsDirectional.zero,
      ),
      prefixIconSize: 14,
      keyboardType: TextInputType.number,
      enabledBorderColor: style.continueButtonBgColor,
      inputDecorationLabelText: LocaleKeys.mobileNumber.tr,
      inputDecorationLabelStyle: style.lebelTextStyle,
      textInputFormatter: [
        FilteringTextInputFormatter.digitsOnly
      ],
      maxLength: 10,
      focusNode: controller.focusNode,
      style: style.countryCodeTextStyle,
      autofocus: true,
      customFocusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
              color: style.continueButtonBgColor)),
      contentPadding: EdgeInsetsDirectional.symmetric(
        horizontal: 10.w,
        vertical: 14.h,
      ),
      color: style.inputFieldBgColor,
    );
  }

  Widget _buildBottomWidgets(LoginPageStyle style, BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return AnimatedPadding(
      duration: Duration(milliseconds: 250),
      curve: Curves.easeOut,
      padding: EdgeInsetsDirectional.only(bottom: bottomInset),
      child: SmartColumn(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Obx((){
            return SmartButton(
              title: LocaleKeys.continueForLogin.tr.toUpperCase(),
              onTap: () {
                controller.navigateToOtpScreen();
              },
              isEnabled: controller.isPhoneValid.value,
              width: Get.width,
              disableTitleStyle: style.continueButtonTextStyle,
              disableBackgroudColor:
              style.continueButtonDisableBgColor,
              borderRadius: BorderRadius.circular(6.r),
              activeBackgroundColor:
              style.continueButtonBgColor,
              titleStyle: style.continueButtonTextStyle,
            );
          }),
          16.verticalSpace,
          TermsPrivacyWidget(),
          20.verticalSpace
        ],
      ),
    );
  }

  Widget _buildInitialLoginWidget(BuildContext context, LoginPageStyle style) {
    return SmartColumn(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SmartImage(
          width: 80.w,
          path: AppImages.icSplashLogo,
        ),
        10.verticalSpace,
        SmartText(
          optionalPadding: EdgeInsetsDirectional.symmetric(horizontal: 36.w),
          LocaleKeys.groceryDeliverTag.tr,
          style: style.tagTextStyle,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        12.verticalSpace,
        SmartImage(fit: BoxFit.fill, height: 130.h, width: 280.w, path: AppImages.icFood,),
        SmartColumn(
          expanded: true,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: style.loginPageBgColor,
          ),
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,
            SmartText(
              LocaleKeys.enterYourNumber.tr,
              style: style.accountTextStyle,
              textAlign: TextAlign.start,
            ),
            16.verticalSpace,
            _buildTextFieldWidget(style),
            Spacer(),
            _buildBottomWidgets(style, context),
          ],)
      ],
    );
  }

  Widget _buildLoginWidget(BuildContext context, LoginPageStyle style) {
    return SmartColumn(
      color: style.loginPageBgColor,
      children: [
        SmartColumn(
          color: style.continueButtonBgColor,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h,),
            SmartImage(width: 80.w, path: AppImages.icSplashLogo),
            SizedBox(height: 10.h),
            SmartText(
              optionalPadding: EdgeInsetsDirectional.symmetric(horizontal: 36.w),
              LocaleKeys.groceryDeliverTag.tr,
              style: style.tagTextStyle,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            SmartImage(fit: BoxFit.fill, height: 130.h, width: 280.w, path: AppImages.icFood,)
          ],
        ),
        SmartColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          children: [
            SizedBox(height: 20.h),
            SmartText(
              LocaleKeys.account.tr.toUpperCase(),
              style: style.accountTextStyle,
            ),
            SmartText(
              LocaleKeys.loginCreateAccount.tr,
              style: style.bottomTextStyle,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 16.h),
            SmartButton(
              title: LocaleKeys.login.tr.toUpperCase(),
              onTap: () {
                _showLoginBottomSheet(context, style);
              },
              width: Get.width,
              borderRadius: BorderRadius.zero,
              activeBackgroundColor: style.continueButtonBgColor,
              titleStyle: style.continueButtonTextStyle,
            ),
            SizedBox(height: 16.h),
            TermsPrivacyWidget(),
            SizedBox(height: 20.h),
            Divider(height: 2.0.h, color: style.dividerColor),
          ],
        ),
      ],
    );
  }
}