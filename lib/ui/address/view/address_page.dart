import 'package:taza/taza.dart';

class AddressPage extends GetView<AddressController> {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).addressBottomSheetStyle;
    return Scaffold(
      appBar: SmartAppBar(
        title: LocaleKeys.enterAreaOrApartment.tr,
        titleStyle: style.addressBottomSheetTagTitleStyle,
      ),
      body: SmartColumn(
        height: Get.height,
        width: Get.width,
        spacing: 20.h,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 18.w,
          vertical: 10.h,
        ),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top searchbar
          SmartTextField.search(
            hintText: "1600 Amphitheatre Parkway etc...",
            isSearchWithPrefix: true,
          ),

          /// Use my current location row
          SmartRow(
            spacing: 8.w,
            onTap: () => Get.toNamed(AppRoutes.selectDeliveryLocationPage),
            children: [
              Icon(CupertinoIcons.location_fill, color: style.primaryColor),
              SmartText(
                LocaleKeys.useMyLocation.tr,
                style: style.primaryColorStyle,
                isExpanded: true,
                maxLines: 1,
              ),
              Icon(
                Icons.keyboard_arrow_right_rounded,
                color: style.primaryColor,
              ),
            ],
          ),

          Divider(),

          /// Add new address row
          SmartRow(
            spacing: 8.w,
            onTap: () => Get.toNamed(AppRoutes.selectDeliveryLocationPage),
            children: [
              Icon(CupertinoIcons.add, color: style.primaryColor),
              SmartText(
                LocaleKeys.addNewAddress.tr,
                style: style.primaryColorStyle,
                isExpanded: true,
                maxLines: 2,
              ),
              Icon(
                Icons.keyboard_arrow_right_rounded,
                color: style.primaryColor,
              ),
            ],
          ),

          Divider(),

          SmartText(
            LocaleKeys.savedAddresses.tr,
            style: style.addressBottomSheetTitleStyle,
          ),

          /// Saved Address Tile
          Expanded(
            child: ListView(
              children: List.generate(controller.usAddresses.length,
                    (index) => _buildAddressTile(style, index == 0, controller.usAddresses[index]),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildAddressTile(AddressStyle style, bool isSelected, String address) {
    return SmartColumn(
      mainAxisSize: MainAxisSize.min,
      spacing: 4.h,
      margin: EdgeInsetsDirectional.only(bottom: 20.h),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmartRow(
          spacing: 8.w,
          children: [
            Icon(CupertinoIcons.location_fill, color: style.iconColor),
            SmartText(
              "Address",
              style: style.blackColorStyle,
              maxLines: 1,
            ),
            SmartText(
              "• 20 Miles",
              style: style.addressBottomSheetTitleStyle,
              isExpanded: true,
              maxLines: 1,
            ),
            if (isSelected)
              Container(
                decoration: BoxDecoration(
                  color: style.primaryColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 4.h),
                child: SmartText(
                  LocaleKeys.currentlySelected.tr,
                  style: style.currentlySelectedStyle,
                ),
              ),
            Spacer(),
            Icon(
              Icons.more_vert_rounded,
              color: style.iconColor,
            ),
          ],
        ),
        SmartText(
          address,
          style: style.addressBottomSheetTitleStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
