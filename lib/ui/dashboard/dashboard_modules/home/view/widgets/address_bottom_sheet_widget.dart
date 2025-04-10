import 'package:taza/taza.dart';

class AddressBottomSheet extends StatelessWidget {
  const AddressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> addresses = [
      {
        'name': 'Al Habeeb',
        'pincode': '382480',
        'tag': 'Home',
        'address': 'Al Tadamun Al Arabi St., Mishfirah, Jeddah',
      },
      {
        'name': 'Al Qadir',
        'pincode': '380028',
        'tag': 'Work',
        'address': 'King Abdulaziz Rd, Al-Zahra\'a, Jeddah',
      },
    ];
    final style = AppTheme.of(context).homeHeaderStyle;
    final color = AppThemes().appColor;
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 16.w,
        end: 16.w,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16.w,
        top: 16.w,
      ),
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
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          SmartText(
            "Select Delivery Address",
            style: style.addressTagTitleStyle,
          ),
          SizedBox(height: 16.h),
          ...addresses.map((address) => _buildAddressTile(
            name: address['name'] ?? "",
            pincode: address['pincode'] ?? "",
            tag: address['tag'] ?? "",
            fullAddress: address['address'] ?? "",
            style: style,
            onTap: () {
              Navigator.pop(context);
              // Handle selection
            },
          )),
          Divider(height: 32.h),
          SmartText(
            "Use pincode to check delivery info",
            style: style.addressTagTitleStyle,
          ),
          SizedBox(height: 12.h),
          SmartRow(
            children: [
              Expanded(
                child: SmartTextField(
                  color: color.white,
                  hintText: "Enter pincode",
                  hintStyle: style.addressTitleStyle,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 8.w),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: color.primary,
                  foregroundColor: color.white,
                  padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 14.h),
                ),
                child: SmartText("Submit",
                  style: style.addressTitleStyle),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: InkWell(
              onTap: () {
                // Handle location
              },
              child: SmartRow(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.my_location, size: 20.w, color: color.primary),
                  SizedBox(width: 6.h),
                  SmartText(
                    "Use my current location",
                    style: style.addressTagTitleStyle,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAddressTile({
    required String name,
    required String pincode,
    required String tag,
    required String fullAddress,
    required VoidCallback onTap, required HomeHeaderStyle style,
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
                        style: style.addressTagTitleStyle,
                      ),
                      SizedBox(width: 6.w),
                      Container(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: AppThemes().appColor.color9c9cA3,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: SmartText(
                          tag,
                          style: style.addressTagTitleStyle
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 4.h),
                  SmartText(
                    fullAddress,
                    overflow: TextOverflow.ellipsis,
                    style: style.addressTitleStyle,
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
