import 'package:taza/taza.dart';

class SmartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
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

  SmartAppBar({
    super.key,
    this.title,
    this.leadingImage,
    this.actions,
    this.backgroundColor,
    this.onSearch,
    this.onFavorite,
    this.titleStyle,
    this.isCenter = false,
    this.isBack = true,
    this.isBorder = true,
    this.padding,
    this.appBarHeight,
    this.onBack,
    this.child,
    this.optionalEndSpacing,
    this.isSkip = false,
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
      //bottom: isBorder ? PreferredSize(preferredSize: Size.fromHeight(2.h), child: SmartGradientContainer()) : null,
    );
  }

  Widget leadingIcon(BuildContext context, CustomAppBarStyle style) {
    if (!isBack && leadingImage?.isNotEmpty == true) {
      return SmartImage(
        path: leadingImage!,
        height: 22.h,
        width: 17.w,
      );
    } else if (isBack) {
      return SmartRow(
        onTap: onBack ?? () => Get.back(),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        color: style.transparentColor,
        children: [
          Opacity(
            opacity: isSkip ? 0 : 1,
            child: SmartImage(path: AppImages.icBack),
          ),
          SizedBox(width: 6.w),
          if(isSkip)SmartText(
            isSkip ? LocaleKeys.skip.tr : LocaleKeys.back.tr,
            style: style.backTextStyle,
          ),
          Icon(Icons.arrow_back_rounded,color: colors(context).color00BAB3,)
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
      ],
    );
  }

  List<Widget> _buildActions() {
    final List<Widget> actionsList = [];
    if (onSearch != null) actionsList.add(_buildIconButton(onSearch!, AppImages.icSearch, size: 24));
    if (onFavorite != null) actionsList.add(_buildIconButton(onFavorite!, AppImages.icHeart, size: 24));
    if (actions != null) actionsList.add(SizedBox(width: 17.w));
    actionsList.addAll(actions ?? []);
    if (optionalEndSpacing != null) actionsList.add(SizedBox(width: optionalEndSpacing));
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
          child: Center(
            child: SmartImage(
              path: assetPath,
              height: size?.w,
              width: size?.w,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? height);
}
