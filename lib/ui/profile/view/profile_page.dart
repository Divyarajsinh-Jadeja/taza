import 'package:taza/taza.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).profilePageStyle;
    return Scaffold(
      appBar: SmartAppBar(),
      body: SmartColumn(
        height: Get.height,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
        spacing: 4.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SmartText("Alex Hemsworth", style: style.nameTitleStyle),
          SmartText(
            "+91 9898989898  .  hey@gmail.com",
            style: style.subTitleStyle,
          ),
          SmartRow(
            children: [
              SmartText(LocaleKeys.editProfile.tr, style: style.primaryStyle),
              Icon(
                Icons.keyboard_arrow_right_rounded,
                color: style.primaryColor,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(),
          SizedBox(height: 5.h),
          _buildTile(
            style: style,
            title: LocaleKeys.couponCodeTitle.tr,
            subTitle: LocaleKeys.couponCodeSubtitle.tr,
            showDivider: false,
          ),
          _buildTile(
            style: style,
            title: LocaleKeys.addressesTitle.tr,
            subTitle: LocaleKeys.addressesSubtitle.tr,
          ),
          _buildTile(
            style: style,
            title: LocaleKeys.preferenceTitle.tr,
            subTitle: LocaleKeys.preferenceSubtitle.tr,
            onTap: () => _showLanguageSheet(context, style),
          ),
          _buildTile(
            style: style,
            title: LocaleKeys.logOutOptions.tr,
            subTitle: LocaleKeys.manageLogoutDevice.tr,
            onTap: () => _showLogoutBottomSheet(context, style),
          ),
        ],
      ),
    );
  }

  _buildTile({
    required ProfilePageStyle style,
    required String title,
    String? subTitle,
    bool showDivider = true,
    Function()? onTap,
  }) {
    return SmartColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      onTap: onTap,
      color: style.whiteColor,
      children: [
        SmartRow(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SmartColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              expanded: true,
              spacing: 4.h,
              children: [
                SmartText(title, style: style.titleStyle),
                SmartText(subTitle, style: style.subTitleStyle),
              ],
            ),
            Icon(Icons.keyboard_arrow_right_rounded),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(top: 10.h, bottom: 5.h),
          child: Divider(),
        ),
      ],
    );
  }

  Widget _logOutOption({
    required String deviceName,
    required String option,
    required ProfilePageStyle style,
  }) {
    return SmartRow(
      onTap: () {
        HapticFeedback.lightImpact();
      },
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      decoration: /*isSelected ? style.selectedLanguageDecoration:*/style.unSelectedLanguageDecoration,
      children: [
        SmartText(
          isExpanded: true,
          deviceName,
          style:/*isSelected?style.languageSelectedStyle:*/style.languageUnSelectedStyle,
        ),
        SmartText(
          onTap: (){
            StorageManager.instance.setLoginDone(false);
            Get.offAllNamed(AppRoutes.loginPage);
          },
          option,
          style: style.nameTitleStyle.copyWith(fontSize: 14.sp, color: Colors.red),
        )
      ],
    );
  }

  Widget _languageOption({
    required String title,
    required Locale locale,
    required ProfilePageStyle style,
  }) {
    final currentLocale = AppController.to.appLocale.value;

    final bool isSelected = currentLocale.languageCode == locale.languageCode;

    return SmartRow(
      onTap: () {
        HapticFeedback.lightImpact();
        Get.back();
        Future.delayed(const Duration(milliseconds: 150), () {
          AppController.to.changeLocale(locale);
        });
      },
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      decoration: isSelected ? style.selectedLanguageDecoration:style.unSelectedLanguageDecoration,
      children: [
        SmartText(
          isExpanded: true,
          title,
          style:isSelected?style.languageSelectedStyle:style.languageUnSelectedStyle,
        ),
        if (isSelected)
          Icon(Icons.check_circle, color: style.primaryColor, size: 20.w),
      ],
    );
  }

  void _showLanguageSheet(BuildContext context, ProfilePageStyle style) {
    Utils.showSmartModalBottomSheet(
      context: context,
      builder:
          (context) => SmartColumn(
            padding: EdgeInsetsDirectional.all(20.r),
            decoration: BoxDecoration(
              color: style.whiteColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
            ),
            spacing: 16.h,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmartText(LocaleKeys.chooseLanguage.tr, style: style.nameTitleStyle),
              _languageOption(
                title: "English",
                locale: const Locale('en', 'US'),
                style: style,
              ),
              _languageOption(
                title: "العربية",
                locale: const Locale('ar', 'SA'),
                style: style,
              ),
            ],
          ),
    );
  }

  void _showLogoutBottomSheet(BuildContext context, ProfilePageStyle style) {
    Utils.showSmartModalBottomSheet(
      context: context,
      builder:
          (context) => SmartColumn(
        padding: EdgeInsetsDirectional.all(20.r),
        decoration: BoxDecoration(
          color: style.whiteColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        height: Get.height/3,
        spacing: 16.h,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmartText(LocaleKeys.currentDevice.tr, style: style.nameTitleStyle),
          _logOutOption(
              deviceName: "VIVO V50",
              option: LocaleKeys.logout.tr,
              style: style)
        ],
      ),
    );
  }
}
