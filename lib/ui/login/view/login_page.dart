import 'package:taza/taza.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).loginPageStyle;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(color: style.loginPageBgColor),
          child: SafeArea(
            child: SmartAnimator(
              animateSlideX: true,
              slideXBegin: const Offset(-1.0, 0.0),
              slideEnd: Offset.zero,
              animateFadeIn: true,
              animationDuration: const Duration(milliseconds: 300),
              animationDelay: const Duration(milliseconds: 10),
              animationCurve: Curves.easeOut,
              child: SmartColumn(
                expanded: true,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: SmartButton(
                      height: 38.h,
                      width: 95.w,
                      title: LocaleKeys.skip.tr,
                      onTap: () {
                        Get.offNamed(AppRoutes.dashboardPage);
                      },
                      activeBackgroundColor: style.skipButtonBgColor,
                      titleStyle: style.skipButtonTextStyle,
                      suffixImage: Get.locale?.languageCode == 'ar'? AppImages.icArrowLeft : AppImages.icArrowRight,
                      imageSize: 16.h,
                      activeImageColor: style.inputFieldBgColor,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SmartColumn(
                    expanded: true,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: SmartImage(
                          width: 160.w,
                          path: AppImages.icSplashLogo,
                        ),
                      ),
                      SizedBox(height: 22.h),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: SmartText(
                          LocaleKeys.groceryDeliverTag.tr,
                          style: style.tagTextStyle,
                          textAlign: TextAlign.start),
                      ),
                      SizedBox(height: 22.h),
                      Obx((){
                        return SmartTextField(
                          controller: controller.phoneController,
                          prefixIcon: CountryCodePicker(
                            onChanged: print,
                            textStyle: style.countryCodeTextStyle,
                            initialSelection: 'IN',
                            favorite: ['+91','IN'],
                            padding: EdgeInsetsDirectional.zero,
                            showCountryOnly: false,
                            showFlag: false,
                            showFlagDialog: true,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                          keyboardType: TextInputType.phone,
                          hintText: LocaleKeys.enterPhoneNumber.tr,
                          maxLength: 13,
                          style: style.countryCodeTextStyle,
                          borderRadius: BorderRadius.circular(30.r),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                          color: style.inputFieldBgColor,
                          errorText: controller.errorText.value,
                          errorStyle: style.errorTextStyle,
                        );
                      }),
                      SizedBox(height: 24.h),
                      SmartButton(
                        title: LocaleKeys.continueForLogin.tr,
                        onTap: () {
                          if (controller.validatePhone()) {
                            Get.offNamed(AppRoutes.dashboardPage);
                          }
                        },
                        width: double.infinity,
                        borderRadius: BorderRadius.circular(30.r),
                        activeBackgroundColor: style.continueButtonBgColor,
                        titleStyle: style.continueButtonTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SmartColumn(
        color: style.loginPageBgColor,
        padding: EdgeInsetsDirectional.only(bottom: 10.h),
        mainAxisSize: MainAxisSize.min,
        children: [
          SmartRichText(
            textAlign: TextAlign.center,
            spans: [
              SmartTextSpan(
                text: LocaleKeys.byContinueTerms.tr,
                style: style.bottomTextStyle,
              ),
              SmartTextSpan(
                text: "\n${LocaleKeys.termsOfUse.tr}",
                style: style.termsAndPrivacyTextStyle,
              ),
              SmartTextSpan(
                text: " & ",
                style: style.bottomTextStyle,
              ),
              SmartTextSpan(
                text: LocaleKeys.privacyPolicy.tr,
                style: style.termsAndPrivacyTextStyle,
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
