import 'package:taza/taza.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).loginPageStyle;
    return Scaffold(
      body: Container(
        color: style.continueButtonBgColor,
        child: SafeArea(
          bottom: false,
          child: SmartAnimator(
            animateSlideX: true,
            slideXBegin: const Offset(-1.0, 0.0),
            slideEnd: Offset.zero,
            animateFadeIn: true,
            animationDuration: const Duration(milliseconds: 300),
            animationDelay: const Duration(milliseconds: 10),
            animationCurve: Curves.easeOut,
            child: SmartColumn(
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
                      // textAlign: TextAlign.start,
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
                      width: double.infinity,
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
            ),
          ),
        ),
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
}
