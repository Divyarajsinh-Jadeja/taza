import 'package:taza/taza.dart';

class CategoryPageDashboard extends GetView<CategoryDashboardController> {
  const CategoryPageDashboard({super.key});
  final bool isFromInstamart = true;

  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).groceryStyle;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: SmartAppBar(
          title: LocaleKeys.categories.tr,
          titleStyle: style.pageTitle,
          isBack: false,
          actions: [
            SmartImage(path: AppImages.icSearch, padding: EdgeInsetsDirectional.only(end: 16.w, start: 0.w),),
          ],
        ),
        body: SafeArea(
          child: SmartSingleChildScrollView(
            child: SmartColumn(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              padding: EdgeInsetsDirectional.symmetric(horizontal: 18.w),
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.groceryList.length,
                  itemBuilder: (context, index) => SmartColumn(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      padding: EdgeInsetsDirectional.only(bottom: 20.h),
                      mainAxisSize: MainAxisSize.min,children: [
                    SizedBox(height: 2.h),
                    SmartRow(
                      spacing: 6.w,
                      children: [
                        SmartText(
                            controller.groceryList[index].name!.toUpperCase() ,
                            style: style.titleStyle
                        ),
                        Expanded(child: Container(height: 1.h, color: style.groceryCardDecoration.color,))
                      ],
                    ),
                    SizedBox(height: 12.h),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 20.h,
                        childAspectRatio: 0.55,
                      ),
                      itemCount: controller.groceryList[index].subCategories!.length, // or controller.items.length
                      itemBuilder: (context, gridIndex) {
                        SubCategoriesModel subCategoriesModel = controller.groceryList[index].subCategories![gridIndex];
                        return _buildCategoryCard(subCategoriesModel,style);
                      },
                    ),
                  ]),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(SubCategoriesModel model,GroceryStyle style) {
    return SmartColumn(
      children: [
        SmartImage(
          onTap: (){Get.toNamed(AppRoutes.categoryPage,arguments: isFromInstamart);},
          decoration: style.groceryCardDecoration,
          path: model.categoryUrl!,
          height: 90.h,
          width: 120.w,
          fit: BoxFit.contain,
          imageBorderRadius: BorderRadius.circular(12.r),
        ),
        SizedBox(height: 10.h),
        SmartText(
          model.name,
          isExpanded: true,
          textAlign: TextAlign.center,
          style: style.subTitleStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          optionalPadding: EdgeInsetsDirectional.symmetric(horizontal: 4.h),
        ),
      ],
    );
  }
}
