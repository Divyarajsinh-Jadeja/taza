import 'package:taza/taza.dart';

class LightModeTheme extends AppTheme {
  final AppColor initColors;

  LightModeTheme(this.initColors);

  @override
  AppColor get colors => initColors;

  @override
  TextStyle get interRegularW400TextStyle =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: AppFonts.interRegular, color: colors.color1D1D1F);

  @override
  TextStyle get interMediumBoldW500TextStyle =>
      TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w500, fontFamily: AppFonts.interMedium, color: colors.color1D1D1F);

  @override
  TextStyle get interSemiBoldW600TextStyle =>
      TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w600, fontFamily: AppFonts.interSemiBold, color: colors.color1D1D1F);

  @override
  TextStyle get interBoldW700TextStyle =>
      TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w700, fontFamily: AppFonts.interBold, color: colors.color1D1D1F);

  @override
  PrimaryButtonStyle get primaryButtonStyle => PrimaryButtonStyle(
    titleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 15.sp, color: colors.colorF5F5F7),
    titleWhiteStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 15.sp, color: colors.primary),
    activeBackgroundColor: colors.primary,
    activeWhiteBackgroundColor: colors.white,
    disableBackgroundColor: colors.colorF7F9FA,
    disableTitleStyle: interMediumBoldW500TextStyle.copyWith(color: colors.color8C8C8C, fontSize: 16.sp),
    activeImageColor: colors.white,
    activeWhiteImageColor: colors.primary,
    disableImageColor: colors.color8C8C8C,
  );

  @override
  TextFieldStyle get textFieldStyle => TextFieldStyle(
    textStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp),
    blackColor: colors.color1D1D1F,
    labelStyle: interRegularW400TextStyle.copyWith(fontSize: 14.sp, color: colors.color1D1D1F),
    errorStyle: interRegularW400TextStyle.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400, color: colors.colorF65D3C),
    textFillColor: colors.colorEEEAE5,
    disabledTextFieldBorderColor: colors.colorEEEAE5,
    enabledTextFieldBorderColor: colors.colorEEEAE5,
    focusedTextFieldBorderColor: colors.colorEEEAE5,
    errorBorderColor: colors.colorEEEAE5,
    hintStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400, color: colors.color6E6E73),
  );

  @override
  CheckboxStyle get checkboxStyle => CheckboxStyle(
    activeColor: colors.primary,
    checkColor: colors.white,
    borderColor: colors.colorD3DAE0,
    textStyle: interRegularW400TextStyle,
  );

  @override
  TabBarStyle get tabBarStyle => TabBarStyle(
    unselectedLabelStyle: interBoldW700TextStyle.copyWith(fontSize: 11.sp, color: colors.color9c9cA3),
    labelStyle: interBoldW700TextStyle.copyWith(fontSize: 12.sp, color: colors.color1D1D1F),
    indicatorColor: colors.primary,
    backgroundColor: colors.white,
    borderColor: colors.colorD3DAE0,
    boxShadowColor: colors.black.withValues(alpha: 0.17),
    selectedIconColor: colors.primary,
    unselectedIconColor: colors.color9c9cA3,
    selectedLabelColor: colors.color1D1D1F,
    unselectedLabelColor: colors.color9c9cA3,
  );

  @override
  CustomAppBarStyle get appBarStyle => CustomAppBarStyle(
    primaryColor: colors.primary,
    backgroundColor: colors.white,
    titleStyle: interBoldW700TextStyle.copyWith(fontSize: 20.sp),
    homeTitleStyle: interBoldW700TextStyle.copyWith(fontSize: 15.sp),
    backTextStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp),
    borderColor: colors.color0CF52B,
    dividerColor: colors.color9c9cA3,
    transparentColor: colors.transparent,

    subTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 13.sp, color: colors.color9c9cA3),
    groupTitleStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 16.sp, color: colors.white),
    groupSubTitleStyle: interBoldW700TextStyle.copyWith(fontSize: 18.sp, color: colors.white),
  );

  @override
  AuthModuleStyle get authModuleStyle => AuthModuleStyle(
    backgroundColor: colors.colorF5F2EF,
    titleTextStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 28.sp),
    subTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp),
    labelStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp),
    linkStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp, color: colors.color1D1D1F),
    richTextStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp, color: colors.color1D1D1F),
    skipTextStyle: interMediumBoldW500TextStyle.copyWith(color: colors.color8C8C8C, fontSize: 16.sp),
    uploadImageBackgroundColor: colors.colorF5F5F7,
    uploadImageBorderColor: colors.colorD2D2D7,
    textFieldMessageStyle: interRegularW400TextStyle.copyWith(color: colors.color1D1D1F, fontSize: 12.sp),
    backToLoginTextStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 15.sp, color: colors.primary),
    primaryColor: colors.primary,
    buttonLabelTextStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 15.sp, color: colors.colorF5F5F7),
    highLightColor: colors.colorB3866F,
    appbarTitleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 18.sp),
  );

  @override
  SmartRichTextStyle get smartRichTextStyle => SmartRichTextStyle(textStyle: interRegularW400TextStyle);

  @override
  RadioButtonStyle get radioButtonStyle => RadioButtonStyle(textStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp));

  @override
  SmartDropDownStyle get smartDropDownStyle => SmartDropDownStyle(
    backgroundColor: colors.white,
    titleTextStyle: interSemiBoldW600TextStyle,
    borderColor: colors.colorD3DAE0,
    selectedBorderColor: colors.primary,
    unSelectedBorderColor: colors.colorD3DAE0,
    labelStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 16.sp, color: colors.color1D1D1F),
    selectedTitleTextStyle: interSemiBoldW600TextStyle.copyWith(color: colors.white),
  );

  @override
  CustomPageIndicatorStyle get customPageIndicatorStyle => CustomPageIndicatorStyle(
    dropDownBackgroundColor: colors.white,
    borderColor: colors.colorD3DAE0,
    textColor: colors.primary,
    textStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp),
  );

  @override
  SelectionButtonStyle get selectionButtonStyle => SelectionButtonStyle(
    selectedButtonBorderColor: colors.primary,
    selectedButtonColor: colors.primary,
    selectedButtonIconColor: colors.white,
    selectedButtonTextStyle: interMediumBoldW500TextStyle.copyWith(color: colors.white),
    unselectedButtonBorderColor: colors.colorD3DAE0,
    unselectedButtonColor: colors.white,
    unselectedButtonIconColor: colors.primary,
    unselectedButtonTextStyle: interMediumBoldW500TextStyle.copyWith(color: colors.color1D1D1F),
  );

  @override
  ImageCarouselStyle get imageCarouselStyle => ImageCarouselStyle(dotColor: colors.colorC5DEEB, selectedDotColor: colors.primary);

  @override
  SmartImageTitleColumnStyle get smartImageTitleColumnStyle => SmartImageTitleColumnStyle(
    titleStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 14.sp),
    subTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 12.sp, color: colors.color8C8C8C),
  );

  @override
  SwitchStyle get switchStyle => SwitchStyle(
    activeTrackColor: colors.color34C759,
    inactiveTrackColor: colors.color8C8C8C,
    thumbColor: colors.white,
    trackColor: colors.colorD3DAE0,
    inactiveThumbColor: colors.color34C759,
  );

  @override
  NoDataFoundStyle get noDataFoundStyle => NoDataFoundStyle(
    titleStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 24.sp),
    subTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp, color: colors.color8C8C8C),
  );

  @override
  ConfirmCancelPopupStyle get confirmCancelPopupStyle => ConfirmCancelPopupStyle(
    detailBgColor: colors.colorF7F9FA,
    whiteColor: colors.white,
    headerTitleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 18.sp, color: colors.color1D1D1F),
    subTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp, color: colors.color8C8C8C),
    itemsTitleStyle: interRegularW400TextStyle.copyWith(color: colors.color8C8C8C),
    qtyTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp),
  );

  @override
  NoInternetScreenStyle get noInternetScreenStyle => NoInternetScreenStyle(
    noInternetTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 28.sp),
    noInternetSubtitleStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp, color: colors.color8C8C8C),
  );

  @override
  ManageCustomerStyle get manageCustomerStyle => ManageCustomerStyle(
    nameStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 16.sp),
    emailStyle: interRegularW400TextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
    phoneNumberStyle: interRegularW400TextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
    appbarTitleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 18.sp),
    bgColor: colors.colorF7F9FA,
  );

  @override
  TaskListingStyle get taskListingStyle => TaskListingStyle(
    nameStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 16.sp),
    emailStyle: interRegularW400TextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
    phoneNumberStyle: interRegularW400TextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
    appbarTitleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 18.sp),
    bgColor: colors.colorF7F9FA,
    dateStyle: interRegularW400TextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
    statusStyle: interRegularW400TextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
  );

  @override
  ShowDoubleActionDialogStyle get showDoubleActionDialogStyle => ShowDoubleActionDialogStyle(
    titleStyle: interMediumBoldW500TextStyle,
    contentStyle: interRegularW400TextStyle,
    okButtonStyle: interMediumBoldW500TextStyle.copyWith(color: colors.primary),
  );

  @override
  SmartTileLineStepperStyle get smartTileLineStepperStyle => SmartTileLineStepperStyle(
    completedIndicatorColor: colors.primary,
    upcomingIndicatorColor: colors.color8C8C8C,
    upcomingColor: colors.color8C8C8C,
    titleStyle: interSemiBoldW600TextStyle,
    subtitleStyle: interRegularW400TextStyle.copyWith(color: colors.color8C8C8C),
  );

  @override
  TrackOrderBottomSheetStyle get trackOrderBottomSheetStyle => TrackOrderBottomSheetStyle(
    backgroundColor: colors.white,
    orderInfoBackgroundColor: colors.colorF7F9FA,
    titleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 18.sp),
    orderIdStyle: interRegularW400TextStyle.copyWith(fontSize: 12.sp, color: colors.color8C8C8C),
    imageSubTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
    imageTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp),
    quantityStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp, color: colors.color8C8C8C),
  );

  @override
  TaskDetailsStyle get taskDetailsStyle => TaskDetailsStyle(
    nameStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 16.sp),
    descriptionStyle: interRegularW400TextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
    appbarTitleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 18.sp),
    assignedByStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 15.sp, color: colors.color1D1D1F),
    //
    assignedToStyle: interRegularW400TextStyle.copyWith(fontSize: 15.sp, color: colors.color1D1D1F),
    taskDescriptionStyle: interBoldW700TextStyle.copyWith(fontSize: 18.sp, color: colors.color1D1D1F), //taskDescriptionStyle
  );

  @override
  FoodCardStyle get foodCardStyle => FoodCardStyle(
    titleStyle: interBoldW700TextStyle,
    subTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 12.sp),
    amountStyle: interBoldW700TextStyle.copyWith(fontSize: 15.sp),
    cardDecoration: BoxDecoration(border: Border.all(color: colors.colorD2D2D7), borderRadius: BorderRadius.circular(16.r)),
    imageDecoration: BorderRadiusDirectional.only(topStart: Radius.circular(12.r), bottomStart: Radius.circular(12.r)),
    iconColor: colors.primary,
  );

  @override
  OfferPopupStyle get offerPopupStyle => OfferPopupStyle(
    titleStyle: interBoldW700TextStyle.copyWith(color: colors.white, fontSize: 38.sp),
    subTitleStyle: interBoldW700TextStyle.copyWith(color: colors.white, fontSize: 17.sp),
  );

  @override
  SmartChipStyle get smartChipStyle => SmartChipStyle(
    titleStyle: interBoldW700TextStyle.copyWith(color: colors.color9c9cA3, fontSize: 13.sp),
    selectedColor: colors.primary,
    color: colors.color9c9cA3,
  );

  @override
  SmartTabBarStyle get smartTabBarStyle => SmartTabBarStyle(
    selectedTabTextStyle: interMediumBoldW500TextStyle.copyWith(color: colors.primary),
    unselectedTabTextStyle: interSemiBoldW600TextStyle,
    primaryColor: colors.primary,
    tabDividerColor: colors.colorD3DAE0,
    labelColor: colors.color303538,
    unselectedLabelColor: colors.color8C8C8C,
  );

  @override
  FoodPageStyle get foodPageStyle => FoodPageStyle(
    headerTextStyle: interBoldW700TextStyle.copyWith(fontSize: 17.sp),
    blackColor: colors.black,
    borderColor: colors.colorD2D2D7,
    transparent: colors.transparent,
    selectedCategoryTextStyle: interBoldW700TextStyle.copyWith(color: colors.white),
    unselectedCategoryTextStyle: interBoldW700TextStyle.copyWith(color: colors.color9c9cA3),
    categoryTitleTextStyle: interBoldW700TextStyle.copyWith(fontSize: 14.sp),
    whiteColor: colors.white,
  );

  @override
  FoodItemCardStyle get foodItemCardStyle => FoodItemCardStyle(
    orangeColor: colors.orangeColor,
    titleStyle: interBoldW700TextStyle,
    ratingStyle: interRegularW400TextStyle,
    primaryColor: colors.primary,
    dividerColor: colors.colorD2D2D7,
  );

  @override
  SmartCategoryRowStyle get smartCategoryRowStyle =>
      SmartCategoryRowStyle(titleStyle: interBoldW700TextStyle.copyWith(color: colors.white, fontSize: 15.sp));

  @override
  CheckoutStyle get checkoutStyle => CheckoutStyle(
    backgroundColor: colors.colorF5F5F7,
    primaryColor: colors.primary,
    whiteColor: colors.white,
    requestColor: colors.color9c9cA3,
    greenColor: colors.color038153,
    tabSelectedBgColor: colors.color00BAB3,
    tabDisableBgColor: colors.colorF5F5F7,
    titleStyle: interBoldW700TextStyle.copyWith(fontSize: 13.sp, color: colors.color1D1D1F),
    subTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 11.sp, color: colors.color9c9cA3),
    subCardTitleStyle: interBoldW700TextStyle.copyWith(fontSize: 13.sp, color: colors.color9c9cA3),
    savingTitleStyle: interBoldW700TextStyle.copyWith(fontSize: 13.sp, color: colors.color1D1D1F),
    toPayTitleStyle: interBoldW700TextStyle.copyWith(fontSize: 13.sp, color: colors.color1D1D1F),
    toPayTitleDiscountedStyle: interBoldW700TextStyle.copyWith(
      fontSize: 13.sp,
      color: colors.color9c9cA3,
      decoration: TextDecoration.lineThrough,
    ),
    appliedTextStyle: interBoldW700TextStyle.copyWith(fontSize: 12.sp, color: colors.color038153),
    tabSelectedTextStyle: interBoldW700TextStyle.copyWith(fontSize: 13.sp, color: colors.white),
    tabDisableTextStyle: interBoldW700TextStyle.copyWith(fontSize: 13.sp, color: colors.color58585C),
    cardDecoration: BoxDecoration(color: colors.white, borderRadius: BorderRadius.all(Radius.circular(16.r)),boxShadow: [

    ]),
    payUsingTextStyle: interRegularW400TextStyle.copyWith(fontSize: 13.sp, color: colors.color9c9cA3),
    paymentTextStyle: interBoldW700TextStyle.copyWith(fontSize: 15.sp, color: colors.color1D1D1F),
    tipSelectedStyle: interBoldW700TextStyle.copyWith(fontSize: 11.sp, color: colors.black),
    mostTippedStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 8.sp, color: colors.white),

    tipUnSelectedStyle: interBoldW700TextStyle.copyWith(fontSize: 11.sp, color: colors.color1D1D1F),
    tipSelectedDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      color: colors.white,
      border: Border.all(color: colors.primary),
      boxShadow: [BoxShadow(color: colors.primary.withValues(alpha: 0.5), blurRadius: 2, spreadRadius: 1, offset: Offset(0, 2))],
    ),
    tipUnSelectedDecoration: BoxDecoration(
      color: colors.white,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: colors.color9c9cA3),
    ),

    couponsSelectedDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(28.r),
      color: colors.white,
      border: Border.all(color: colors.primary),
      boxShadow: [BoxShadow(color: colors.primary.withValues(alpha: 0.2), blurRadius: 8, spreadRadius: 4, offset: Offset(0, 2))],
    ),
    couponsUnSelectedDecoration: BoxDecoration(
      color: colors.white,
      borderRadius: BorderRadius.circular(28.r),
      border: Border.all(color: colors.color9c9cA3),
    ),
    redColor: colors.colorFF0000,
    couponWhiteStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 14.sp,color: colors.white),
    couponColor: colors.color8C8C8C,
    billingTitleStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 12.sp,color: colors.color8C8C8C),
    billingSubTitleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 12.sp,color: colors.color1D1D1F),
    billingSubTitleGreenStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 12.sp,color: colors.color34C759),
    deliveryHeaderStyle: interBoldW700TextStyle.copyWith(fontSize: 14.sp,color: colors.color1D1D1F),
    productTitle: interMediumBoldW500TextStyle.copyWith(fontSize: 12.sp),
    productSubtitle: interMediumBoldW500TextStyle.copyWith(fontSize: 10.sp,color: colors.color9c9cA3),
  );

  @override
  SearchBarStyle get searchBarStyle => SearchBarStyle(
    searchBarBgColor: colors.white,
    searchBarBorderColor: colors.colorD2D2D7,
    searchBarHintStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp, color: colors.color9c9cA3),
    searchBarTextStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp, color: colors.color1D1D1F),
  );

  @override
  HomeHeaderStyle get homeHeaderStyle => HomeHeaderStyle(
    addressTagTitleStyle: interBoldW700TextStyle.copyWith(fontSize: 15.sp),
    addressTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 13.sp, color: colors.color9c9cA3),
  );

  @override
  FoodOptionCardStyle get foodOptionCardStyle => FoodOptionCardStyle(
    foodCardTitleStyle: interBoldW700TextStyle.copyWith(fontSize: 22.sp, color: colors.color1D1D1F),
    foodCardSubTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp, color: colors.color58585C),
    foodCardTagStyle: interBoldW700TextStyle.copyWith(fontSize: 12.sp, color: colors.color00A4A2),
    foodCardTimeStyle: interBoldW700TextStyle.copyWith(fontSize: 13.sp, color: colors.color1D1D1F),
    foodCardDurationStyle: interRegularW400TextStyle.copyWith(fontSize: 11.sp, color: colors.color58585C),
    foodCardBgColor: colors.white,
    tagStartGradientStartColor: colors.colorC6FFF8,
    tagEndGradientStartColor: colors.white,
    timeContainerBorderColor: colors.primary,
  );

  @override
  AddressBottomSheetStyle get addressBottomSheetStyle => AddressBottomSheetStyle(
    addressBottomSheetTagTitleStyle: interBoldW700TextStyle.copyWith(fontSize: 15.sp),
    addressBottomSheetTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 13.sp, color: colors.color9c9cA3),
    textFieldBgColor: colors.white,
    submitButtonBgColor: colors.primary,
  );

  @override
  GroceryStyle get groceryStyle => GroceryStyle(
    titleStyle: interBoldW700TextStyle.copyWith(fontSize: 17.sp),
    subTitleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 14.sp),
    groceryCardDecoration: BoxDecoration(color: colors.colorF5F5F7, borderRadius: BorderRadius.circular(16.r)),
  );

  @override
  LoginPageStyle get loginPageStyle =>
      LoginPageStyle(
          skipButtonTextStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 16.sp, color: colors.white),
          tagTextStyle: interBoldW700TextStyle.copyWith(fontSize: 18.sp, color: colors.white),
          dividerColor: colors.color1D1D1F,
          continueButtonTextStyle: interBoldW700TextStyle.copyWith(fontSize: 16.sp, color: colors.white),
          continueButtonBgColor: colors.primary,
          continueButtonDisableBgColor: colors.primary.withValues(alpha: 0.4),
          loginPageBgColor: colors.white,
          inputFieldBgColor: colors.white,
          errorTextStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 14.sp, color: colors.colorFF0000),
          bottomTextStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 11.sp, color: colors.color9c9cA3),
          termsAndPrivacyTextStyle: interBoldW700TextStyle.copyWith(fontSize: 12.sp, color: colors.color1D1D1F),
          countryCodeTextStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 16.sp, color: colors.color1D1D1F),
        accountTextStyle: interBoldW700TextStyle.copyWith(fontSize: 20.sp, color: colors.color1D1D1F),
        lebelTextStyle: interBoldW700TextStyle.copyWith(fontSize: 14.sp, color: colors.primary),
      );

  @override
  OrderTrackingPageStyle get orderTrackingPageStyle => OrderTrackingPageStyle(
    circleBgColor: colors.colorF5F5F7,
    cardDecoration: BoxDecoration(color: colors.colorF5F5F7, borderRadius: BorderRadius.circular(16.r)),
    mainCardDecoration: BoxDecoration(
      color: colors.white,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [BoxShadow(color: colors.boxShadowColor, blurRadius: 5.r, spreadRadius: 5.r)],
    ),
    mainCardColor: colors.white,
    payOnlineTextStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 14.sp, color: colors.primary),
    headerBgColor: colors.primary,
    titleTextStyle: interBoldW700TextStyle.copyWith(fontSize: 12.sp, color: colors.color1D1D1F),
    dividerColor: colors.colorF5F5F7,
    subtitleTextStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 12.sp, color: colors.color1D1D1F),
    payOnlineSubTitleStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 12.sp, color: colors.color1D1D1F),
    headerTagStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 16.sp, color: colors.white),
    headerTitleStyle: interBoldW700TextStyle.copyWith(fontSize: 18.sp, color: colors.white),
    tipCardDecoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), border: Border.all(color: colors.colorF5F5F7)),
    tipAmountTextStyle: interMediumBoldW500TextStyle.copyWith(color: colors.color1D1D1F),
    circleBgDecoration: BoxDecoration(color: colors.colorF5F5F7, shape: BoxShape.circle),
  );

  @override
  ProfilePageStyle get profilePageStyle => ProfilePageStyle(
    nameTitleStyle: interBoldW700TextStyle.copyWith(fontSize: 18.sp),
    titleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 16.sp),
    subTitleStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 12.sp, color: colors.color8C8C8C),
    primaryColor: colors.primary,
    primaryStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 12.sp, color: colors.primary),
    whiteColor: colors.white,
    languageSelectedStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 16.sp),
    languageUnSelectedStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp),
    selectedLanguageDecoration: BoxDecoration(
      border: Border.all(color: colors.primary, width: 1.5.w),
      borderRadius: BorderRadius.circular(12.r),
      color: colors.primary.withValues(alpha: 0.2),
    ),
    unSelectedLanguageDecoration: BoxDecoration(
      border: Border.all(color: colors.color9c9cA3, width: 1.w),
      borderRadius: BorderRadius.circular(12.r),
      color: colors.white,
    ),
  );

  @override
  AnimatedTabBarStyle get animatedTabBarStyle => AnimatedTabBarStyle(transparentColor: colors.transparent);

  @override
  PaymentOptionCardStyle get paymentOptionCardStyle => PaymentOptionCardStyle(
    primaryColor: colors.primary,
    whiteColor: colors.white,
    titleStyle: interBoldW700TextStyle.copyWith(fontSize: 16.sp),
    primaryTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 14.sp, color: colors.primary),
    subTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 14.sp, color: colors.color58585C),
    greyColor: colors.colorD3DAE0,
  );

  @override
  NotchedMsgStyle get notchedMsgStyle => NotchedMsgStyle(
    notchedBgColor: colors.colorE8FFF0,
    notchedTextStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 12.sp, color: colors.color34A853)
  );

  @override
  BottomCartStyle get bottomCartStyle => BottomCartStyle(
      reviewTitleStyle: interBoldW700TextStyle.copyWith(fontSize: 16.sp),
      titleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 12.sp),
      itemNameStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 12.sp),
      itemAmountStyle: interRegularW400TextStyle.copyWith(fontSize: 10.sp),
      reviewDecoration: BoxDecoration(

          color: colors.colorF5F5F7,borderRadius: BorderRadius.only(topRight: Radius.circular(24.r),topLeft: Radius.circular(24.r),),boxShadow: [
        BoxShadow(
          color: colors.colorBlack12,
          blurRadius: 8,
          offset: Offset(0, -2),
        ),
      ],),
      defaultDecoration: BoxDecoration(color: colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(24.r),topLeft: Radius.circular(24.r),),
        boxShadow: [
          BoxShadow(
            color: colors.colorBlack12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      fullDefaultDecoration: BoxDecoration(color: colors.white,borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: colors.colorBlack12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
    whiteColor: colors.white,
    primaryColor: colors.primary
  );

  @override
  @override
  RewardDialogStyle get rewardDialogStyle => RewardDialogStyle(
    backgroundColor: colors.white,
    titleTextStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 16.sp),
    highlightTextStyle: interBoldW700TextStyle.copyWith(fontSize: 20.sp),
    subtitleTextStyle: interRegularW400TextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
    celebrateTextStyle: interBoldW700TextStyle.copyWith(fontSize: 16.sp, color: colors.orangeColor),
    closeIconColor: colors.color8C8C8C,
  );



  @override
  FoodDetailsPageStyle get foodDetailsPageStyle => FoodDetailsPageStyle(
    iconColors: colors.primary,
    flashColors: colors.color9c9cA3,
    greenColor: colors.color30D158,
    highlightBgColor: colors.colorF5F5F7,
    rattingTextStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 14.sp, color: colors.color9c9cA3),
    timeTextStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 14.sp, color: colors.color9c9cA3),
    titleTextStyle: interBoldW700TextStyle.copyWith(fontSize: 19.sp, color: colors.color1D1D1F),
    descriptionTextStyle: interRegularW400TextStyle.copyWith(fontSize: 17.sp, color: colors.color9c9cA3),
    maxSaverPriceTextStyle: interBoldW700TextStyle.copyWith(fontSize: 17.sp, color: colors.black),
    maxSaverTitleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 12.sp, color: colors.color30D158),
    addButtonStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 16.sp, color: colors.color30D158),
    highlightTitleStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 15.sp, color: colors.color1D1D1F),
    highlightDescriptionStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 15.sp, color: colors.black),
  );

  @override
  OtpPageStyle get otpPageStyle =>
      OtpPageStyle(
        enterOtpButtonTextStyle: interBoldW700TextStyle.copyWith(fontSize: 16.sp, color: colors.white),
        enterOtpButtonBgColor: colors.primary,
        enterOtpButtonDisableBgColor: colors.primary.withValues(alpha: 0.4),
        otpPageBgColor: colors.white,
        errorTextStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 12.sp, color: colors.colorFF0000),
        subTitlesTextStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 13.sp, color: colors.color9c9cA3),
        verifyTextStyle: interBoldW700TextStyle.copyWith(fontSize: 19.sp, color: colors.color1D1D1F),
        headerCardColor:  colors.colorF1F5FD,
        otpInputTextStyle: interBoldW700TextStyle.copyWith(fontSize: 18.sp, color: colors.primary),
        activeColor: colors.primary,
        inactiveColor: colors.colorD2D2D7,
        selectedColor: colors.primary,
        errorBorderColor: colors.colorFF0000,
        callBoxDecoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: colors.primary, width: 2.w)
        ),
        callBoxTitleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 14.sp, color: colors.primary)
      );
}
