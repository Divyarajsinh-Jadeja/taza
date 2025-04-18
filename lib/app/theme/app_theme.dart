import 'package:taza/taza.dart';

//AppStyle
abstract class AppTheme {
  static AppTheme of(BuildContext context) {
    return LightModeTheme(Theme.of(context).colors);
  }

  AppColor get colors;

  TextStyle get workSansRegularTextStyle;

  TextStyle get workSansMediumBoldTextStyle;

  TextStyle get workSansSemiBoldTextStyle;

  TextStyle get workSansBoldTextStyle;

  PrimaryButtonStyle get primaryButtonStyle;

  TextFieldStyle get textFieldStyle;

  CheckboxStyle get checkboxStyle;

  TextStyle get dmSerifDisplayRegularTextStyle;

  TextStyle get sfProRegularTextStyle;

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

  CheckboxStyle({
    required this.activeColor,
    required this.checkColor,
    required this.borderColor,
    required this.textStyle,
  });
}

class TabBarStyle {
  final TextStyle labelStyle;
  final TextStyle unselectedLabelStyle;
  final Color indicatorColor;
  final Color backgroundColor;
  final Color borderColor;
  final Color boxShadowColor;

  TabBarStyle({
    required this.labelStyle,
    required this.unselectedLabelStyle,
    required this.indicatorColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.boxShadowColor,
  });
}

class CustomAppBarStyle {
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle titleStyle;
  final TextStyle backTextStyle;
  final Color transparentColor;

  CustomAppBarStyle({
    required this.backgroundColor,
    required this.borderColor,
    required this.titleStyle,
    required this.backTextStyle,
    required this.transparentColor,
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

  RadioButtonStyle({
    required this.textStyle,
  });
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

  ImageCarouselStyle({
    required this.dotColor,
    required this.selectedDotColor,
  });
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

  NoDataFoundStyle({
    required this.titleStyle,
    required this.subTitleStyle,
  });
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

  NoInternetScreenStyle({
    required this.noInternetTitleStyle,
    required this.noInternetSubtitleStyle,
  });
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

  ShowDoubleActionDialogStyle({
    required this.titleStyle,
    required this.contentStyle,
    required this.okButtonStyle,
  });
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
