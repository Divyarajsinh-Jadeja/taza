import 'package:taza/taza.dart';

class ReferAndEarnPage extends StatelessWidget {
  const ReferAndEarnPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).loginPageStyle;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: SmartAppBar(
          isBack: false,
          title: LocaleKeys.rewards.tr,
        ),
        backgroundColor: style.loginPageBgColor,
        body: SafeArea(
          child: SmartSingleChildScrollView(
            child: SmartColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        style.continueButtonBgColor.withValues(alpha: 0.1),
                        style.continueButtonBgColor.withValues(alpha: 0.4),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: SmartRichText(
                      spans: [
                        SmartTextSpan(
                          text: LocaleKeys.savedWithCoupon.tr.interpolate([
                            120.toCurrencyCodeFormat(),
                            100.toCurrencyCodeFormat(),
                          ]),
                          style: style.lebelTextStyle,
                        ),
                        SmartTextSpan(
                          text: "with amazing rewards",
                          style: style.lebelTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                16.verticalSpace,
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: SmartImage(
                      path: AppImages.imgRefer,
                      height: 220.h,
                      width: Get.width,
                      fit: BoxFit.contain, // Optional: ensures image fills bounds
                    ),
                  ),
                ),
                20.verticalSpace,
                _buildReferralSection(style),
                24.verticalSpace,
                _buildRewardInfoBox(style),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildReferralSection(LoginPageStyle style) {
    return SmartColumn(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: (const Color.fromRGBO(178, 189, 194, 0.25)).withValues(alpha: 0.4),
              offset: const Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.circular(16.r),
          color: style.loginPageBgColor,
        ),
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 20.h),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmartRow(
            children: [
              const Icon(Icons.group, size: 20),
              8.horizontalSpace,
              SmartText(
                'Invite your friends',
                color: Colors.black,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          12.verticalSpace,
          SmartRow(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12.r),
            ),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmartText('EINL2173', style: style.termsAndPrivacyTextStyle.copyWith(fontSize: 16.sp)),
              8.horizontalSpace,
              Icon(Icons.copy, size: 24),
            ],
          ),
          16.verticalSpace,
          SmartRow(
            children: [
              Expanded(
                child: SmartButton(
                  title: 'Whatsapp',
                  onTap: () {},
                  prefixImage: AppImages.icWhatsApp,
                  titleStyle: TextStyle(color: Colors.white),
                  activeBackgroundColor: Colors.green,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: SmartButton(
                  title: 'Other',
                  onTap: () {},
                  prefixImage: AppImages.icShare,
                  imageSize: 22.w,
                  titleStyle: TextStyle(color: Colors.white),
                  activeBackgroundColor: Colors.orange,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ],
          ),
        ],
      );

  }

  Widget _buildRewardInfoBox(LoginPageStyle style) {
    return SmartColumn(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
        padding: EdgeInsetsDirectional.all(16.w),
        decoration: BoxDecoration(
          color: style.loginPageBgColor,
          boxShadow: [
            BoxShadow(
              color: (const Color.fromRGBO(178, 189, 194, 0.25)).withValues(alpha: 0.4),
              offset: const Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.circular(16.r),
        ),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmartRow(
            padding: EdgeInsetsDirectional.all(10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: style.continueButtonBgColor.withValues(alpha: 0.2),
            ),
            children: [
              Icon(Icons.percent, size: 16.w),
              8.horizontalSpace,
              SmartText('You get \$50', style: TextStyle(fontWeight: FontWeight.bold)),
              8.horizontalSpace,
              SmartText('| Deals for friends', style: TextStyle(color: Colors.black54)),
              8.horizontalSpace,
              Icon(Icons.info_outline, size: 16.w),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: 12.h),
            child: Divider(height: 1),
          ),
          Row(
            children: [
              Icon(Icons.circle, size: 12, color: style.continueButtonBgColor.withValues(alpha: 0.2)),
              8.horizontalSpace,
              Expanded(
                child: SmartText('Your friend downloads the magicpin app'),
              ),
            ],
          ),
          14.verticalSpace,
          SmartRow(
            children: [
              Icon(Icons.circle, size: 12, color: style.continueButtonBgColor.withValues(alpha: 0.2)),
              8.horizontalSpace,
              SmartRichText(
                  spans: [
                SmartTextSpan(text:'On their first transaction worth \$50.',),
                SmartTextSpan(
                  text: 'T&C',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ])
            ],
          ),
        ],
      );
  }
}
