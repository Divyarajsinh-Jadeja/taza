import 'package:taza/taza.dart';

class SmartCategoryRow extends StatelessWidget {
  final List<FoodCategory> categories;

  const SmartCategoryRow({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).smartCategoryRowStyle;
    return SafeArea(
      child: SizedBox(
        width: Get.width,
        height: 110.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Bounceable(
              onTap: category.onTap,
              child: SmartColumn(
                padding: EdgeInsetsDirectional.only(start: 16.w, end: index == categories.length - 1 ? 16.w : 0),
                children: [
                  SmartImage(
                    path: category.imagePath,
                    width: 80.w,
                    height: 80.w,
                    fit: BoxFit.cover,
                    imageBorderRadius: BorderRadius.circular(12.r),
                  ),
                  SizedBox(height: 8.h),
                  SmartText(category.name, style: style.titleStyle),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
