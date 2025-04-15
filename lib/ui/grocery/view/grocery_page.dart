import 'package:taza/taza.dart';

class GroceryPage extends GetView<GroceryController> {
  const GroceryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).groceryStyle;
    return Scaffold(
      body: SafeArea(
        child: SmartSingleChildScrollView(
          child: SmartColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            children: [
              HomeAddressHeader(
                onAddressTap: () {},
                addressTypeTag: LocaleKeys.home.tr,
                address: "Al Tadamun Al Arabi St., Mishfirah, Jeddah KSA",
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Obx(() {
                  return SmartSearchBar(
                    items: [controller.hints[controller.currentHintIndex.value]],
                    controller: controller.searchController,
                    onChanged: (val) {},
                    suffixIcon: SmartRow(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SmartImage(
                          path: AppImages.icSearch,
                          height: 24.w,
                          width: 24.w,
                        ),
                        Container(
                          height: 21.h,
                          width: 1.w,
                          margin: EdgeInsetsDirectional.symmetric(
                            horizontal: 8.w,
                          ),
                          color:
                              AppTheme.of(
                                context,
                              ).searchBarStyle.searchBarBorderColor,
                        ),
                        SmartImage(
                          path: AppImages.icMic,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(height: 10.h),

              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.groceryList.length,
                itemBuilder: (context, index) => SmartColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    padding: EdgeInsetsDirectional.only(bottom: 30.h),
                    mainAxisSize: MainAxisSize.min,children: [
                  SmartText(controller.groceryList[index].name, style: style.titleStyle),
                  SizedBox(height: 10.h),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: controller.groceryList[index].subCategories.length, // or controller.items.length
                    itemBuilder: (context, gridIndex) {
                      SubCategoryModel subCategoryModel = controller.groceryList[index].subCategories[gridIndex];
                      return _buildCategoryCard(subCategoryModel,style);
                    },
                  ),

                ]),),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(SubCategoryModel model,GroceryStyle style) {
    return SmartColumn(
      mainAxisSize: MainAxisSize.min,
      decoration: style.groceryCardDecoration,
      padding: EdgeInsets.all(8.w),
      children: [
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: List.generate(4, (i) {
            return SmartImage(
              size: 40.w,
              path: model.foods[i].imageUrl,
              fit: BoxFit.cover,
              imageBorderRadius: BorderRadius.circular(12.r),
              clipBehavior: Clip.antiAlias,
            );
          }),
        ),
        SizedBox(height: 4.h),
        SmartText(
          model.name,
          textAlign: TextAlign.center,
          style: style.subTitleStyle,
          optionalPadding: EdgeInsetsDirectional.symmetric(horizontal: 4.h),
        ),
      ],
    );
  }
}
