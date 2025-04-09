import 'package:taza/taza.dart';

class LightModeTheme extends AppTheme {
  final AppColor initColors;

  LightModeTheme(this.initColors);

  @override
  AppColor get colors => initColors;

  @override
  TextStyle get interRegularW400TextStyle =>
      TextStyle(fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.interRegular,
          color: colors.color1D1D1F);

  @override
  TextStyle get interMediumBoldW500TextStyle =>
      TextStyle(fontSize: 16.0.sp,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.interMedium,
          color: colors.color1D1D1F);

  @override
  TextStyle get interSemiBoldW600TextStyle =>
      TextStyle(fontSize: 16.0.sp,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.interSemiBold,
          color: colors.color1D1D1F);

  @override
  TextStyle get interBoldW700TextStyle =>
      TextStyle(fontSize: 16.0.sp,
          fontWeight: FontWeight.w700,
          fontFamily: AppFonts.interSansBold,
          color: colors.color1D1D1F);



  @override
  PrimaryButtonStyle get primaryButtonStyle =>
      PrimaryButtonStyle(
        titleStyle: interSemiBoldW600TextStyle.copyWith(
            fontSize: 15.sp, color: colors.colorF5F5F7),
        titleWhiteStyle: interSemiBoldW600TextStyle.copyWith(
            fontSize: 15.sp, color: colors.primary),
        activeBackgroundColor: colors.primary,
        activeWhiteBackgroundColor: colors.white,
        disableBackgroundColor: colors.colorF7F9FA,
        disableTitleStyle: interMediumBoldW500TextStyle.copyWith(
            color: colors.color8C8C8C, fontSize: 16.sp),
        activeImageColor: colors.white,
        activeWhiteImageColor: colors.primary,
        disableImageColor: colors.color8C8C8C,
      );

  @override
  TextFieldStyle get textFieldStyle =>
      TextFieldStyle(
        textStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp),
        blackColor: colors.color1D1D1F,
        labelStyle: interRegularW400TextStyle.copyWith(
            fontSize: 14.sp, color: colors.color1D1D1F),
        errorStyle: interRegularW400TextStyle.copyWith(fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: colors.colorF65D3C),
        textFillColor: colors.colorEEEAE5,
        disabledTextFieldBorderColor: colors.colorEEEAE5,
        enabledTextFieldBorderColor: colors.colorEEEAE5,
        focusedTextFieldBorderColor: colors.colorEEEAE5,
        errorBorderColor: colors.colorEEEAE5,
        hintStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: colors.color6E6E73),
      );

  @override
  CheckboxStyle get checkboxStyle =>
      CheckboxStyle(
        activeColor: colors.primary,
        checkColor: colors.white,
        borderColor: colors.colorD3DAE0,
        textStyle: interRegularW400TextStyle,
      );

  @override
  TabBarStyle get tabBarStyle =>
      TabBarStyle(
        unselectedLabelStyle: interMediumBoldW500TextStyle.copyWith(
            fontSize: 12.sp, color: colors.color8C8C8C),
        labelStyle: interMediumBoldW500TextStyle.copyWith(
            fontSize: 12.sp, color: colors.color1D1D1F),
        indicatorColor: colors.primary,
        backgroundColor: colors.white,
        borderColor: colors.colorD3DAE0,
        boxShadowColor: colors.black.withOpacity(0.17),
      );

  @override
  CustomAppBarStyle get appBarStyle =>
      CustomAppBarStyle(
        backgroundColor: colors.white,
        titleStyle: interBoldW700TextStyle.copyWith(fontSize: 20.sp),
        backTextStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp),
        borderColor: colors.color0CF52B,
        transparentColor: colors.transparent,
      );

  @override
  AuthModuleStyle get authModuleStyle =>
      AuthModuleStyle(
        backgroundColor: colors.colorF5F2EF,
        titleTextStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 28.sp),
        subTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp),
        labelStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp),
        linkStyle: interRegularW400TextStyle.copyWith(
            fontSize: 16.sp, color: colors.color1D1D1F),
        richTextStyle: interRegularW400TextStyle.copyWith(
            fontSize: 16.sp, color: colors.color1D1D1F),
        skipTextStyle: interMediumBoldW500TextStyle.copyWith(
            color: colors.color8C8C8C, fontSize: 16.sp),
        uploadImageBackgroundColor: colors.colorF5F5F7,
        uploadImageBorderColor: colors.colorD2D2D7,
        textFieldMessageStyle: interRegularW400TextStyle.copyWith(
            color: colors.color1D1D1F, fontSize: 12.sp),
        backToLoginTextStyle: interSemiBoldW600TextStyle.copyWith(
            fontSize: 15.sp, color: colors.primary),
        primaryColor: colors.primary,
        buttonLabelTextStyle: interSemiBoldW600TextStyle.copyWith(
            fontSize: 15.sp, color: colors.colorF5F5F7),
        highLightColor: colors.colorB3866F,
        appbarTitleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 18.sp),
      );

  @override
  SmartRichTextStyle get smartRichTextStyle =>
      SmartRichTextStyle(textStyle: interRegularW400TextStyle);

  @override
  RadioButtonStyle get radioButtonStyle =>
      RadioButtonStyle(
          textStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp));

  @override
  SmartDropDownStyle get smartDropDownStyle =>
      SmartDropDownStyle(
        backgroundColor: colors.white,
        titleTextStyle: interSemiBoldW600TextStyle,
        borderColor: colors.colorD3DAE0,
        selectedBorderColor: colors.primary,
        unSelectedBorderColor: colors.colorD3DAE0,
        labelStyle: interSemiBoldW600TextStyle.copyWith(
            fontSize: 16.sp, color: colors.color1D1D1F),
        selectedTitleTextStyle: interSemiBoldW600TextStyle.copyWith(
            color: colors.white),
      );

  @override
  CustomPageIndicatorStyle get customPageIndicatorStyle =>
      CustomPageIndicatorStyle(
        dropDownBackgroundColor: colors.white,
        borderColor: colors.colorD3DAE0,
        textColor: colors.primary,
        textStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp),
      );

  @override
  SelectionButtonStyle get selectionButtonStyle =>
      SelectionButtonStyle(
        selectedButtonBorderColor: colors.primary,
        selectedButtonColor: colors.primary,
        selectedButtonIconColor: colors.white,
        selectedButtonTextStyle: interMediumBoldW500TextStyle.copyWith(
            color: colors.white),
        unselectedButtonBorderColor: colors.colorD3DAE0,
        unselectedButtonColor: colors.white,
        unselectedButtonIconColor: colors.primary,
        unselectedButtonTextStyle: interMediumBoldW500TextStyle.copyWith(
            color: colors.color1D1D1F),
      );

  @override
  ImageCarouselStyle get imageCarouselStyle =>
      ImageCarouselStyle(
          dotColor: colors.colorC5DEEB, selectedDotColor: colors.primary);

  @override
  SmartImageTitleColumnStyle get smartImageTitleColumnStyle =>
      SmartImageTitleColumnStyle(
        titleStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 14.sp),
        subTitleStyle: interRegularW400TextStyle.copyWith(
            fontSize: 12.sp, color: colors.color8C8C8C),
      );

  @override
  SwitchStyle get switchStyle =>
      SwitchStyle(
        activeTrackColor: colors.color34C759,
        inactiveTrackColor: colors.color8C8C8C,
        thumbColor: colors.white,
        trackColor: colors.colorD3DAE0,
        inactiveThumbColor: colors.color34C759,
      );

  @override
  NoDataFoundStyle get noDataFoundStyle =>
      NoDataFoundStyle(
        titleStyle: interMediumBoldW500TextStyle.copyWith(fontSize: 24.sp),
        subTitleStyle: interRegularW400TextStyle.copyWith(
            fontSize: 16.sp, color: colors.color8C8C8C),
      );

  @override
  ConfirmCancelPopupStyle get confirmCancelPopupStyle =>
      ConfirmCancelPopupStyle(
        detailBgColor: colors.colorF7F9FA,
        whiteColor: colors.white,
        headerTitleStyle: interSemiBoldW600TextStyle.copyWith(
            fontSize: 18.sp, color: colors.color1D1D1F),
        subTitleStyle: interRegularW400TextStyle.copyWith(
            fontSize: 16.sp, color: colors.color8C8C8C),
        itemsTitleStyle: interRegularW400TextStyle.copyWith(
            color: colors.color8C8C8C),
        qtyTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp),
      );

  @override
  NoInternetScreenStyle get noInternetScreenStyle =>
      NoInternetScreenStyle(
        noInternetTitleStyle: interRegularW400TextStyle.copyWith(
            fontSize: 28.sp),
        noInternetSubtitleStyle: interRegularW400TextStyle.copyWith(
            fontSize: 16.sp, color: colors.color8C8C8C),
      );

  @override
  ManageCustomerStyle get manageCustomerStyle =>
      ManageCustomerStyle(
        nameStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 16.sp),
        emailStyle: interRegularW400TextStyle.copyWith(
            fontSize: 14.sp, color: colors.color8C8C8C),
        phoneNumberStyle: interRegularW400TextStyle.copyWith(
            fontSize: 14.sp, color: colors.color8C8C8C),
        appbarTitleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 18.sp),
        bgColor: colors.colorF7F9FA,
      );

  @override
  TaskListingStyle get taskListingStyle =>
      TaskListingStyle(
        nameStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 16.sp),
        emailStyle: interRegularW400TextStyle.copyWith(
            fontSize: 14.sp, color: colors.color8C8C8C),
        phoneNumberStyle: interRegularW400TextStyle.copyWith(
            fontSize: 14.sp, color: colors.color8C8C8C),
        appbarTitleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 18.sp),
        bgColor: colors.colorF7F9FA,
        dateStyle: interRegularW400TextStyle.copyWith(
            fontSize: 14.sp, color: colors.color8C8C8C),
        statusStyle: interRegularW400TextStyle.copyWith(
            fontSize: 14.sp, color: colors.color8C8C8C),
      );

  @override
  ShowDoubleActionDialogStyle get showDoubleActionDialogStyle =>
      ShowDoubleActionDialogStyle(
        titleStyle: interMediumBoldW500TextStyle,
        contentStyle: interRegularW400TextStyle,
        okButtonStyle: interMediumBoldW500TextStyle.copyWith(
            color: colors.primary),
      );

  @override
  SmartTileLineStepperStyle get smartTileLineStepperStyle =>
      SmartTileLineStepperStyle(
        completedIndicatorColor: colors.primary,
        upcomingIndicatorColor: colors.color8C8C8C,
        upcomingColor: colors.color8C8C8C,
        titleStyle: interSemiBoldW600TextStyle,
        subtitleStyle: interRegularW400TextStyle.copyWith(
            color: colors.color8C8C8C),
      );

  @override
  TrackOrderBottomSheetStyle get trackOrderBottomSheetStyle =>
      TrackOrderBottomSheetStyle(
        backgroundColor: colors.white,
        orderInfoBackgroundColor: colors.colorF7F9FA,
        titleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 18.sp),
        orderIdStyle: interRegularW400TextStyle.copyWith(
            fontSize: 12.sp, color: colors.color8C8C8C),
        imageSubTitleStyle: interRegularW400TextStyle.copyWith(
            fontSize: 14.sp, color: colors.color8C8C8C),
        imageTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp),
        quantityStyle: interRegularW400TextStyle.copyWith(
            fontSize: 16.sp, color: colors.color8C8C8C),
      );

  @override
  TaskDetailsStyle get taskDetailsStyle =>
      TaskDetailsStyle(
        nameStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 16.sp),
        descriptionStyle: interRegularW400TextStyle.copyWith(
            fontSize: 14.sp, color: colors.color8C8C8C),
        appbarTitleStyle: interSemiBoldW600TextStyle.copyWith(fontSize: 18.sp),
        assignedByStyle: interSemiBoldW600TextStyle.copyWith(
            fontSize: 15.sp, color: colors.color1D1D1F),
        //
        assignedToStyle: interRegularW400TextStyle.copyWith(
            fontSize: 15.sp, color: colors.color1D1D1F),
        taskDescriptionStyle: interBoldW700TextStyle.copyWith(
            fontSize: 18.sp, color: colors.color1D1D1F), //taskDescriptionStyle
      );

  @override
  FoodCardStyle get foodCardStyle =>
      FoodCardStyle(titleStyle: interBoldW700TextStyle,
          subTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 14.sp),
          amountStyle: interBoldW700TextStyle);


  @override
  HomeScreenStyle get homeScreenStyle =>
      HomeScreenStyle(
          addressTagTitleStyle: interBoldW700TextStyle.copyWith(fontSize: 15.sp),
          addressTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 13.sp, color: colors.color9C9CA3).copyWith(fontSize: 13.sp, color: colors.color9C9CA3),
          searchBarHintStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp, color: colors.color9C9CA3),
          searchBarTextStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp, color: colors.color1D1D1F),
          foodCardTitleStyle: interBoldW700TextStyle.copyWith(fontSize: 22.sp, color: colors.color1D1D1F),
          foodCardSubTitleStyle: interRegularW400TextStyle.copyWith(fontSize: 16.sp, color: colors.color58585C),
          foodCardTagStyle: interBoldW700TextStyle.copyWith(fontSize: 12.sp, color: colors.color00A4A2),
          foodCardTimeStyle: interBoldW700TextStyle.copyWith(fontSize: 13.sp, color: colors.color1D1D1F),
          foodCardDurationStyle: interRegularW400TextStyle.copyWith(fontSize: 11.sp, color: colors.color58585C),
      );
}
