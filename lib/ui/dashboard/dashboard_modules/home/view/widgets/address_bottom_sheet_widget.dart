import 'package:taza/taza.dart';

class AddressBottomSheet extends StatelessWidget {
  final RxList<Map<String, dynamic>> addresses;
  const AddressBottomSheet({super.key, required this.addresses});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).addressBottomSheetStyle;
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 16.w,
        end: 16.w,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16.w,
        top: 16.w,
      ),
      child: SmartSingleChildScrollView(
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
            Obx(() => SmartColumn(
              children: addresses.map((address) => _buildAddressTile(
                name: address['name'] ?? "",
                pincode: address['pincode'] ?? "",
                tag: address['tag'] ?? "",
                fullAddress: address['address'] ?? "",
                style: style,
                onTap: () {},
              )).toList(),
            )),
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
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: style.submitButtonBgColor,
                    foregroundColor: style.textFieldBgColor,
                    padding:
                    EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 14.h),
                  ),
                  child: SmartText("Submit",
                    style: style.addressBottomSheetTitleStyle),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Center(
              child: InkWell(
                onTap: () {
                  Get.back();
                  // Handle location
                },
                child: SmartRow(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.my_location, size: 20.w, color: style.submitButtonBgColor),
                    SizedBox(width: 6.h),
                    SmartText(
                      LocaleKeys.useMyLocation.tr,
                      style: style.addressBottomSheetTagTitleStyle,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAddressTile({
    required String name,
    required String pincode,
    required String tag,
    required String fullAddress,
    required VoidCallback onTap, required AddressBottomSheetStyle style,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsetsDirectional.all(12.w),
        margin: EdgeInsetsDirectional.only(bottom: 12.w),
        decoration: BoxDecoration(
          color: AppThemes().appColor.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: SmartRow(
          children: [
            Icon(Icons.location_on_outlined, color: AppThemes().appColor.primary),
            SizedBox(width: 12.w),
            Expanded(
              child: SmartColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmartRow(
                    children: [
                      SmartText(
                        "$name, $pincode",
                        style: style.addressBottomSheetTagTitleStyle,
                      ),
                      SizedBox(width: 6.w),
                      Container(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: style.textFieldBgColor,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: SmartText(
                          tag,
                          style: style.addressBottomSheetTagTitleStyle
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 4.h),
                  SmartText(
                    fullAddress,
                    overflow: TextOverflow.ellipsis,
                    style: style.addressBottomSheetTitleStyle,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
