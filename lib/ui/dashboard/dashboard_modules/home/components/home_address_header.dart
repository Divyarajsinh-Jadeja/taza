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
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).homeHeaderStyle;

    return SmartRow(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartColumn(
          expanded: true,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmartRow(
              children: [
                SmartImage(path : homeIcon ?? AppImages.icHome),
                SizedBox(width: 8.h),
                SmartText(
                  addressTypeTag,
                  style: style.addressTagTitleStyle,
                ),
                SizedBox(width: 6.h),
                SmartImage(path: dropDownIcon ?? AppImages.icArrowDropDown, onTap: onAddressTap),
              ],
            ),
            SizedBox(height: 3.h),
            SmartText(
              address,
              style: style.addressTitleStyle,
            ),
          ],
        ),
        if (userImagePath != null)
          SmartImage(
            path: userImagePath ?? "",
            width: userImageWidth ?? 40.w,
            height: userImageHeight ?? 40.h,
            fit: BoxFit.cover,
          )
        else
          SmartImage(path : AppImages.icUser),
      ],
    );
  }
}