import 'package:taza/taza.dart';

//AppStyle
abstract class AppTheme {
  static AppTheme of(BuildContext context) {
    return LightModeTheme(Theme.of(context).colors);
  }

  AppColor get colors;

  TextStyle get interRegularW400TextStyle;

  TextStyle get interMediumBoldW500TextStyle;

  TextStyle get interSemiBoldW600TextStyle;

  TextStyle get interBoldW700TextStyle;

  PrimaryButtonStyle get primaryButtonStyle;

  TextFieldStyle get textFieldStyle;

  CheckboxStyle get checkboxStyle;

  TabBarStyle get tabBarStyle;

  CustomAppBarStyle get appBarStyle;

  AuthModuleStyle get authModuleStyle;

  SmartRichTextStyle get smartRichTextStyle;

  RadioButtonStyle get radioButtonStyle;

  SmartDropDownStyle get smartDropDownStyle;

  CustomPageIndicatorStyle get customPageIndicatorStyle;

  SelectionButtonStyle get selectionButtonStyle;

  ImageCarouselStyle get imageCarouselStyle;

  SmartImageTitleColumnStyle get smartImageTitleColumnStyle;

  SwitchStyle get switchStyle;

  NoDataFoundStyle get noDataFoundStyle;

  ConfirmCancelPopupStyle get confirmCancelPopupStyle;

  NoInternetScreenStyle get noInternetScreenStyle;

  ManageCustomerStyle get manageCustomerStyle;

  ShowDoubleActionDialogStyle get showDoubleActionDialogStyle;

  SmartTileLineStepperStyle get smartTileLineStepperStyle;

  TrackOrderBottomSheetStyle get trackOrderBottomSheetStyle;

  TaskListingStyle get taskListingStyle;

  TaskDetailsStyle get taskDetailsStyle;

  FoodCardStyle get foodCardStyle;

  SmartCategoryRowStyle get smartCategoryRowStyle;

  CheckoutStyle get checkoutStyle;

  OfferPopupStyle get offerPopupStyle;

  SmartChipStyle get smartChipStyle;

  SmartTabBarStyle get smartTabBarStyle;

  FoodPageStyle get foodPageStyle;

  FoodItemCardStyle get foodItemCardStyle;

  SearchBarStyle get searchBarStyle;

  HomeHeaderStyle get homeHeaderStyle;

  FoodOptionCardStyle get foodOptionCardStyle;

  AddressBottomSheetStyle get addressBottomSheetStyle;

  GroceryStyle get groceryStyle;

  LoginPageStyle get loginPageStyle;

  ProfilePageStyle get profilePageStyle;

  AnimatedTabBarStyle get animatedTabBarStyle;

  OrderTrackingPageStyle get orderTrackingPageStyle;

  NotchedMsgStyle get notchedMsgStyle;

  BottomCartStyle get bottomCartStyle;

  RewardDialogStyle get rewardDialogStyle;

  OtpPageStyle get otpPageStyle;

  FoodDetailsPageStyle get foodDetailsPageStyle;

  PaymentOptionCardStyle get paymentOptionCardStyle;

  CategorySidebarStyle get categorySidebarStyle;

  ProductListViewStyle get productListViewStyle;

  PromotionalBannerStyle get promotionBannerStyle;

  ProductCardStyle get productCardStyle;
}

class PrimaryButtonStyle {
  final Color activeBackgroundColor;
  final Color activeWhiteBackgroundColor;
  final Color disableBackgroundColor;
  final TextStyle titleStyle;
  final TextStyle titleWhiteStyle;
  final TextStyle disableTitleStyle;
  final Color activeImageColor;
  final Color activeWhiteImageColor;
  final Color disableImageColor;

  PrimaryButtonStyle({
    required this.activeBackgroundColor,
    required this.activeWhiteBackgroundColor,
    required this.disableBackgroundColor,
    required this.titleStyle,
    required this.titleWhiteStyle,
    required this.disableTitleStyle,
    required this.activeImageColor,
    required this.activeWhiteImageColor,
    required this.disableImageColor,
  });
}

class TextFieldStyle {
  final TextStyle textStyle;
  final Color blackColor;
  final TextStyle labelStyle;
  final TextStyle errorStyle;
  final Color textFillColor;
  final Color disabledTextFieldBorderColor;
  final Color enabledTextFieldBorderColor;
  final Color focusedTextFieldBorderColor;
  final Color errorBorderColor;
  final TextStyle hintStyle;

  TextFieldStyle({
    required this.textStyle,
    required this.blackColor,
    required this.labelStyle,
    required this.errorStyle,
    required this.textFillColor,
    required this.disabledTextFieldBorderColor,
    required this.enabledTextFieldBorderColor,
    required this.focusedTextFieldBorderColor,
    required this.errorBorderColor,
    required this.hintStyle,
  });
}

class CheckboxStyle {
  final Color activeColor;
  final Color checkColor;
  final Color borderColor;
  final TextStyle textStyle;

  CheckboxStyle({required this.activeColor, required this.checkColor, required this.borderColor, required this.textStyle});
}

class TabBarStyle {
  final TextStyle labelStyle;
  final TextStyle unselectedLabelStyle;
  final Color indicatorColor;
  final Color backgroundColor;
  final Color borderColor;
  final Color boxShadowColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final Color selectedLabelColor;
  final Color unselectedLabelColor;

  TabBarStyle({
    required this.labelStyle,
    required this.unselectedLabelStyle,
    required this.indicatorColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.boxShadowColor,
    required this.selectedIconColor,
    required this.unselectedIconColor,
    required this.selectedLabelColor,
    required this.unselectedLabelColor,
  });
}

class CustomAppBarStyle {
  final Color primaryColor;
  final Color backgroundColor;
  final Color borderColor;
  final Color dividerColor;
  final TextStyle titleStyle;
  final TextStyle groupTitleStyle;
  final TextStyle groupSubTitleStyle;
  final TextStyle subTitleStyle;
  final TextStyle homeTitleStyle;
  final TextStyle backTextStyle;
  final Color transparentColor;

  CustomAppBarStyle({
    required this.primaryColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.dividerColor,
    required this.titleStyle,
    required this.homeTitleStyle,
    required this.backTextStyle,
    required this.transparentColor,
    required this.subTitleStyle,
    required this.groupTitleStyle,
    required this.groupSubTitleStyle,
  });
}

class AuthModuleStyle {
  final Color backgroundColor;
  final TextStyle titleTextStyle;
  final TextStyle subTitleStyle;
  final TextStyle labelStyle;
  final TextStyle linkStyle;
  final TextStyle richTextStyle;
  final TextStyle skipTextStyle;
  final TextStyle textFieldMessageStyle;
  final TextStyle backToLoginTextStyle;
  final TextStyle buttonLabelTextStyle;
  final Color uploadImageBackgroundColor;
  final Color uploadImageBorderColor;
  final Color primaryColor;
  final Color highLightColor;
  final TextStyle appbarTitleStyle;

  AuthModuleStyle({
    required this.labelStyle,
    required this.linkStyle,
    required this.backgroundColor,
    required this.titleTextStyle,
    required this.subTitleStyle,
    required this.richTextStyle,
    required this.skipTextStyle,
    required this.textFieldMessageStyle,
    required this.backToLoginTextStyle,
    required this.buttonLabelTextStyle,
    required this.uploadImageBackgroundColor,
    required this.uploadImageBorderColor,
    required this.primaryColor,
    required this.highLightColor,
    required this.appbarTitleStyle,
  });
}

class SmartRichTextStyle {
  final TextStyle textStyle;

  SmartRichTextStyle({required this.textStyle});
}

class RadioButtonStyle {
  final TextStyle textStyle;

  RadioButtonStyle({required this.textStyle});
}

class CustomPageIndicatorStyle {
  final Color borderColor;
  final Color textColor;
  final TextStyle textStyle;
  final Color dropDownBackgroundColor;

  CustomPageIndicatorStyle({
    required this.borderColor,
    required this.textColor,
    required this.textStyle,
    required this.dropDownBackgroundColor,
  });
}

class SmartDropDownStyle {
  final Color borderColor;
  final Color backgroundColor;
  final Color selectedBorderColor;
  final Color unSelectedBorderColor;
  final TextStyle titleTextStyle;
  final TextStyle labelStyle;
  final TextStyle selectedTitleTextStyle;

  SmartDropDownStyle({
    required this.backgroundColor,
    required this.borderColor,
    required this.selectedBorderColor,
    required this.unSelectedBorderColor,
    required this.titleTextStyle,
    required this.labelStyle,
    required this.selectedTitleTextStyle,
  });
}

class SelectionButtonStyle {
  final Color selectedButtonColor;
  final Color unselectedButtonColor;
  final Color selectedButtonBorderColor;
  final Color unselectedButtonBorderColor;
  final Color selectedButtonIconColor;
  final Color unselectedButtonIconColor;
  final TextStyle selectedButtonTextStyle;
  final TextStyle unselectedButtonTextStyle;

  SelectionButtonStyle({
    required this.selectedButtonColor,
    required this.unselectedButtonColor,
    required this.selectedButtonBorderColor,
    required this.unselectedButtonBorderColor,
    required this.selectedButtonIconColor,
    required this.unselectedButtonIconColor,
    required this.selectedButtonTextStyle,
    required this.unselectedButtonTextStyle,
  });
}

class ImageCarouselStyle {
  final Color dotColor;
  final Color selectedDotColor;

  ImageCarouselStyle({required this.dotColor, required this.selectedDotColor});
}

class SmartImageTitleColumnStyle {
  final TextStyle titleStyle;
  final TextStyle subTitleStyle;

  SmartImageTitleColumnStyle({required this.titleStyle, required this.subTitleStyle});
}

class SwitchStyle {
  final Color trackColor;
  final Color thumbColor;
  final Color activeTrackColor;
  final Color inactiveTrackColor;
  final Color inactiveThumbColor;

  SwitchStyle({
    required this.trackColor,
    required this.thumbColor,
    required this.activeTrackColor,
    required this.inactiveTrackColor,
    required this.inactiveThumbColor,
  });
}

class NoDataFoundStyle {
  final TextStyle titleStyle;
  final TextStyle subTitleStyle;

  NoDataFoundStyle({required this.titleStyle, required this.subTitleStyle});
}

class ConfirmCancelPopupStyle {
  final Color detailBgColor;
  final Color whiteColor;
  final TextStyle headerTitleStyle;
  final TextStyle subTitleStyle;
  final TextStyle itemsTitleStyle;
  final TextStyle qtyTitleStyle;

  ConfirmCancelPopupStyle({
    required this.detailBgColor,
    required this.whiteColor,
    required this.headerTitleStyle,
    required this.subTitleStyle,
    required this.itemsTitleStyle,
    required this.qtyTitleStyle,
  });
}

class NoInternetScreenStyle {
  final TextStyle noInternetTitleStyle;
  final TextStyle noInternetSubtitleStyle;

  NoInternetScreenStyle({required this.noInternetTitleStyle, required this.noInternetSubtitleStyle});
}

class ManageCustomerStyle {
  final TextStyle nameStyle;
  final TextStyle emailStyle;
  final TextStyle phoneNumberStyle;
  final TextStyle appbarTitleStyle;
  final Color bgColor;

  ManageCustomerStyle({
    required this.nameStyle,
    required this.emailStyle,
    required this.phoneNumberStyle,
    required this.appbarTitleStyle,
    required this.bgColor,
  });
}

class TaskListingStyle {
  final TextStyle nameStyle;
  final TextStyle emailStyle;
  final TextStyle phoneNumberStyle;
  final TextStyle appbarTitleStyle;
  final TextStyle dateStyle;
  final TextStyle statusStyle;
  final Color bgColor;

  TaskListingStyle({
    required this.nameStyle,
    required this.emailStyle,
    required this.phoneNumberStyle,
    required this.appbarTitleStyle,
    required this.dateStyle,
    required this.statusStyle,
    required this.bgColor,
  });
}

class ShowDoubleActionDialogStyle {
  final TextStyle titleStyle;
  final TextStyle contentStyle;
  final TextStyle okButtonStyle;

  ShowDoubleActionDialogStyle({required this.titleStyle, required this.contentStyle, required this.okButtonStyle});
}

class SmartTileLineStepperStyle {
  final Color completedIndicatorColor;
  final Color upcomingIndicatorColor;
  final Color upcomingColor;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;

  SmartTileLineStepperStyle({
    required this.completedIndicatorColor,
    required this.upcomingIndicatorColor,
    required this.upcomingColor,
    required this.titleStyle,
    required this.subtitleStyle,
  });
}

class TrackOrderBottomSheetStyle {
  final Color backgroundColor;
  final Color orderInfoBackgroundColor;
  final TextStyle titleStyle;
  final TextStyle orderIdStyle;
  final TextStyle imageSubTitleStyle;
  final TextStyle imageTitleStyle;
  final TextStyle quantityStyle;

  TrackOrderBottomSheetStyle({
    required this.backgroundColor,
    required this.orderInfoBackgroundColor,
    required this.titleStyle,
    required this.orderIdStyle,
    required this.imageSubTitleStyle,
    required this.imageTitleStyle,
    required this.quantityStyle,
  });
}

class TaskDetailsStyle {
  final TextStyle nameStyle;
  final TextStyle descriptionStyle;
  final TextStyle appbarTitleStyle;
  final TextStyle assignedByStyle;
  final TextStyle assignedToStyle;
  final TextStyle taskDescriptionStyle;

  TaskDetailsStyle({
    required this.nameStyle,
    required this.descriptionStyle,
    required this.appbarTitleStyle,
    required this.assignedByStyle,
    required this.assignedToStyle,
    required this.taskDescriptionStyle,
  });
}

class FoodCardStyle {
  final TextStyle titleStyle;
  final TextStyle subTitleStyle;
  final TextStyle amountStyle;
  final BoxDecoration cardDecoration;
  final BorderRadiusGeometry imageDecoration;
  final Color iconColor;

  FoodCardStyle({
    required this.titleStyle,
    required this.subTitleStyle,
    required this.amountStyle,
    required this.cardDecoration,
    required this.imageDecoration,
    required this.iconColor,
  });
}

class OfferPopupStyle {
  final TextStyle titleStyle;
  final TextStyle subTitleStyle;
  OfferPopupStyle({required this.titleStyle, required this.subTitleStyle});
}

class SmartChipStyle {
  final TextStyle titleStyle;
  final Color selectedColor;
  final Color color;

  SmartChipStyle({required this.titleStyle, required this.selectedColor, required this.color});
}

class SmartTabBarStyle {
  final TextStyle selectedTabTextStyle;
  final TextStyle unselectedTabTextStyle;
  final Color primaryColor;
  final Color tabDividerColor;
  final Color labelColor;
  final Color unselectedLabelColor;

  SmartTabBarStyle({
    required this.selectedTabTextStyle,
    required this.unselectedTabTextStyle,
    required this.primaryColor,
    required this.tabDividerColor,
    required this.labelColor,
    required this.unselectedLabelColor,
  });
}

class FoodPageStyle {
  final TextStyle headerTextStyle;
  final Color blackColor;
  final Color transparent;
  final Color borderColor;
  final TextStyle selectedCategoryTextStyle;
  final TextStyle unselectedCategoryTextStyle;
  final TextStyle categoryTitleTextStyle;
  final Color whiteColor;

  FoodPageStyle({
    required this.headerTextStyle,
    required this.blackColor,
    required this.transparent,
    required this.borderColor,
    required this.selectedCategoryTextStyle,
    required this.unselectedCategoryTextStyle,
    required this.categoryTitleTextStyle,
    required this.whiteColor,
  });
}

class FoodItemCardStyle {
  final Color dividerColor;
  final Color orangeColor;
  final Color primaryColor;
  final TextStyle titleStyle;
  final TextStyle ratingStyle;

  FoodItemCardStyle({
    required this.orangeColor,
    required this.titleStyle,
    required this.ratingStyle,
    required this.primaryColor,
    required this.dividerColor,
  });
}

class SmartCategoryRowStyle {
  final TextStyle titleStyle;

  SmartCategoryRowStyle({required this.titleStyle});
}

class CheckoutStyle {
  final Color backgroundColor;
  final Color primaryColor;
  final Color whiteColor;
  final Color requestColor;
  final Color greenColor;
  final Color tabSelectedBgColor;
  final Color tabDisableBgColor;
  final TextStyle titleStyle;
  final TextStyle subTitleStyle;
  final TextStyle subCardTitleStyle;
  final TextStyle savingTitleStyle;
  final TextStyle toPayTitleStyle;
  final TextStyle toPayTitleDiscountedStyle;
  final TextStyle appliedTextStyle;
  final TextStyle tabSelectedTextStyle;
  final TextStyle tabDisableTextStyle;
  final BoxDecoration cardDecoration;
  final TextStyle payUsingTextStyle;
  final TextStyle paymentTextStyle;
  final TextStyle tipSelectedStyle;
  final TextStyle tipUnSelectedStyle;
  final TextStyle mostTippedStyle;
  final BoxDecoration tipSelectedDecoration;
  final BoxDecoration tipUnSelectedDecoration;
  final BoxDecoration couponsSelectedDecoration;
  final BoxDecoration couponsUnSelectedDecoration;
  final TextStyle couponWhiteStyle;
  final Color redColor;
  final Color couponColor;
  final TextStyle billingTitleStyle;
  final TextStyle billingSubTitleStyle;
  final TextStyle billingSubTitleGreenStyle;
  final TextStyle deliveryHeaderStyle;
  final TextStyle productTitle;
  final TextStyle productSubtitle;
  CheckoutStyle({
    required this.backgroundColor,
    required this.primaryColor,
    required this.whiteColor,
    required this.requestColor,
    required this.greenColor,
    required this.tabSelectedBgColor,
    required this.tabDisableBgColor,
    required this.titleStyle,
    required this.subTitleStyle,
    required this.subCardTitleStyle,
    required this.savingTitleStyle,
    required this.toPayTitleStyle,
    required this.toPayTitleDiscountedStyle,
    required this.appliedTextStyle,
    required this.tabSelectedTextStyle,
    required this.tabDisableTextStyle,
    required this.cardDecoration,
    required this.payUsingTextStyle,
    required this.paymentTextStyle,
    required this.tipSelectedStyle,
    required this.mostTippedStyle,
    required this.tipUnSelectedStyle,
    required this.tipSelectedDecoration,
    required this.tipUnSelectedDecoration,
    required this.couponsSelectedDecoration,
    required this.couponsUnSelectedDecoration,
    required this.redColor,
    required this.couponWhiteStyle,
    required this.couponColor,
    required this.billingTitleStyle,
    required this.billingSubTitleGreenStyle,
    required this.billingSubTitleStyle,
    required this.deliveryHeaderStyle,
    required this.productTitle,
    required this.productSubtitle,

  });
}

class SearchBarStyle {
  final Color searchBarBgColor;
  final Color searchBarBorderColor;
  final TextStyle searchBarHintStyle;
  final TextStyle searchBarTextStyle;

  SearchBarStyle({
    required this.searchBarBgColor,
    required this.searchBarBorderColor,
    required this.searchBarHintStyle,
    required this.searchBarTextStyle,
  });
}

class HomeHeaderStyle {
  final TextStyle addressTagTitleStyle;
  final TextStyle addressTitleStyle;

  HomeHeaderStyle({required this.addressTagTitleStyle, required this.addressTitleStyle});
}

class FoodOptionCardStyle {
  final Color foodCardBgColor;
  final Color tagStartGradientStartColor;
  final Color tagEndGradientStartColor;
  final Color timeContainerBorderColor;
  final TextStyle foodCardTitleStyle;
  final TextStyle foodCardSubTitleStyle;
  final TextStyle foodCardTagStyle;
  final TextStyle foodCardTimeStyle;
  final TextStyle foodCardDurationStyle;

  FoodOptionCardStyle({
    required this.foodCardBgColor,
    required this.tagStartGradientStartColor,
    required this.tagEndGradientStartColor,
    required this.timeContainerBorderColor,
    required this.foodCardTitleStyle,
    required this.foodCardSubTitleStyle,
    required this.foodCardTagStyle,
    required this.foodCardTimeStyle,
    required this.foodCardDurationStyle,
  });
}

class AddressBottomSheetStyle {
  final Color textFieldBgColor;
  final Color submitButtonBgColor;
  final TextStyle addressBottomSheetTagTitleStyle;
  final TextStyle addressBottomSheetTitleStyle;

  AddressBottomSheetStyle({
    required this.textFieldBgColor,
    required this.submitButtonBgColor,
    required this.addressBottomSheetTagTitleStyle,
    required this.addressBottomSheetTitleStyle,
  });
}

class GroceryStyle {
  final TextStyle titleStyle;
  final TextStyle subTitleStyle;
  final BoxDecoration groceryCardDecoration;

  GroceryStyle({required this.titleStyle, required this.subTitleStyle, required this.groceryCardDecoration});
}

class LoginPageStyle {
  final Color dividerColor;
  final TextStyle skipButtonTextStyle;
  final Color loginPageBgColor;
  final TextStyle tagTextStyle;
  final TextStyle accountTextStyle;
  final Color continueButtonBgColor;
  final Color continueButtonDisableBgColor;
  final Color inputFieldBgColor;
  final TextStyle errorTextStyle;
  final TextStyle continueButtonTextStyle;
  final TextStyle bottomTextStyle;
  final TextStyle termsAndPrivacyTextStyle;
  final TextStyle countryCodeTextStyle;
  final TextStyle lebelTextStyle;

  LoginPageStyle({
    required this.dividerColor,
    required this.skipButtonTextStyle,
    required this.loginPageBgColor,
    required this.tagTextStyle,
    required this.accountTextStyle,
    required this.inputFieldBgColor,
    required this.errorTextStyle,
    required this.continueButtonBgColor,
    required this.continueButtonDisableBgColor,
    required this.continueButtonTextStyle,
    required this.bottomTextStyle,
    required this.termsAndPrivacyTextStyle,
    required this.countryCodeTextStyle,
    required this.lebelTextStyle,
  });
}

class ProfilePageStyle {
  final TextStyle nameTitleStyle;
  final TextStyle titleStyle;
  final TextStyle logoutTextStyle;
  final TextStyle subTitleStyle;
  final Color primaryColor;
  final Color whiteColor;
  final TextStyle primaryStyle;
  final TextStyle languageSelectedStyle;
  final TextStyle languageUnSelectedStyle;
  final BoxDecoration selectedLanguageDecoration;
  final BoxDecoration unSelectedLanguageDecoration;

  ProfilePageStyle({
    required this.nameTitleStyle,
    required this.titleStyle,
    required this.logoutTextStyle,
    required this.subTitleStyle,
    required this.primaryColor,
    required this.whiteColor,
    required this.primaryStyle,
    required this.languageSelectedStyle,
    required this.languageUnSelectedStyle,
    required this.selectedLanguageDecoration,
    required this.unSelectedLanguageDecoration,
  });
}

class AnimatedTabBarStyle {
  final Color transparentColor;
  AnimatedTabBarStyle({required this.transparentColor});
}

class OrderTrackingPageStyle {
  final Color headerBgColor;
  final BoxDecoration mainCardDecoration;
  final Color mainCardColor;
  final TextStyle titleTextStyle;
  final TextStyle headerTagStyle;
  final TextStyle headerTitleStyle;
  final Color circleBgColor;
  final Color dividerColor;
  final TextStyle subtitleTextStyle;
  final TextStyle payOnlineTextStyle;
  final TextStyle tipAmountTextStyle;
  final TextStyle payOnlineSubTitleStyle;
  final BoxDecoration cardDecoration;
  final BoxDecoration tipCardDecoration;
  final BoxDecoration circleBgDecoration;

  OrderTrackingPageStyle({
    required this.headerBgColor,
    required this.mainCardDecoration,
    required this.mainCardColor,
    required this.headerTagStyle,
    required this.headerTitleStyle,
    required this.titleTextStyle,
    required this.circleBgColor,
    required this.dividerColor,
    required this.tipAmountTextStyle,
    required this.subtitleTextStyle,
    required this.payOnlineTextStyle,
    required this.payOnlineSubTitleStyle,
    required this.cardDecoration,
    required this.tipCardDecoration,
    required this.circleBgDecoration,
  });
}

class NotchedMsgStyle {
  final Color notchedBgColor;
  final TextStyle notchedTextStyle;

  NotchedMsgStyle({required this.notchedBgColor, required this.notchedTextStyle});
}

class PaymentOptionCardStyle {
  final Color primaryColor;
  final Color whiteColor;
  final Color greyColor;
  final TextStyle titleStyle;
  final TextStyle subTitleStyle;
  final TextStyle primaryTitleStyle;
  PaymentOptionCardStyle({
    required this.primaryColor,
    required this.whiteColor,
    required this.titleStyle,
    required this.subTitleStyle,
    required this.greyColor,
    required this.primaryTitleStyle
  });
}

class OtpPageStyle {
  final Color otpPageBgColor;
  final TextStyle verifyTextStyle;
  final Color enterOtpButtonBgColor;
  final Color headerCardColor;
  final Color enterOtpButtonDisableBgColor;
  final TextStyle errorTextStyle;
  final TextStyle enterOtpButtonTextStyle;
  final TextStyle subTitlesTextStyle;
  final TextStyle otpInputTextStyle;
  final Color activeColor;
  final Color inactiveColor;
  final Color selectedColor;
  final Color errorBorderColor;
  final BoxDecoration callBoxDecoration;
  final TextStyle callBoxTitleStyle;

  OtpPageStyle({
    required this.otpPageBgColor,
    required this.verifyTextStyle,
    required this.headerCardColor,
    required this.enterOtpButtonBgColor,
    required this.enterOtpButtonDisableBgColor,
    required this.errorTextStyle,
    required this.enterOtpButtonTextStyle,
    required this.subTitlesTextStyle,
    required this.otpInputTextStyle,
    required this.activeColor,
    required this.inactiveColor,
    required this.selectedColor,
    required this.errorBorderColor,
    required this.callBoxDecoration,
    required this.callBoxTitleStyle,
  });
}

class FoodDetailsPageStyle {
  final Color iconColors;
  final Color flashColors;
  final Color greenColor;
  final Color highlightBgColor;
  final Color whiteColor;
  final Color percentageBgColor;
  final Color bottomSheetBestValueBgColor;
  final TextStyle rattingTextStyle;
  final TextStyle titleTextStyle;
  final TextStyle timeTextStyle;
  final TextStyle descriptionTextStyle;
  final TextStyle maxSaverPriceTextStyle;
  final TextStyle maxSaverTitleStyle;
  final TextStyle addButtonStyle;
  final TextStyle highlightTitleStyle;
  final TextStyle highlightDescriptionStyle;
  final TextStyle showMoreLessTextStyle;
  final TextStyle percentageTextStyle;
  final TextStyle bottomSheetTitleStyle;
  final TextStyle bestValueTitleStyle;
  final TextStyle bottomSheetKgStyle;
  final TextStyle bottomSheetPerKgPriceStyle;
  final TextStyle bottomSheetCurrentPriceStyle;
  final TextStyle bottomSheetOldPriceStyle;
  final TextStyle bottomSheetPercentageStyle;
  final TextStyle bottomSheetAddButtonStyle;
  final Color grayColor;

  FoodDetailsPageStyle({
    required this.iconColors,
    required this.flashColors,
    required this.greenColor,
    required this.highlightBgColor,
    required this.whiteColor,
    required this.percentageBgColor,
    required this.bottomSheetBestValueBgColor,
    required this.rattingTextStyle,
    required this.titleTextStyle,
    required this.timeTextStyle,
    required this.descriptionTextStyle,
    required this.maxSaverPriceTextStyle,
    required this.maxSaverTitleStyle,
    required this.addButtonStyle,
    required this.highlightTitleStyle,
    required this.showMoreLessTextStyle,
    required this.highlightDescriptionStyle,
    required this.percentageTextStyle,
    required this.bottomSheetTitleStyle,
    required this.bestValueTitleStyle,
    required this.bottomSheetKgStyle,
    required this.bottomSheetPerKgPriceStyle,
    required this.bottomSheetCurrentPriceStyle,
    required this.bottomSheetOldPriceStyle,
    required this.bottomSheetPercentageStyle,
    required this.bottomSheetAddButtonStyle,
    required this.grayColor
  });
}

class CategorySidebarStyle {
  final Color borderColor;
  final Color primaryColor;
  final Color transparentColor;
  final Color whiteColor;
  final Color shadowColor;
  final TextStyle selectedTitleTextStyle;
  final TextStyle unSelectedTitleTextStyle;
  CategorySidebarStyle({
    required this.borderColor,
    required this.primaryColor,
    required this.transparentColor,
    required this.whiteColor,
    required this.shadowColor,
    required this.selectedTitleTextStyle,
    required this.unSelectedTitleTextStyle,
  });
}

class ProductListViewStyle {
  final TextStyle categoryHeaderStyle;
  final TextStyle categorysubHeaderStyle;
  final TextStyle itemsStyle;

  ProductListViewStyle({required this.categoryHeaderStyle, required this.categorysubHeaderStyle,required this.itemsStyle});
}
class PromotionalBannerStyle {
  final TextStyle headline;
  final TextStyle subtitle;
  final TextStyle buttonTextStyle;
  final BoxDecoration boxDecoration;
  final Color whiteColor;

  const PromotionalBannerStyle({
    required this.headline,
    required this.subtitle,
    required this.buttonTextStyle,
    required this.whiteColor,
    required this.boxDecoration,
  });
}
class ProductCardStyle {
  final Color imageBackgroundColor;
  final Color deliveryIconColor;
  final TextStyle deliveryTimeTextStyle;
  final TextStyle nameTextStyle;
  final TextStyle sizeTextStyle;
  final TextStyle discountedPriceTextStyle;
  final TextStyle originalPriceTextStyle;
  final Color addButtonBackgroundColor;
  final Color addButtonBorderColor;
  final TextStyle addButtonTextStyle;
  final Color discountBadgeColor;
  final Color imageIconColor;
  final TextStyle discountBadgeTextStyle;

  ProductCardStyle({required this.imageBackgroundColor, required this.deliveryIconColor, required this.deliveryTimeTextStyle, required this.nameTextStyle, required this.sizeTextStyle, required this.discountedPriceTextStyle, required this.originalPriceTextStyle, required this.addButtonBackgroundColor, required this.addButtonBorderColor, required this.addButtonTextStyle, required this.discountBadgeColor, required this.discountBadgeTextStyle, required this.imageIconColor});

}

class BottomCartStyle{
  final TextStyle reviewTitleStyle;
  final TextStyle itemNameStyle;
  final TextStyle itemAmountStyle;
  final TextStyle titleStyle;
  final BoxDecoration defaultDecoration;
  final BoxDecoration fullDefaultDecoration;
  final BoxDecoration reviewDecoration;
  final Color whiteColor;
  final Color primaryColor;
  BottomCartStyle({required this.reviewTitleStyle,required this.itemNameStyle, required this.itemAmountStyle, required this.titleStyle, required this.defaultDecoration,required this.reviewDecoration,required this.whiteColor,required this.fullDefaultDecoration,required this.primaryColor});


}

class RewardDialogStyle {
  final Color? backgroundColor;
  final TextStyle? titleTextStyle;
  final TextStyle? highlightTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? celebrateTextStyle;
  final Color? closeIconColor;

  const RewardDialogStyle({
    this.backgroundColor,
    this.titleTextStyle,
    this.highlightTextStyle,
    this.subtitleTextStyle,
    this.celebrateTextStyle,
    this.closeIconColor,
  });
}
