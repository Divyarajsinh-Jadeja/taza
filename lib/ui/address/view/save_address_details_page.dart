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
                        "USA",
                        style: style.blackColorStyle,
                        maxLines: 2,
                        isExpanded: true,
                      ),

                    ],
                  ),
                  SmartText(
                    "1600 Amphitheatre Parkway, Mountain View, CA 94043",
                    style: style.addressBottomSheetTitleStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.h,),
                  SmartTextField(
                    inputDecorationLabelText: LocaleKeys.houseFlatFloor.tr,
                    controller: controller.houseController,),
                  SizedBox(height: 10.h,),
                  SmartTextField(
                      inputDecorationLabelText: LocaleKeys.enterAreaOrApartment.tr,
                      controller: controller.apartmentController),
                  SizedBox(height: 10.h,),
                  SmartTextField(
                      inputDecorationLabelText: LocaleKeys.directionToReach.tr,
                      maxLines: 3,
                      hintText: LocaleKeys.instructionDontRingBell.tr,
                      controller: controller.directionController),
                  SizedBox(height: 10.h,),
                  SmartText(
                    LocaleKeys.saveAs.tr,
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
                            label: LocaleKeys.home.tr),
                        _buildSaveAsChip(style, icon: Icons.business_center,
                            label: LocaleKeys.office.tr),
                        _buildSaveAsChip(style, icon: Icons.work,
                            label: LocaleKeys.work.tr),
                        _buildSaveAsChip(style, icon: Icons.group,
                            label:LocaleKeys.friendsAndFamily.tr),
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
    return SmartRow(
      onTap: () {
        controller.onSaveAsChanged(label);
      },

      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: isSelected ? style
          .selectedChipDecoration : style.unSelectedChipDecoration,

      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isSelected? style.primaryColor:style.iconColor, size: 16.w),
        SizedBox(width: 6.w),
        SmartText(label, style: isSelected?style.selectedStyle:style.unSelectedStyle),
      ],
    );
  }

}
