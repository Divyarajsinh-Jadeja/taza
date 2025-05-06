import 'package:taza/taza.dart';

class CategorySidebar extends GetView<CategoryController> {
  final bool isFromInstamart;
  const CategorySidebar(this.isFromInstamart, {super.key});

  @override
  Widget build(BuildContext context) {
    SubCategoriesModel? categoriesModel;
    final categoryWidth = Get.width * 0.22;
    final style = AppTheme.of(context).categorySidebarStyle;
    return Container(
      width: categoryWidth,
      decoration: BoxDecoration(border: Border(right: BorderSide(width: 1.w, color: style.borderColor.withValues(alpha: 0.2)))),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: !isFromInstamart ? controller.categories.length : controller.instaMartCategories.length,
        itemBuilder: (context, index) {
          return Obx(() {
            if(isFromInstamart){
              categoriesModel = controller.instaMartCategories[index];
            }
            final CategoryModel model =  controller.categories[index];
            bool isSelected = controller.selectedCategoryIndex.value == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: categoryWidth,
              decoration: BoxDecoration(
                border: Border(left: BorderSide(width: 3.5.w, color: isSelected ? style.primaryColor : style.transparentColor)),
              ),
              child: SmartColumn(
                padding: EdgeInsetsDirectional.symmetric(vertical: 8.h, horizontal: 6.w),
                onTap: () => controller.selectCategory(index),
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: !isFromInstamart || isFromInstamart.isNull ? 'category_${model.id}' : 'category_${categoriesModel!.id}',
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: isSelected ? style.whiteColor : style.borderColor.withValues(alpha: 0.2),
                        boxShadow:
                            isSelected
                                ? [
                                  BoxShadow(
                                    color: style.shadowColor.withValues(alpha: 0.2),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(0, 1),
                                  ),
                                ]
                                : null,
                      ),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.r),
                            child: SmartImage(
                              key: !isFromInstamart ? ValueKey(model.id) : ValueKey(categoriesModel!.id),
                              path: !isFromInstamart ? model.image ?? "" : categoriesModel!.categoryUrl!,
                              height: Get.height, width: Get.width,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
                    child: SmartText(
                      key: !isFromInstamart ? ValueKey("${model.name}_$isSelected") : ValueKey("${categoriesModel!.name}_$isSelected"),
                      !isFromInstamart ? model.name : categoriesModel!.name,
                      style: isSelected ? style.selectedTitleTextStyle : style.unSelectedTitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
