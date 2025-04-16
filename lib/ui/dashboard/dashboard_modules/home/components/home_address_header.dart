import 'package:taza/taza.dart';

class HomeAddressHeader extends StatelessWidget {
  final VoidCallback onAddressTap;
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
    required this.onAddressTap,
    required this.address,
    required this.addressTypeTag,
    this.homeIcon,
    this.dropDownIcon,
    this.userImagePath,
    this.userImageWidth,
    this.userImageHeight,
    this.padding
    this.backGroundColor,
    this.textColor,
    this.homeIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).homeHeaderStyle;

    return SmartRow(
      padding: padding   ,
      decoration: BoxDecoration(color: backGroundColor),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartColumn(
          expanded: true,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmartRow(
              children: [
                SmartImage(path: homeIcon ?? AppImages.icHome, color: homeIconColor),
                SizedBox(width: 8.h),
                SmartText(addressTypeTag, style: style.addressTagTitleStyle.copyWith(color: textColor)),
                SizedBox(width: 6.h),
                SmartImage(path: dropDownIcon ?? AppImages.icArrowDropDown, onTap: onAddressTap, color: textColor),
              ],
            ),
            SizedBox(height: 3.h),
            SmartText(address, style: textColor != null ? style.addressTitleStyle.copyWith(color: textColor) : style.addressTitleStyle),
          ],
        ),
        userImagePath != null
            ? SmartImage(path: userImagePath ?? "", width: userImageWidth ?? 40.w, height: userImageHeight ?? 40.h, fit: BoxFit.cover,onTap: () => Get.toNamed(AppRoutes.profilePage),)
            : SmartImage(path: AppImages.icUser, width: 32.w, height: 32.h,onTap: () => Get.toNamed(AppRoutes.profilePage),),
      ],
    );
  }
}
