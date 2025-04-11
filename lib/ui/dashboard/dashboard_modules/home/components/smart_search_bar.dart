import 'package:taza/taza.dart';

class SmartSearchBar extends StatelessWidget {
  final List<String>? items;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;

  const SmartSearchBar({
    super.key,
    this.items,
    this.controller,
    this.focusNode,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTheme
        .of(context)
        .searchBarStyle;
    return SmartRow(
      padding: EdgeInsetsDirectional.only(end: 8.w),
      decoration: BoxDecoration(
        color: backgroundColor ?? style.searchBarBgColor,
        border: Border.all(color: borderColor ?? style.searchBarBorderColor),
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
      ),
      children: [
        Expanded(
          child: SmartTextField.search(
            controller: controller,
            padding: EdgeInsets.symmetric(vertical: 6.h),
            suffixIcon: suffixIcon ?? SizedBox(),
            hintText: "",
            hintStyle: hintStyle ?? style.searchBarHintStyle,
            style: textStyle ?? style.searchBarTextStyle,
            color: Colors.transparent,
            autofocus: false,
            enabledBorderRadius: 12.r,
            focusNode: focusNode,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            customEnabledBorder: InputBorder.none,
            customDisabledBorder: InputBorder.none,
            customFocusedBorder: InputBorder.none,
            borderRadius: BorderRadius.zero,
            enabledBorderColor: Colors.transparent,
            disabledBorderColor: Colors.transparent,
            onValueChanges: onChanged,
          ).stackHintOverlay(context, items, style),
        ),
      ],
    );
  }
}

extension on SmartTextField {
  Widget stackHintOverlay(BuildContext context, List<String>? items,
      SearchBarStyle style,) {
    final hintText = items?.isNotEmpty == true ? items?.first : '';
    final controller = this.controller ?? TextEditingController();

    return ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller,
        builder: (context, value, child) {
          final hasText = value.text
              .trim()
              .isNotEmpty;
          return Stack(
            alignment: Alignment.centerLeft,
            children: [
              if(!hasText)
                SmartRow(
                  mainAxisAlignment: MainAxisAlignment.start,
                  padding: EdgeInsetsDirectional.only(start: 14.w),
                  children: [
                    SmartText(
                      LocaleKeys.searchFor.tr,
                      style: style.searchBarHintStyle,
                    ),
                    SmartAnimator(
                      animateFadeIn: true,
                      animateSlideY: true,
                      slideYBegin: const Offset(0, 0.1),
                      animationDuration: const Duration(milliseconds: 500),
                      animationCurve: Curves.easeOut,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        switchInCurve: Curves.easeOut,
                        switchOutCurve: Curves.easeIn,
                        transitionBuilder: (Widget child,
                            Animation<double> animation) {
                          final inAnimation = Tween<Offset>(
                            begin: Offset(0, 1),
                            end: Offset.zero,
                          ).animate(animation);
                          final outAnimation = Tween<Offset>(
                            begin: Offset(0, -1),
                            end: Offset(0, 0),
                          ).animate(animation);
                          final isEntering = child.key == ValueKey(hintText);
                          return ClipRect(
                            child: SlideTransition(
                              position: isEntering ? inAnimation : outAnimation,
                              child: child,
                            ),
                          );
                        },
                        child: SmartText(
                          "'$hintText'",
                          key: ValueKey(hintText), // This triggers the switch
                          textAlign: TextAlign.left,
                          style: style.searchBarHintStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              this,
            ],
          );
        });
  }
}
