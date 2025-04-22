import 'package:taza/taza.dart';

class SmartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final String? leadingImage;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? appBarHeight;
  final VoidCallback? onBack;
  final VoidCallback? onSearch;
  final VoidCallback? onFavorite;
  final Widget? child;
  final TextStyle? titleStyle;
  final bool isCenter;
  final bool isBack;
  final bool isSkip;
  final bool isBorder;
  final double? optionalEndSpacing;
  final EdgeInsets? padding;
  final bool? showHomeWithAddress;
  final bool? showTitleAndSubtitle;
  final Color? backIconColor;
  final Widget? flexibleSpace;
  final List<PopupMenuEntry> Function(BuildContext)?  popupMenuItemBuilder;
  SmartAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.leadingImage,
    this.actions,
    this.backgroundColor,
    this.onSearch,
    this.onFavorite,
    this.titleStyle,
    this.isCenter = false,
    this.isBack = true,
    this.isBorder = false,
    this.padding,
    this.appBarHeight,
    this.onBack,
    this.child,
    this.optionalEndSpacing,
    this.isSkip = false,
    this.showHomeWithAddress,
    this.showTitleAndSubtitle,
    this.flexibleSpace,
    this.backIconColor,
    this.popupMenuItemBuilder
  }) {
    if (isSkip) {
      if (!isBack) {
        throw Exception('if isSkip is set to true then isBack must be set to true');
      }
      if (onBack == null) {
        throw Exception('if isSkip is set to true then onBack must be set');
      }
    }
  }

  final double height = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    final CustomAppBarStyle style = AppTheme.of(context).appBarStyle;
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: isCenter,
      backgroundColor: backgroundColor ?? style.backgroundColor,
      surfaceTintColor: backgroundColor ?? style.backgroundColor,
      toolbarHeight: appBarHeight ?? 72.h,
      elevation: 0,
      titleSpacing: 0,
      title: _buildTitle(style, context),

      actions: _buildActions(),
      bottom: isBorder ? PreferredSize(preferredSize: Size.fromHeight(2.h), child: SmartGradientContainer()) : null,
      flexibleSpace: flexibleSpace,
    );
  }

  Widget leadingIcon(BuildContext context, CustomAppBarStyle style) {
    if (!isBack && leadingImage?.isNotEmpty == true) {
      return SmartImage(path: leadingImage!, height: 22.h, width: 17.w);
    } else if (isBack) {
      return SmartRow(
        onTap: onBack ?? () => Get.back(),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        color: style.transparentColor,
        children: [
          SizedBox(width: 6.w),
          if (isSkip) SmartText(isSkip ? LocaleKeys.skip.tr : LocaleKeys.back.tr, style: style.backTextStyle),
          Icon(Icons.arrow_back_rounded, color: backIconColor ?? style.primaryColor),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildTitle(CustomAppBarStyle style, BuildContext context) {
    return SmartRow(
      mainAxisAlignment: isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        if (!isBack) SizedBox(width: 20.w),
        leadingIcon(context, style),
        if (leadingImage.isNotNullNorEmpty) SmartImage(path: leadingImage!, height: 36.h, width: 36.w),
        if (titleWidget != null) SizedBox(child: titleWidget),
        if ((isBack || leadingImage?.isNotEmpty == true) && title != null) SizedBox(width: 6.w),
        if (title != null)
          Expanded(
            child: SmartText(
              textAlign: isCenter ? TextAlign.center : TextAlign.start,
              title!,
              style: style.titleStyle.merge(titleStyle),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        if (showHomeWithAddress == true)
          Expanded(
            child: IntrinsicHeight(
              child: SmartRow(
                spacing: 4.w,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SmartImage(path: AppImages.icHome, height: 22.h, width: 17.w),
                  SmartText(LocaleKeys.home.tr, style: style.homeTitleStyle, maxLines: 1, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 18.h, child: VerticalDivider(color: style.dividerColor)),
                  SmartText(
                    "Al Tadamun Al Arabi St., Mishfirah, Jeddah KSA",
                    style: style.subTitleStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    isFlexible: true,
                  ),
                  SmartImage(path: AppImages.icArrowDown, height: 16.w, width: 16.w),
                  PopupMenuButton(
                    offset: Offset(0, 40.h),
                    itemBuilder: popupMenuItemBuilder??(context) => [],shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    side: BorderSide(color: style.dividerColor)

                  ),color: style.backgroundColor,)
                ],
              ),
            ),
          ),
        if (showTitleAndSubtitle == true)
          SmartColumn(
            padding: EdgeInsetsDirectional.only(start: 20.w),
            children: [
              SmartText(LocaleKeys.packingYourOrder.tr, style: style.groupTitleStyle),
              SmartText(LocaleKeys.arrivingInMinutes.tr, style: style.groupSubTitleStyle),
            ],
          ),
      ],
    );
  }

  List<Widget> _buildActions() {
    final List<Widget> actionsList = [];
    if (onSearch != null) {
      actionsList.add(_buildIconButton(onSearch!, AppImages.icHome, size: 24.w));
    }
    if (onFavorite != null) {
      actionsList.add(_buildIconButton(onFavorite!, AppImages.icHome, size: 24.w));
    }
    if (actions != null) actionsList.add(SizedBox(width: 17.w));
    actionsList.addAll(actions ?? []);
    if (optionalEndSpacing != null) {
      actionsList.add(SizedBox(width: optionalEndSpacing));
    }
    return actionsList;
  }

  Widget _buildIconButton(VoidCallback onTap, String assetPath, {double? size}) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: size?.w,
          width: size?.w,
          child: Center(child: SmartImage(path: assetPath, height: size?.w, width: size?.w)),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? height);
}
