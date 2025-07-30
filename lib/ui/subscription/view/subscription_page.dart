import 'package:taza/taza.dart';

class SubscriptionPage extends GetView<HomeController> {
   const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginStyle = AppTheme.of(context).loginPageStyle;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: loginStyle.continueButtonBgColor,
        body: SafeArea(
          bottom: false,
          child: SmartSingleChildScrollView(
            child: SmartColumn(
              color: loginStyle.loginPageBgColor,
              children: [
                _buildHeader(loginStyle),
                 SizedBox(height: 16),
                _buildSection(loginStyle),
                 SizedBox(height: 16),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomView(loginStyle),
      ),
    );
  }

  Widget _buildHeader(LoginPageStyle loginStyle) {
    return SmartColumn(
      width: Get.width,
      height: 140.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [loginStyle.continueButtonBgColor, loginStyle.continueButtonBgColor.withValues(alpha: 0.5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SmartImage(
          onTap: () => Get.back(),
          padding: EdgeInsetsDirectional.only(start : 16.w),
          alignment: AlignmentDirectional.topStart,
          path: AppImages.icArrowLeft,
          color: Colors.white,
        ),
        SmartImage(
          path: AppImages.icSplashLogo,
          height: 70.h,
          fit: BoxFit.contain,
          width: 50.w,
        ),
        SizedBox(height: 16.h),
        SmartText(
          'Unlimited Benefits and Savings',
          style: loginStyle.tagTextStyle,
        ),
      ],
    );
  }

  Widget _buildSection(LoginPageStyle loginStyle) {
    return SmartColumn(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      children: [
        SmartRow(
          spacing: 6.w,
          children: [
            SmartText(
                "BENEFITS",
                style: loginStyle.termsAndPrivacyTextStyle.copyWith(fontSize: 15.sp)
            ),
            Expanded(child: Container(height: 1.h, color: loginStyle.continueButtonDisableBgColor,))
          ],
        ),
        SizedBox(height: 20.h),
        _buildHighlightCard(loginStyle),
        SizedBox(height: 16.h),
        _buildFoodBenefits(loginStyle),
        SizedBox(height: 20.h),
        SmartRow(
          spacing: 6.w,
          children: [
            SmartText(
                "PRIVILEGES",
                style: loginStyle.termsAndPrivacyTextStyle.copyWith(fontSize: 15.sp)
            ),
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: loginStyle.continueButtonBgColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child:  SmartText(
                'NEW',
                style: loginStyle.skipButtonTextStyle.copyWith(fontSize: 14.sp),
              ),
            ),
            Expanded(child: Container(height: 1.h, color: loginStyle.continueButtonDisableBgColor,)),
            SmartText("View All", style: loginStyle.accountTextStyle.copyWith(fontSize: 14.sp)),
            Padding(
              padding: EdgeInsets.zero,
              child: Icon(Icons.arrow_forward_ios_rounded, size: 16.w),
            )
          ],
        ),
        SizedBox(height: 16.h,),
        _buildPrivilegeList(loginStyle),
      ],
    );
  }

  Widget _buildHighlightCard(LoginPageStyle loginStyle) {
    return SmartRow(
      padding: EdgeInsetsDirectional.all(14.w),
      decoration: BoxDecoration(
        color: loginStyle.continueButtonDisableBgColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      children: [
        CircleAvatar(
          backgroundColor: Colors.orange,
          radius: 20.r,
          child: Icon(Icons.currency_rupee, color: Colors.white, size: 20.w),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: SmartText(
            'Most customers like you save over ₹400/month with One membership!',
            style: loginStyle.termsAndPrivacyTextStyle.copyWith(fontSize: 13.sp),
          ),
        ),
      ],
    );
  }

  Widget _buildFoodBenefits(LoginPageStyle loginStyle) {
    return SmartColumn(
      padding: EdgeInsetsDirectional.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.grey[50],
        border: Border.all(color: Colors.grey.shade200),
      ),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartRow(
          children: [
            SmartText(
              'Food',
              style: loginStyle.accountTextStyle.copyWith(color: loginStyle.continueButtonBgColor),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: loginStyle.continueButtonBgColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child:  SmartText(
                'ONLY FOR YOU',
                style: loginStyle.skipButtonTextStyle.copyWith(fontSize: 14.sp),
              ),
            ),
          ],
        ),
         SizedBox(height: 12),
        _buildBenefitText(
          title: 'Unlimited free deliveries',
          subtitle: 'on all restaurants up to ',
          bold: '10km',
          suffix: ', on orders above ₹199',
          replaced: '7km',
          loginStyle: loginStyle
        ),
        _buildBenefitText(
          title: 'Up to 30% extra discounts',
          subtitle: 'over & above other offers',
            loginStyle: loginStyle
        ),
        SmartRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBenefitText(
              title: 'No surge fee',
              subtitle: 'during peak hours & holidays',
                loginStyle: loginStyle
            ),
            CircleAvatar(
              backgroundColor: loginStyle.continueButtonBgColor.withValues(alpha: 0.3),
              radius: 32.r,
              child: SmartImage(path: "assets/images/dosa.png", size: 44.w, alignment: Alignment.center,),
            ),
          ],
        ),
         SizedBox(height: 16),
         Divider(),
         SizedBox(height: 12),
        SmartText(
          'Instamart',
          style: loginStyle.accountTextStyle.copyWith(color: Colors.pink),
        ),
         SizedBox(height: 8),
        _buildBenefitText(
          title: 'Unlimited free deliveries',
          subtitle: 'on all orders above ₹199',
            loginStyle: loginStyle
        ),
        SmartRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBenefitText(
              title: 'No surge fee',
                subtitle: "for orders above 399",
                loginStyle: loginStyle
            ),
            CircleAvatar(
              backgroundColor: loginStyle.continueButtonBgColor.withValues(alpha: 0.3),
              radius: 32.r,
              child: SmartImage(path: "assets/images/ic_grocery_instamart.png", size: 47.w, alignment: Alignment.center,),
            ),
          ],
        ),
        SizedBox(height: 16),
        Divider(),
        SizedBox(height: 12),
        SmartText(
          'Dine-Out',
          style: loginStyle.accountTextStyle.copyWith(color: Colors.orange),
        ),
        SizedBox(height: 8),
        SmartRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBenefitText(
                title: 'Exclusive Pre-book offers',
                subtitle: 'Up to 50% off on top \nrestaurants',
                loginStyle: loginStyle
            ),
            CircleAvatar(
              backgroundColor: loginStyle.continueButtonBgColor.withValues(alpha: 0.3),
              radius: 32.r,
              child: SmartImage(path: "https://i.ibb.co/4wfmxWh0/food-delivery-image.png", size: 47.w, alignment: Alignment.center),
            ),
          ],
        ),
      ],
    );
  }

   Widget _buildBenefitText({
     required String title,
     String? subtitle,
     String? bold,
     String? suffix,
     String? replaced,
     LoginPageStyle? loginStyle,
   })
   {
     final List<SmartTextSpan> spans = [];

     // Title line
     spans.add(SmartTextSpan(
       text: '$title\n',
       style: loginStyle?.accountTextStyle.copyWith(fontSize : 16.sp),
     ));

     // Optional subtitle
     if (subtitle != null) {
       spans.add(SmartTextSpan(
         text: subtitle,
         style: loginStyle?.bottomTextStyle.copyWith(fontSize : 16.sp, color: Colors.grey)
       ));
     }

     // Optional replaced text with strikethrough
     if (replaced != null) {
       spans.add(SmartTextSpan(
         text: replaced,
         style: loginStyle?.bottomTextStyle.copyWith(fontSize : 16.sp, color: Colors.grey, decoration: TextDecoration.lineThrough)
         ,
       ));
     }

     // Optional bold text
     if (bold != null) {
       spans.add(SmartTextSpan(
         text: ' $bold',
           style: loginStyle?.bottomTextStyle.copyWith(fontSize : 16.sp, color: Colors.grey, fontWeight: FontWeight.bold)
       ));
     }

     // Optional suffix
     if (suffix != null) {
       spans.add(SmartTextSpan(
         text: suffix,
           style: loginStyle?.bottomTextStyle.copyWith(fontSize : 16.sp, color: Colors.grey, fontWeight: FontWeight.bold)
       ));
     }

     return SmartRichText(
       padding: EdgeInsetsDirectional.only(bottom: 12),
       spans: spans,
     );
   }

  Widget _buildPrivilegeList(LoginPageStyle loginStyle) {
    return SizedBox(
      height: 230.h,
      width: Get.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 10.w,),
        itemCount: 5,
        itemBuilder:
            (context, index) => SmartImage(path: "assets/images/premium_banner.png"),
      ),
    );
  }

  Widget _buildBottomView(LoginPageStyle loginStyle) {
    return SmartColumn(
      color: loginStyle.loginPageBgColor,
      height: 130.h,
        children: [
          SizedBox(height: 10.h,),
          SmartText("🎊LIMITED TIME DISCOUNT 🎊",
            style: loginStyle.bottomTextStyle.copyWith(color: loginStyle.continueButtonBgColor, fontSize: 15.sp),),
          SmartButton(
            margin: EdgeInsets.all(16.w),
            title: "Bye Subscription at ${25.toCurrencyCodeFormat()}\n for 3 months(GST will away)",
            onTap: () {},
            height: 60.h,
            width: Get.width,
            borderRadius: BorderRadius.circular(6.r),
            activeBackgroundColor:
            loginStyle.continueButtonBgColor,
            titleStyle: loginStyle.continueButtonTextStyle,
          )
    ]);
  }


}
