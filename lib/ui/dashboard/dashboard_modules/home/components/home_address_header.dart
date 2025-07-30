import 'package:taza/taza.dart';

class HomeAddressHeader extends StatelessWidget {
  final String address;
  final String addressTypeTag;
  final String? homeIcon;
  final String? dropDownIcon;
  final String? userImagePath;
  final double? userImageWidth;
  final double? userImageHeight;
  final EdgeInsetsGeometry? padding;
  final Color? backGroundColor;
  final Color? textColor;
  final Color? homeIconColor;
  final bool? showSubscriptionIcon;
  final VoidCallback? onBackPressed;

  const HomeAddressHeader({
    super.key,
    required this.address,
    required this.addressTypeTag,
    this.homeIcon,
    this.dropDownIcon,
    this.userImagePath,
    this.userImageWidth,
    this.userImageHeight,
    this.padding,
    this.backGroundColor,
    this.textColor,
    this.showSubscriptionIcon,
    this.homeIconColor,
    this.onBackPressed
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).homeHeaderStyle;

    return SmartRow(
      padding: padding,
      decoration: BoxDecoration(color: backGroundColor),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmartColumn(
          onTap: () => Get.toNamed(AppRoutes.addressPage),
          expanded: true,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmartRow(
              children: [
                SmartImage(path: homeIcon ?? AppImages.icHome, color: homeIconColor, onTap: onBackPressed,),
                SizedBox(width: 8.h),
                SmartText(addressTypeTag, style: style.addressTagTitleStyle.copyWith(color: textColor)),
                SizedBox(width: 6.h),
                SmartImage(path: dropDownIcon ?? AppImages.icArrowDropDown,  color: textColor),
              ],
            ),
            SizedBox(height: 3.h),
            SmartText(address, style: textColor != null ? style.addressTitleStyle.copyWith(color: textColor) : style.addressTitleStyle, overflow: TextOverflow.ellipsis,),
          ],
        ),
        if(showSubscriptionIcon == true)
        SmartImage(
          onTap: (){
            Get.toNamed(AppRoutes.subscriptionPage);
          },
            path: "assets/images/dollar.json",  width: 60.w,),
        userImagePath != null
            ? SmartImage(path: userImagePath ?? "", width: userImageWidth ?? 40.w, fit: BoxFit.cover,onTap: () => Get.toNamed(AppRoutes.profilePage), padding: EdgeInsetsDirectional.only(top: 10.h),)
            : SmartImage(path: AppImages.icUser, width: 40.w, onTap: () => Get.toNamed(AppRoutes.profilePage)),
      ],
    );
  }
}
