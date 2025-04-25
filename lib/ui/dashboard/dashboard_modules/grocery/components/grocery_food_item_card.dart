import 'package:taza/taza.dart';

class GroceryItemCard extends StatelessWidget {
  final GroceryItemModel item;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final VoidCallback? onTapAdd;

  const GroceryItemCard({super.key, required this.item, this.onTapAdd, this.height, this.width, this.onTap, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).foodItemCardStyle;
    return SmartRow(
      width: width ?? 276.w,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(border: Border.all(color: style.dividerColor), borderRadius: BorderRadius.circular(16.r)),
      children: [
        SmartImage(
          path: item.imageUrl,
          width: 96.w,
          height: context.height,
          fit: BoxFit.cover,
          clipBehavior: Clip.antiAlias,
          imageBorderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), bottomLeft: Radius.circular(16.r)),
        ),
        SizedBox(width: 4.w),
        SmartColumn(
          expanded: true,
          padding: EdgeInsets.all(8.w),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmartText(item.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: style.titleStyle),
            SizedBox(height: 4.h),
            SmartRow(
              children: [
                SmartRow(
                  children: [
                    Icon(Icons.star, color: style.orangeColor, size: 14.w),
                    SizedBox(width: 4.w),
                    SmartText('${item.rating} (${item.reviews})', style: style.ratingStyle),
                    SizedBox(width: 1.w),
                    SmartText("•", style: style.ratingStyle),
                    SizedBox(width: 1.w),
                  ],
                ),
                SmartText(isFlexible: true, item.time, style: style.ratingStyle, maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
            SizedBox(height: 6.h),
            SmartRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: SmartText('${item.price} SAR', style: style.titleStyle)),
                GestureDetector(
                  onTap: onTapAdd,
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: style.primaryColor)),
                    child: Icon(Icons.add, size: 18.w, color: style.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class GroceryItemModel {
  final String imageUrl;
  final String title;
  final double rating;
  final String reviews;
  final String time;
  final String price;

  GroceryItemModel({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.reviews,
    required this.time,
    required this.price,
  });
}
