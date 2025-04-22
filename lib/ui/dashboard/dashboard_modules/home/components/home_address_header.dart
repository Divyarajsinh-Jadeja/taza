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
    this.homeIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).homeHeaderStyle;

    return SmartRow(
      padding: padding,
      decoration: BoxDecoration(color: backGroundColor),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartColumn(
          onTap: () => Get.toNamed(AppRoutes.addressPage),
          expanded: true,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SmartRow(
              children: [
                SmartImage(path: homeIcon ?? AppImages.icHome, color: homeIconColor),
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
        userImagePath != null
            ? SmartImage(path: userImagePath ?? "", width: userImageWidth ?? 40.w, fit: BoxFit.cover,onTap: () => Get.toNamed(AppRoutes.profilePage))
            : SmartImage(path: AppImages.icUser, width: 40.w, onTap: () => Get.toNamed(AppRoutes.profilePage)),
      ],
    );
  }
}
