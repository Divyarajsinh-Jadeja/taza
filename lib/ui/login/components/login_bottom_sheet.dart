import 'dart:ui';
import 'package:taza/taza.dart';

class LoginBottomSheet extends GetView<LoginController> {
  const LoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).loginPageStyle;
    return SafeArea(
      child: Obx(
        () => ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: SmartColumn(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [
                    style.loginPageBgColor.withValues(alpha: 0.3),
                    Colors.transparent,
                    style.loginPageBgColor.withValues(alpha: 0.05),
                  ],
                ),
              ),
              crossAxisAlignment: CrossAxisAlignment.start,
              height:
                  controller.isExpanded.value
                      ? Get.height
                      : 500.h,
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
              children: [
                SizedBox(height: 20.h),
                SmartText(
                  LocaleKeys.login.tr.toUpperCase(),
                  style: style.accountTextStyle,
                  textAlign: TextAlign.start,
                ),
                SmartText(
                  LocaleKeys.enterNumberToProceed.tr,
                  style: style.bottomTextStyle,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 16.h),
                SmartTextField(
                  controller: controller.phoneController,
                  prefixIcon: CountryCodePicker(
                    onChanged: print,
                    textStyle: style.countryCodeTextStyle,
                    initialSelection: 'IN',
                    favorite: ['+91', 'IN'],
                    padding: EdgeInsetsDirectional.zero,
                    showCountryOnly: false,
                    showFlagDialog: true,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                  keyboardType: TextInputType.phone,
                  hintText: LocaleKeys.enterPhoneNumber.tr,
                  maxLength: 10,
                  focusNode: controller.focusNode,
                  style: style.countryCodeTextStyle,
                  autofocus: false,
                  borderRadius: BorderRadius.circular(6.r),
                  contentPadding: EdgeInsetsDirectional.symmetric(
                    horizontal: 10.w,
                    vertical: 14.h,
                  ),
                  color: style.inputFieldBgColor,
                ),
                SizedBox(height: 24.h),
                SmartButton(
                  title: LocaleKeys.continueForLogin.tr.toUpperCase(),
                  onTap: () {
                    if (controller.isPhoneValid.value) {
                      Get.offNamed(AppRoutes.dashboardPage);
                    }
                  },
                  isEnabled: controller.isPhoneValid.value,
                  width: Get.width,
                  disableTitleStyle: style.continueButtonTextStyle,
                  disableBackgroudColor: style.continueButtonDisableBgColor,
                  borderRadius: BorderRadius.circular(6.r),
                  activeBackgroundColor: style.continueButtonBgColor,
                  titleStyle: style.continueButtonTextStyle,
                ),
                SizedBox(height: 16.h),
                TermsPrivacyWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
