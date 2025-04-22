import 'package:taza/taza.dart';

class SelectDeliveryLocationPage extends GetView<AddressController> {
  const SelectDeliveryLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).addressBottomSheetStyle;
    return Scaffold(
      appBar: SmartAppBar(
        title: LocaleKeys.selectDeliveryLocation.tr,
        titleStyle: style.addressBottomSheetTagTitleStyle,
      ),
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            SmartImage(
              path: AppImages.mapLocation,
              width: Get.width,
              height: Get.height * 0.7,
            ),

            /// Top searchbar
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              child: SmartTextField.search(
                hintText: "Try J P Nagar,Andheri etc..",
                isSearchWithPrefix: true,
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: SmartColumn(
                height: Get.height * 0.25,
                decoration: style.addressBottomDecoration,
                mainAxisSize: MainAxisSize.min,
                spacing: 20.h,
                padding: EdgeInsetsDirectional.all(20.w),
                children: [
                  SmartRow(
                    spacing: 8.w,
                    children: [
                      Icon(
                        CupertinoIcons.location_fill,
                        color: style.primaryColor,
                      ),
                      SmartText(
                        "Ahmedabad",
                        style: style.blackColorStyle,
                        maxLines: 2,
                        isExpanded: true,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: style.primaryColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: SmartText(
                          LocaleKeys.change.tr,
                          style: style.currentlySelectedStyle,
                          optionalPadding: EdgeInsetsDirectional.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SmartText(
                    "THE FIRST, C-1401, near Mansi Circle, Vastrapur, Ahmedabad, Gujarat 380015",
                    style: style.addressBottomSheetTitleStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SmartButton(onTap: () {Get.toNamed(AppRoutes.saveAddressDetailsPage);}, title: LocaleKeys.confirmLocation.tr),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
