import 'package:taza/taza.dart';

class LightModeTheme extends AppTheme {
  final AppColor initColors;

  LightModeTheme(this.initColors);

  @override
  AppColor get colors => initColors;

  @override
  TextStyle get workSansRegularTextStyle =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: AppFonts.workSansRegular, color: colors.color1D1D1F);

  @override
  TextStyle get workSansMediumBoldTextStyle =>
      TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w500, fontFamily: AppFonts.workSansMedium, color: colors.color1D1D1F);

  @override
  TextStyle get workSansSemiBoldTextStyle =>
      TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w600, fontFamily: AppFonts.workSansSemiBold, color: colors.color1D1D1F);

  @override
  TextStyle get workSansBoldTextStyle =>
      TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w700, fontFamily: AppFonts.workSansBold, color: colors.color1D1D1F);

  @override
  TextStyle get dmSerifDisplayRegularTextStyle =>
      TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w400, fontFamily: AppFonts.dmSerifDisplayRegular, color: colors.color1D1D1F);

  @override
  TextStyle get sfProRegularTextStyle =>
      TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w400, fontFamily: AppFonts.sfProRegular, color: colors.color1D1D1F);

  @override
  PrimaryButtonStyle get primaryButtonStyle => PrimaryButtonStyle(
    titleStyle: workSansSemiBoldTextStyle.copyWith(fontSize: 15.sp, color: colors.colorF5F5F7),
    titleWhiteStyle: workSansSemiBoldTextStyle.copyWith(fontSize: 15.sp, color: colors.primary),
    activeBackgroundColor: colors.primary,
    activeWhiteBackgroundColor: colors.white,
    disableBackgroundColor: colors.colorF7F9FA,
    disableTitleStyle: workSansMediumBoldTextStyle.copyWith(color: colors.color8C8C8C, fontSize: 16.sp),
    activeImageColor: colors.white,
    activeWhiteImageColor: colors.primary,
    disableImageColor: colors.color8C8C8C,
  );

  @override
  TextFieldStyle get textFieldStyle => TextFieldStyle(
    textStyle: workSansRegularTextStyle.copyWith(fontSize: 16.sp),
    blackColor: colors.color1D1D1F,
    labelStyle: workSansRegularTextStyle.copyWith(fontSize: 14.sp, color: colors.color1D1D1F),
    errorStyle: workSansRegularTextStyle.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400, color: colors.colorF65D3C),
    textFillColor: colors.colorEEEAE5,
    disabledTextFieldBorderColor: colors.colorEEEAE5,
    enabledTextFieldBorderColor: colors.colorEEEAE5,
    focusedTextFieldBorderColor: colors.colorEEEAE5,
    errorBorderColor: colors.colorEEEAE5,
    hintStyle: workSansRegularTextStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400, color: colors.color6E6E73),
  );

  @override
  CheckboxStyle get checkboxStyle => CheckboxStyle(
    activeColor: colors.primary,
    checkColor: colors.white,
    borderColor: colors.colorD3DAE0,
    textStyle: workSansRegularTextStyle,
  );

  @override
  TabBarStyle get tabBarStyle => TabBarStyle(
    unselectedLabelStyle: workSansBoldTextStyle.copyWith(fontSize: 11.sp, color: colors.color9c9cA3),
    labelStyle: workSansMediumBoldTextStyle.copyWith(fontSize: 12.sp, color: colors.color1D1D1F),
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
    backgroundColor: colors.white,
    titleStyle: dmSerifDisplayRegularTextStyle.copyWith(fontSize: 28.sp),
    backTextStyle: sfProRegularTextStyle.copyWith(fontSize: 16.sp),
    borderColor: colors.color0CF52B,
    transparentColor: colors.transparent,
  );

  @override
  AuthModuleStyle get authModuleStyle => AuthModuleStyle(
    backgroundColor: colors.colorF5F2EF,
    titleTextStyle: workSansMediumBoldTextStyle.copyWith(fontSize: 28.sp),
    subTitleStyle: workSansRegularTextStyle.copyWith(fontSize: 16.sp),
    labelStyle: workSansRegularTextStyle.copyWith(fontSize: 16.sp),
    linkStyle: workSansRegularTextStyle.copyWith(fontSize: 16.sp, color: colors.color1D1D1F),
    richTextStyle: workSansRegularTextStyle.copyWith(fontSize: 16.sp, color: colors.color1D1D1F),
    skipTextStyle: workSansMediumBoldTextStyle.copyWith(color: colors.color8C8C8C, fontSize: 16.sp),
    uploadImageBackgroundColor: colors.colorF5F5F7,
    uploadImageBorderColor: colors.colorD2D2D7,
    textFieldMessageStyle: workSansRegularTextStyle.copyWith(color: colors.color1D1D1F, fontSize: 12.sp),
    backToLoginTextStyle: workSansSemiBoldTextStyle.copyWith(fontSize: 15.sp, color: colors.primary),
    primaryColor: colors.primary,
    buttonLabelTextStyle: workSansSemiBoldTextStyle.copyWith(fontSize: 15.sp, color: colors.colorF5F5F7),
    highLightColor: colors.colorB3866F,
    appbarTitleStyle: workSansSemiBoldTextStyle.copyWith(fontSize: 18.sp),
  );

  @override
  SmartRichTextStyle get smartRichTextStyle => SmartRichTextStyle(textStyle: workSansRegularTextStyle);

  @override
  RadioButtonStyle get radioButtonStyle => RadioButtonStyle(textStyle: workSansRegularTextStyle.copyWith(fontSize: 16.sp));

  @override
  SmartDropDownStyle get smartDropDownStyle => SmartDropDownStyle(
    backgroundColor: colors.white,
    titleTextStyle: workSansSemiBoldTextStyle,
    borderColor: colors.colorD3DAE0,
    selectedBorderColor: colors.primary,
    unSelectedBorderColor: colors.colorD3DAE0,
    labelStyle: workSansSemiBoldTextStyle.copyWith(fontSize: 16.sp, color: colors.color1D1D1F),
    selectedTitleTextStyle: workSansSemiBoldTextStyle.copyWith(color: colors.white),
  );

  @override
  CustomPageIndicatorStyle get customPageIndicatorStyle => CustomPageIndicatorStyle(
    dropDownBackgroundColor: colors.white,
    borderColor: colors.colorD3DAE0,
    textColor: colors.primary,
    textStyle: workSansRegularTextStyle.copyWith(fontSize: 16.sp),
  );

  @override
  SelectionButtonStyle get selectionButtonStyle => SelectionButtonStyle(
    selectedButtonBorderColor: colors.primary,
    selectedButtonColor: colors.primary,
    selectedButtonIconColor: colors.white,
    selectedButtonTextStyle: workSansMediumBoldTextStyle.copyWith(color: colors.white),
    unselectedButtonBorderColor: colors.colorD3DAE0,
    unselectedButtonColor: colors.white,
    unselectedButtonIconColor: colors.primary,
    unselectedButtonTextStyle: workSansMediumBoldTextStyle.copyWith(color: colors.color1D1D1F),
  );

  @override
  ImageCarouselStyle get imageCarouselStyle => ImageCarouselStyle(dotColor: colors.colorC5DEEB, selectedDotColor: colors.primary);

  @override
  SmartImageTitleColumnStyle get smartImageTitleColumnStyle => SmartImageTitleColumnStyle(
    titleStyle: workSansMediumBoldTextStyle.copyWith(fontSize: 14.sp),
    subTitleStyle: workSansRegularTextStyle.copyWith(fontSize: 12.sp, color: colors.color8C8C8C),
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
    titleStyle: workSansMediumBoldTextStyle.copyWith(fontSize: 24.sp),
    subTitleStyle: workSansRegularTextStyle.copyWith(fontSize: 16.sp, color: colors.color8C8C8C),
  );

  @override
  ConfirmCancelPopupStyle get confirmCancelPopupStyle => ConfirmCancelPopupStyle(
    detailBgColor: colors.colorF7F9FA,
    whiteColor: colors.white,
    headerTitleStyle: workSansSemiBoldTextStyle.copyWith(fontSize: 18.sp, color: colors.color1D1D1F),
    subTitleStyle: workSansRegularTextStyle.copyWith(fontSize: 16.sp, color: colors.color8C8C8C),
    itemsTitleStyle: workSansRegularTextStyle.copyWith(color: colors.color8C8C8C),
    qtyTitleStyle: workSansRegularTextStyle.copyWith(fontSize: 16.sp),
  );

  @override
  NoInternetScreenStyle get noInternetScreenStyle => NoInternetScreenStyle(
    noInternetTitleStyle: workSansRegularTextStyle.copyWith(fontSize: 28.sp),
    noInternetSubtitleStyle: workSansRegularTextStyle.copyWith(fontSize: 16.sp, color: colors.color8C8C8C),
  );

  @override
  ManageCustomerStyle get manageCustomerStyle => ManageCustomerStyle(
    nameStyle: workSansSemiBoldTextStyle.copyWith(fontSize: 16.sp),
    emailStyle: workSansRegularTextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
    phoneNumberStyle: workSansRegularTextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
    appbarTitleStyle: workSansSemiBoldTextStyle.copyWith(fontSize: 18.sp),
    bgColor: colors.colorF7F9FA,
  );

  @override
  TaskListingStyle get taskListingStyle => TaskListingStyle(
    nameStyle: workSansSemiBoldTextStyle.copyWith(fontSize: 16.sp),
    emailStyle: workSansRegularTextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
    phoneNumberStyle: workSansRegularTextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
    appbarTitleStyle: workSansSemiBoldTextStyle.copyWith(fontSize: 18.sp),
    bgColor: colors.colorF7F9FA,
    dateStyle: workSansRegularTextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
    statusStyle: workSansRegularTextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
  );

  @override
  ShowDoubleActionDialogStyle get showDoubleActionDialogStyle => ShowDoubleActionDialogStyle(
    titleStyle: workSansMediumBoldTextStyle,
    contentStyle: workSansRegularTextStyle,
    okButtonStyle: workSansMediumBoldTextStyle.copyWith(color: colors.primary),
  );

  @override
  SmartTileLineStepperStyle get smartTileLineStepperStyle => SmartTileLineStepperStyle(
    completedIndicatorColor: colors.primary,
    upcomingIndicatorColor: colors.color8C8C8C,
    upcomingColor: colors.color8C8C8C,
    titleStyle: workSansSemiBoldTextStyle,
    subtitleStyle: workSansRegularTextStyle.copyWith(color: colors.color8C8C8C),
  );

  @override
  TrackOrderBottomSheetStyle get trackOrderBottomSheetStyle => TrackOrderBottomSheetStyle(
    backgroundColor: colors.white,
    orderInfoBackgroundColor: colors.colorF7F9FA,
    titleStyle: workSansSemiBoldTextStyle.copyWith(fontSize: 18.sp),
    orderIdStyle: workSansRegularTextStyle.copyWith(fontSize: 12.sp, color: colors.color8C8C8C),
    imageSubTitleStyle: workSansRegularTextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
    imageTitleStyle: workSansRegularTextStyle.copyWith(fontSize: 16.sp),
    quantityStyle: workSansRegularTextStyle.copyWith(fontSize: 16.sp, color: colors.color8C8C8C),
  );

  @override
  TaskDetailsStyle get taskDetailsStyle => TaskDetailsStyle(
    nameStyle: workSansSemiBoldTextStyle.copyWith(fontSize: 16.sp),
    descriptionStyle: workSansRegularTextStyle.copyWith(fontSize: 14.sp, color: colors.color8C8C8C),
    appbarTitleStyle: workSansSemiBoldTextStyle.copyWith(fontSize: 18.sp),
    assignedByStyle: workSansSemiBoldTextStyle.copyWith(fontSize: 15.sp, color: colors.color1D1D1F), //
    assignedToStyle: workSansRegularTextStyle.copyWith(fontSize: 15.sp, color: colors.color1D1D1F),
    taskDescriptionStyle: workSansBoldTextStyle.copyWith(fontSize: 18.sp, color: colors.color1D1D1F), //taskDescriptionStyle
  );
}
