import 'package:taza/taza.dart';

class SaveAddressDetailsPage extends GetView<AddressController> {
  const SaveAddressDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var style = AppTheme
        .of(context)
        .addressBottomSheetStyle;
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            SmartImage(
              path: AppImages.mapLocation,
              width: Get.width,
              height: Get.height * 0.3,
            ),
            Container(color: style.iconColor.withValues(alpha: 0.4),
              height: Get.height * 0.3,),

            Align(
              alignment: Alignment.bottomCenter,
              child: SmartColumn(
                height: Get.height * 0.75,
                decoration: style.addressBottomDecoration,
                mainAxisSize: MainAxisSize.min,
                spacing: 10.h,
                padding: EdgeInsetsDirectional.all(20.w),
                crossAxisAlignment: CrossAxisAlignment.start,
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

                    ],
                  ),
                  SmartText(
                    "THE FIRST, C-1401, near Mansi Circle, Vastrapur, Ahmedabad, Gujarat 380015",
                    style: style.addressBottomSheetTitleStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.h,),
                  SmartTextField(
                    inputDecorationLabelText: "HOUSE / FLAT / FLOOR NO.",
                    controller: controller.houseController,),
                  SizedBox(height: 10.h,),
                  SmartTextField(
                      inputDecorationLabelText: "APARTMENT / ROAD / AREA",
                      controller: controller.apartmentController),
                  SizedBox(height: 10.h,),
                  SmartTextField(
                      inputDecorationLabelText: "DIRECTION TO REACH(OPTIONAL)",
                      maxLines: 3,
                      hintText: "e.g Ring the bell",
                      controller: controller.directionController),
                  SizedBox(height: 10.h,),
                  SmartText(
                    "SAVE AS",
                    style: style.addressBottomSheetTitleStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Obx(() {
                    return Wrap(
                      spacing: 12.w,
                      runSpacing: 12.h,
                      children: [
                        _buildSaveAsChip(style, icon: Icons.home,
                            label: "Home"),
                        _buildSaveAsChip(style, icon: Icons.business_center,
                            label: "Office"),
                        _buildSaveAsChip(style, icon: Icons.work,
                            label: "Work"),
                        _buildSaveAsChip(style, icon: Icons.group,
                            label: "Friends and Family"),
                      ],
                    );
                  }),

                  Spacer(),
                  SmartButton(onTap: () {
                    Get.offAllNamed(AppRoutes.dashboardPage);
                  }, title: LocaleKeys.confirmLocation.tr),

                ],
              ),
            ),

            PositionedDirectional(
              start: 10.w,
              top: 30.h,
              child: InkWell(
                onTap: () => Get.back(),
                child: CircleAvatar(
                  backgroundColor: style.backBackgroundColor,
                  child: Icon(Icons.arrow_back_rounded),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveAsChip(AddressStyle style,
      {required IconData icon, required String label}) {
    bool isSelected = label==controller.selectedLabel.value;
    return InkWell(
      onTap: () {
        controller.onSaveAsChanged(label);
      },
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: isSelected ? style
            .selectedChipDecoration : style.unSelectedChipDecoration,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected? style.primaryColor:style.iconColor, size: 16.w),
            SizedBox(width: 6.w),
            SmartText(label, style: isSelected?style.selectedStyle:style.unSelectedStyle),
          ],
        ),
      ),
    );
  }

}
