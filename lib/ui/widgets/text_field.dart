import 'package:taza/taza.dart';

class SmartTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final EdgeInsets? padding;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? errorText;
  final bool obscured;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;
  final Color? color;
  final EdgeInsets? contentPadding;
  final Function(String)? onValueChanges;
  final Function(String)? onFieldSubmitted;
  final Function(String)? validator;
  final List<TextInputFormatter>? textInputFormatter;
  final double? height;
  final int? maxLines;
  final int? maxLength;
  final bool? expand;
  final TextStyle? errorStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final bool? isEnabled;
  final bool? isRequired;
  final double? enabledBorderRadius;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final bool autofocus;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final String? suffixText;
  final String? prefixText;
  final BorderRadius? borderRadius;
  final InputBorder? customEnabledBorder;
  final InputBorder? customDisabledBorder;
  final InputBorder? customFocusedBorder;
  final InputBorder? customErrorBorder;
  final InputBorder? customFocusedErrorBorder;
  final GestureTapCallback? onTap;
  final double? prefixIconSize;
  final double? cursorHeight;
  final TextAlign? textAlign;
  final bool isSearch;
  final bool isSearchWithPrefix;

  SmartTextField({
    super.key,
    this.controller,
    this.hintText,
    this.obscured = false,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.autofillHints,
    this.color,
    this.onValueChanges,
    this.onFieldSubmitted,
    this.validator,
    this.textInputFormatter,
    this.contentPadding,
    this.errorText,
    this.hintStyle,
    String? labelText,
    this.labelStyle,
    this.padding,
    this.maxLines,
    this.maxLength,
    this.expand,
    this.height,
    this.style,
    this.errorStyle,
    this.suffixIcon,
    this.focusNode,
    this.nextFocusNode,
    this.isEnabled,
    this.isRequired,
    this.prefixIcon,
    this.enabledBorderRadius,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.autofocus = false,
    this.onTapOutside,
    this.onEditingComplete,
    this.borderRadius,
    this.customEnabledBorder,
    this.customDisabledBorder,
    this.customFocusedBorder,
    this.customErrorBorder,
    this.customFocusedErrorBorder,
    this.suffixText,
    this.prefixText,
    this.onTap,
    this.prefixIconSize,
    this.cursorHeight,
    this.textAlign,
    this.isSearchWithPrefix = false,
  }) : labelText = labelText != null ? '$labelText${isRequired == true ? ' *' : ''}' : null,
       isSearch = false;

  SmartTextField.search({
    super.key,
    this.controller,
    this.hintText,
    this.obscured = false,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.autofillHints,
    this.color,
    this.onValueChanges,
    this.onFieldSubmitted,
    this.validator,
    this.textInputFormatter,
    this.contentPadding,
    this.errorText,
    this.hintStyle,
    String? labelText,
    this.labelStyle,
    this.padding,
    this.maxLines,
    this.maxLength,
    this.expand,
    this.height,
    this.style,
    this.errorStyle,
    this.suffixIcon,
    this.focusNode,
    this.nextFocusNode,
    this.isEnabled,
    this.isRequired,
    this.enabledBorderRadius,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.autofocus = false,
    this.onTapOutside,
    this.onEditingComplete,
    this.prefixIcon,
    this.borderRadius,
    this.customEnabledBorder,
    this.customDisabledBorder,
    this.customFocusedBorder,
    this.customErrorBorder,
    this.customFocusedErrorBorder,
    this.suffixText,
    this.prefixText,
    this.onTap,
    this.prefixIconSize,
    this.cursorHeight,
    this.textAlign,
    this.isSearchWithPrefix = false,
  }) : labelText = labelText != null ? '$labelText${isRequired == true ? ' *' : ''}' : null,
       isSearch = true;

  final ValueNotifier<bool> _passwordVisible = ValueNotifier(false);

  void _toggle() {
    _passwordVisible.value = !_passwordVisible.value;
  }

  @override
  Widget build(BuildContext context) {
    final textFieldStyle = AppTheme.of(context).textFieldStyle;

    OutlineInputBorder enabledBorder({bool isFocused = false}) {
      return OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(enabledBorderRadius ?? 12.r)),
        borderSide: BorderSide(
          color:
              isFocused
                  ? textFieldStyle.focusedTextFieldBorderColor
                  : (enabledBorderColor) ??
                      (isSearch ? textFieldStyle.focusedTextFieldBorderColor : textFieldStyle.enabledTextFieldBorderColor),
        ),
      );
    }

    OutlineInputBorder disabledBorder = OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(isSearch ? 8.r : 12.r)),
      borderSide: BorderSide(color: disabledBorderColor ?? textFieldStyle.disabledTextFieldBorderColor),
    );
    OutlineInputBorder errorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: textFieldStyle.errorBorderColor),
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(isSearch ? 8.r : 12.r)),
    );
    return SmartColumn(
      mainAxisSize: MainAxisSize.min,
      padding: padding ?? EdgeInsets.zero,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[SmartText(labelText!, style: textFieldStyle.labelStyle.merge(labelStyle)), SizedBox(height: 4.h)],
        ValueListenableBuilder<bool>(
          valueListenable: _passwordVisible,
          builder: (context, value, child) {
            return SizedBox(
              height: isSearch ? 40.h : null,
              child: TextFormField(
                onTap: onTap,
                autofocus: autofocus,
                style: textFieldStyle.textStyle.merge(style),
                onTapOutside: (p) {
                  if (onTapOutside != null) {
                    FocusScope.of(context).unfocus();
                    onTapOutside!(p);
                  }
                },
                textCapitalization: textCapitalization,
                maxLength: maxLength,
                textAlign: textAlign ?? TextAlign.start,
                expands: expand ?? false,
                readOnly: readOnly,
                maxLines: maxLines ?? 1,
                focusNode: focusNode,
                enabled: isEnabled ?? true,
                cursorColor: textFieldStyle.blackColor,
                controller: controller,
                cursorHeight: cursorHeight ?? (isSearch ? 16.h : null),
                decoration: InputDecoration(
                  suffixText: suffixText,
                  prefixText: prefixText,
                  prefixStyle: textFieldStyle.textStyle.merge(style),
                  suffixStyle: textFieldStyle.textStyle.merge(style),
                  errorMaxLines: 6,
                  counterText: '',
                  filled: true,
                  errorStyle: textFieldStyle.errorStyle.merge(errorStyle),
                  fillColor: color ?? textFieldStyle.textFillColor,
                  contentPadding:
                      contentPadding ?? (isSearch ? EdgeInsets.all(10.w) : EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h)),
                  disabledBorder: customDisabledBorder ?? disabledBorder,
                  enabledBorder: customEnabledBorder ?? enabledBorder(),
                  focusedBorder: customFocusedBorder ?? enabledBorder(isFocused: true),
                  errorBorder: customErrorBorder ?? errorBorder,
                  focusedErrorBorder: customFocusedErrorBorder ?? errorBorder,
                  hintText: hintText ?? (isSearch ? LocaleKeys.search.tr : ''),
                  errorText: errorText,
                  hintStyle: textFieldStyle.hintStyle.merge(hintStyle),
                  prefixIcon:
                      prefixIcon ??
                      (isSearch ? isSearchWithPrefix ? SmartImage(path: AppImages.icHome, fit: BoxFit.contain, margin: EdgeInsets.all(8.w)) : null : null),
                  suffixIcon:
                      suffixIcon ??
                      (obscured
                          ? TextButton(
                            onPressed: _toggle,
                            child: SmartText(
                              value ? LocaleKeys.hide.tr : LocaleKeys.show.tr,
                              style: textFieldStyle.labelStyle.copyWith(fontSize: 16.sp),
                            ),
                          )
                          : null),
                ),
                obscureText: obscured && _passwordVisible.value ? false : obscured,
                obscuringCharacter: '●',
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                autocorrect: false,
                autofillHints: autofillHints,
                inputFormatters: textInputFormatter ?? [],
                onChanged: (value) {
                  if (onValueChanges != null) {
                    onValueChanges!(value);
                  }
                },
                onFieldSubmitted: (value) {
                  if (nextFocusNode != null) {
                    FocusScope.of(context).requestFocus(nextFocusNode);
                  } else {
                    FocusScope.of(context).unfocus();
                  }
                  if (onFieldSubmitted != null) {
                    onFieldSubmitted!(value);
                  }
                },
                onEditingComplete: () {
                  if (nextFocusNode != null) {
                    FocusScope.of(context).requestFocus(nextFocusNode);
                  } else {
                    FocusScope.of(context).unfocus();
                  }
                  onEditingComplete?.call();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class OtpTextField extends StatelessWidget {
  /// The [BuildContext] of the application
  final BuildContext appContext;

  ///Box Shadow for Pincode
  final List<BoxShadow>? boxShadows;

  /// length of how many cells there should be. 3-8 is recommended by me
  final int length;

  /// you already know what it does i guess :P default is false
  final bool obscureText;

  /// Character used for obscuring text if obscureText is true.
  ///
  /// Must not be empty. Single character is recommended.
  ///
  /// Default is ● - 'Black Circle' (U+25CF)
  final String obscuringCharacter;

  /// Widget used to obscure text
  ///
  /// it overrides the obscuringCharacter
  final Widget? obscuringWidget;

  /// Whether to use haptic feedback or not
  ///
  ///
  final bool useHapticFeedback;

  /// Haptic Feedback Types
  ///
  /// heavy, medium, light links to respective impacts
  /// selection - selectionClick, vibrate - vibrate
  /// check [HapticFeedback] for more
  final HapticFeedbackTypes hapticFeedbackTypes;

  /// Decides whether typed character should be
  /// briefly shown before being obscured
  final bool blinkWhenObscuring;

  /// Blink Duration if blinkWhenObscuring is set to true
  final Duration blinkDuration;

  /// returns the current typed text in the fields
  final ValueChanged<String>? onChanged;

  /// returns the typed text when all pins are set
  final ValueChanged<String>? onCompleted;

  /// returns the typed text when user presses done/next action on the keyboard
  final ValueChanged<String>? onSubmitted;

  /// The [onEditingComplete] callback also runs when the user finishes editing.
  /// It's different from [onSubmitted] because it has a default value which
  /// updates the text controller and yields the keyboard focus. Applications that
  /// require different behavior can override the default [onEditingComplete]
  /// callback.
  ///
  /// Set this to empty function if you don't want the keyboard to automatically close
  /// when user presses done/next.
  final VoidCallback? onEditingComplete;

  /// the style of the text, default is [ fontSize: 20, fontWeight: FontWeight.bold]
  final TextStyle? textStyle;

  /// the style of the pasted text, default is [fontWeight: FontWeight.bold] while
  /// [TextStyle.color] is [ThemeData.colorScheme.onSecondary]
  final TextStyle? pastedTextStyle;

  /// background color for the whole row of pin code fields.
  final Color? backgroundColor;

  /// This defines how the elements in the pin code field align. Default to [MainAxisAlignment.spaceBetween]
  final MainAxisAlignment mainAxisAlignment;

  /// [AnimationType] for the text to appear in the pin code field. Default is [AnimationType.slide]
  final AnimationType animationType;

  /// Duration for the animation. Default is [Duration(milliseconds: 150)]
  final Duration animationDuration;

  /// [Curve] for the animation. Default is [Curves.easeInOut]
  final Curve animationCurve;

  /// [TextInputType] for the pin code fields. default is [TextInputType.visiblePassword]
  final TextInputType keyboardType;

  /// If the pin code field should be autofocused or not. Default is [false]
  final bool autoFocus;

  /// Should pass a [FocusNode] to manage it from the parent
  final FocusNode? focusNode;

  /// A list of [TextInputFormatter] that goes to the TextField
  final List<TextInputFormatter> inputFormatters;

  /// Enable or disable the Field. Default is [true]
  final bool enabled;

  /// [TextEditingController] to control the text manually. Sets a default [TextEditingController()] object if none given
  final TextEditingController? controller;

  /// Enabled Color fill for individual pin fields, default is [false]
  final bool enableActiveFill;

  /// Auto dismiss the keyboard upon inputting the value for the last field. Default is [true]
  final bool autoDismissKeyboard;

  /// Auto dispose the [controller] and [FocusNode] upon the destruction of widget from the widget tree. Default is [true]
  final bool autoDisposeControllers;

  /// Configures how the platform keyboard will select an uppercase or lowercase keyboard.
  /// Only supports text keyboards, other keyboard types will ignore this configuration. Capitalization is locale-aware.
  /// - Copied from 'https://api.flutter.dev/flutter/services/TextCapitalization-class.html'
  /// Default is [TextCapitalization.none]
  final TextCapitalization textCapitalization;

  final TextInputAction textInputAction;

  /// Triggers the error animation
  final StreamController<ErrorAnimationType>? errorAnimationController;

  /// Callback method to validate if text can be pasted. This is helpful when we need to validate text before pasting.
  /// e.g. validate if text is number. Default will be pasted as received.
  final bool Function(String? text)? beforeTextPaste;

  /// Method for detecting a pin_code form tap
  /// work with all form windows
  final Function? onTap;

  /// Configuration for paste dialog. Read more [DialogConfig]
  final DialogConfig? dialogConfig;

  /// Theme for the pin cells. Read more [PinTheme]
  final PinTheme? pinTheme;

  /// Brightness dark or light choices for iOS keyboard.
  final Brightness? keyboardAppearance;

  /// Validator for the [TextFormField]
  final FormFieldValidator<String>? validator;

  /// An optional method to call with the final value when the form is saved via
  /// [FormState.save].
  final FormFieldSetter<String>? onSaved;

  /// enables auto validation for the [TextFormField]
  /// Default is [AutovalidateMode.onUserInteraction]
  final AutovalidateMode autovalidateMode;

  /// The vertical padding from the [PinCodeTextField] to the error text
  /// Default is 16.
  final double errorTextSpace;

  /// Margin for the error text
  /// Default is [EdgeInsets.zero].
  final EdgeInsets errorTextMargin;

  /// [TextDirection] to control a direction in which text flows.
  /// Default is [TextDirection.ltr]
  final TextDirection errorTextDirection;

  /// Enables pin autofill for TextFormField.
  /// Default is true
  final bool enablePinAutofill;

  /// Error animation duration
  final int errorAnimationDuration;

  /// Whether to show cursor or not
  final bool showCursor;

  /// The color of the cursor, default to Theme.of(context).accentColor
  final Color? cursorColor;

  /// width of the cursor, default to 2
  final double cursorWidth;

  /// Height of the cursor, default to FontSize + 8;
  final double? cursorHeight;

  /// Autofill cleanup action
  final AutofillContextAction onAutoFillDisposeAction;

  /// Use external [AutoFillGroup]
  final bool useExternalAutoFillGroup;

  /// Displays a hint or placeholder in the field if it's value is empty.
  /// It only appears if it's not null. Single character is recommended.
  final String? hintCharacter;

  /// the style of the [hintCharacter], default is [fontSize: 20, fontWeight: FontWeight.bold]
  /// and it also uses the [textStyle]'s properties
  /// [TextStyle.color] is [Colors.grey]
  final TextStyle? hintStyle;

  /// ScrollPadding follows the same property as TextField's ScrollPadding, default to
  /// const EdgeInsets.all(20),
  final EdgeInsets scrollPadding;

  /// Text gradient for Pincode
  final Gradient? textGradient;

  /// Makes the pin cells readOnly
  final bool readOnly;

  /// Enable auto unfocus
  final bool autoUnfocus;

  /// Builds separator children
  final IndexedWidgetBuilder? separatorBuilder;

  final EdgeInsetsGeometry? padding;

  OtpTextField({
    super.key,
    required this.appContext,
    required this.length,
    this.controller,
    this.obscureText = false,
    this.obscuringCharacter = '●',
    this.obscuringWidget,
    this.blinkWhenObscuring = false,
    this.blinkDuration = const Duration(milliseconds: 500),
    this.onChanged,
    this.onCompleted,
    this.backgroundColor,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.animationDuration = const Duration(milliseconds: 150),
    this.animationCurve = Curves.easeInOut,
    this.animationType = AnimationType.slide,
    this.keyboardType = TextInputType.visiblePassword,
    this.autoFocus = false,
    this.focusNode,
    this.onTap,
    this.enabled = true,
    this.inputFormatters = const <TextInputFormatter>[],
    this.textStyle,
    this.useHapticFeedback = false,
    this.hapticFeedbackTypes = HapticFeedbackTypes.light,
    this.pastedTextStyle,
    this.enableActiveFill = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.autoDismissKeyboard = true,
    this.autoDisposeControllers = true,
    this.onSubmitted,
    this.onEditingComplete,
    this.errorAnimationController,
    this.beforeTextPaste,
    this.dialogConfig,
    this.pinTheme,
    this.keyboardAppearance,
    this.validator,
    this.onSaved,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.errorTextSpace = 16,
    this.errorTextDirection = TextDirection.ltr,
    this.errorTextMargin = EdgeInsets.zero,
    this.enablePinAutofill = true,
    this.errorAnimationDuration = 500,
    this.boxShadows,
    this.showCursor = true,
    this.cursorColor,
    this.cursorWidth = 2,
    this.cursorHeight,
    this.hintCharacter,
    this.hintStyle,
    this.textGradient,
    this.readOnly = false,
    this.autoUnfocus = true,

    /// Default for [AutofillGroup]
    this.onAutoFillDisposeAction = AutofillContextAction.commit,

    /// Default create internal [AutofillGroup]
    this.useExternalAutoFillGroup = false,
    this.scrollPadding = const EdgeInsets.all(20),
    this.separatorBuilder,
    this.padding,
  }) : assert(obscuringCharacter.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    final textFieldStyle = AppTheme.of(context).textFieldStyle;

    Widget child = PinCodeTextField(
      appContext: appContext,
      length: length,
      controller: controller,
      obscureText: obscureText,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      autoFocus: autoFocus,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      enabled: enabled,
      onCompleted: onCompleted,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      errorAnimationController: errorAnimationController,
      beforeTextPaste: beforeTextPaste,
      onTap: onTap,
      dialogConfig: dialogConfig,
      pinTheme:
          pinTheme ??
          PinTheme(
            borderRadius: BorderRadius.circular(4.r),
            activeFillColor: textFieldStyle.textFillColor,
            inactiveFillColor: textFieldStyle.textFillColor,
            selectedFillColor: textFieldStyle.textFillColor,
            activeColor: textFieldStyle.blackColor,
            inactiveColor: textFieldStyle.blackColor,
            selectedColor: textFieldStyle.blackColor,
            shape: PinCodeFieldShape.box,
            fieldHeight: 50.h,
            fieldWidth: 50.w,
            borderWidth: 1.w,
            activeBorderWidth: 1.w,
            inactiveBorderWidth: 1.w,
            selectedBorderWidth: 1.w,
            disabledBorderWidth: 1.w,
            errorBorderColor: textFieldStyle.errorBorderColor,
            errorBorderWidth: 1.w,
          ),
      keyboardAppearance: keyboardAppearance,
      validator: validator,
      onSaved: onSaved,
      autovalidateMode: autovalidateMode,
      errorTextSpace: errorTextSpace,
      errorTextMargin: errorTextMargin,
      errorTextDirection: errorTextDirection,
      enablePinAutofill: enablePinAutofill,
      errorAnimationDuration: errorAnimationDuration,
      boxShadows: boxShadows,
      showCursor: showCursor,
      cursorColor: cursorColor ?? textFieldStyle.blackColor,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight,
      hintCharacter: hintCharacter,
      textGradient: textGradient,
      readOnly: readOnly,
      autoUnfocus: autoUnfocus,
      onAutoFillDisposeAction: onAutoFillDisposeAction,
      useExternalAutoFillGroup: useExternalAutoFillGroup,
      scrollPadding: scrollPadding,
      separatorBuilder: separatorBuilder,
      hintStyle: textFieldStyle.hintStyle.merge(hintStyle),
      textStyle: textFieldStyle.textStyle.merge(textStyle),
      pastedTextStyle: textFieldStyle.textStyle.merge(pastedTextStyle),
      backgroundColor: backgroundColor,
      mainAxisAlignment: mainAxisAlignment,
      animationType: animationType,
      animationDuration: animationDuration,
      animationCurve: animationCurve,
      useHapticFeedback: useHapticFeedback,
      hapticFeedbackTypes: hapticFeedbackTypes,
      blinkWhenObscuring: blinkWhenObscuring,
      blinkDuration: blinkDuration,
      obscuringCharacter: obscuringCharacter,
      obscuringWidget: obscuringWidget,
      textInputAction: textInputAction,
      autoDismissKeyboard: autoDismissKeyboard,
      autoDisposeControllers: autoDisposeControllers,
      enableActiveFill: enableActiveFill,
      onSubmitted: onSubmitted,
    );

    if (padding != null) {
      child = Padding(padding: padding!, child: child);
    }

    return child;
  }
}
