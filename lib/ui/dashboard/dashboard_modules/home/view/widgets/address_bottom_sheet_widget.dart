import 'package:taza/taza.dart';

class AddressBottomSheet extends StatelessWidget {
  final List<Map<String, dynamic>> addresses;

  const AddressBottomSheet({super.key, required this.addresses});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).addressBottomSheetStyle;
    return SafeArea(
      child: SmartSingleChildScrollView(
        padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 16.w),
        child: SmartColumn(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 5.h,
                width: 50.w,
                margin: EdgeInsetsDirectional.only(bottom: 16.w),
                decoration: BoxDecoration(
                  color: style.textFieldBgColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ),
            SmartText(
              LocaleKeys.selectDeliveryAddress.tr,
              style: style.addressBottomSheetTagTitleStyle,
            ),
            SizedBox(height: 16.h),
            SmartColumn(
              children:
                  addresses
                      .map(
                        (address) => _buildAddressTile(
                          name: address['name'] ?? "",
                          pinCode: address['pincode'] ?? "",
                          tag: address['tag'] ?? "",
                          fullAddress: address['address'] ?? "",
                          style: style,
                          onTap: () {},
                        ),
                      )
                      .toList(),
            ),
            Divider(height: 32.h),
            SmartText(
              LocaleKeys.usePinCode.tr,
              style: style.addressBottomSheetTagTitleStyle,
            ),
            SizedBox(height: 12.h),
            SmartRow(
              children: [
                Expanded(
                  child: SmartTextField(
                    color: style.textFieldBgColor,
                    hintText: LocaleKeys.enterPinCode.tr,
                    hintStyle: style.addressBottomSheetTitleStyle,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 8.w),
                SmartButton(
                  height: 46.h,
                  width: 80.w,
                  onTap: () {},
                  title: LocaleKeys.submit.tr,
                  borderRadius: BorderRadius.circular(12.r),
                  titleStyle: style.addressBottomSheetTagTitleStyle,
                  activeBackgroundColor: style.submitButtonBgColor,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Center(
              child: SmartRow(
                onTap: (){
                  Get.back();
                },
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.my_location,
                    size: 20.w,
                    color: style.submitButtonBgColor,
                  ),
                  SizedBox(width: 6.h),
                  SmartText(
                    LocaleKeys.useMyLocation.tr,
                    style: style.addressBottomSheetTagTitleStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressTile({
    required String name,
    required String pinCode,
    required String tag,
    required String fullAddress,
    required VoidCallback onTap,
    required AddressStyle style,
  }) {
    return SmartRow(
      onTap: onTap,
      padding: EdgeInsetsDirectional.all(12.w),
      margin: EdgeInsetsDirectional.only(bottom: 12.w),
      decoration: BoxDecoration(
        color: style.textFieldBgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      children: [
        Icon(Icons.location_on_outlined, color: style.submitButtonBgColor),
        SizedBox(width: 12.w),
        SmartColumn(
          expanded: true,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmartRow(
              children: [
                SmartText(
                  "$name, $pinCode",
                  style: style.addressBottomSheetTagTitleStyle,
                ),
                SizedBox(width: 6.w),
                Container(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 6.w,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: style.textFieldBgColor,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: SmartText(
                    tag,
                    style: style.addressBottomSheetTagTitleStyle,
                  ),
                ),],
            ),
            SizedBox(height: 4.h),
            SmartText(
              fullAddress,
              overflow: TextOverflow.ellipsis,
              style: style.addressBottomSheetTitleStyle,
            ),
          ],
        ),
      ],
    );
  }
}
