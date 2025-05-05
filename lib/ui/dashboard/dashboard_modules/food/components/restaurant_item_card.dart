import 'package:taza/taza.dart';

class RestaurantItemCard extends StatelessWidget {
  final RestaurantItemModel item;
  final VoidCallback? onTap;

  const RestaurantItemCard({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).foodItemCardStyle;
    final loginStyle = AppTheme.of(context).loginPageStyle;

    return SmartColumn(
      width: 280.w,
      margin: EdgeInsets.symmetric(vertical: 4.h),
      crossAxisAlignment: CrossAxisAlignment.start,
      onTap: onTap,
      decoration: BoxDecoration(
        color: loginStyle.loginPageBgColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: (const Color.fromRGBO(178, 189, 194, 0.25)).withValues(alpha: 0.4),
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 5,
          ),
        ],
      ),
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(14.r), topLeft: Radius.circular(14.r)),
              child: SmartImage(
                path: item.imageUrl ?? "",
                height: 140.h,
                width: double.infinity,
                fit: BoxFit.cover,
                imageBorderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
            ),
            Positioned(
              top: 8.h,
              right: 8.w,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite_border, color: loginStyle.loginPageBgColor, size: 20.w),
                  SizedBox(width: 8.w),
                  Icon(Icons.more_vert, color: loginStyle.loginPageBgColor, size: 20.w),
                ],
              ),
            ),
            Positioned(
              bottom: 0.h,
              right: 0.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: loginStyle.dividerColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: SmartText(
                  item.deliveryTime,
                  style: style.titleStyle.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        // Content
        SmartColumn(
          padding: EdgeInsets.all(12.w),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tags row
            SmartRow(
              children: [
                SmartText("🚀 Food in 15 min", style: style.ratingStyle),
                SizedBox(width: 8.w),
                SmartText("🏆 Best In Pizza", style: style.ratingStyle),
              ],
            ),
            SizedBox(height: 6.h),

            // Title
            SmartText(
              item.title,
              style: style.titleStyle.copyWith(fontSize: 16.sp),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 6.h),

            // Rating row
            SmartRow(
              children: [
                Icon(Icons.star, size: 14.w, color: Colors.green),
                SizedBox(width: 4.w),
                SmartText("${item.rating}", style: style.ratingStyle),
                SizedBox(width: 4.w),
                SmartText("(${item.reviews})", style: style.ratingStyle),
                SizedBox(width: 6.w),
                SmartText("• ${item.distance}", style: style.ratingStyle),
              ],
            ),

            SizedBox(height: 4.h),
            // Cuisines and price for two
            SmartText(
              "${item.cuisines} • ₹${item.priceForTwo} for two",
              style: style.titleStyle.copyWith(fontSize: 14.sp),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10.h),
            // Bottom row

          ],
        ),
      ],
    );
  }
}

class RestaurantItemModel {
  final int? id;
  final String? imageUrl;
  final String? title;
  final double? rating;
  final String? reviews;
  final String? distance;
  final String? cuisines;
  final int? priceForTwo;
  final int? startingPrice;
  final String? deliveryTime;
  final bool? hasCarousel;
  final List<FoodModel> menu;
  final String? logo;

  RestaurantItemModel({
    this.id,
    this.imageUrl,
    this.title,
    this.rating,
    this.reviews,
    this.distance,
    this.cuisines,
    this.priceForTwo,
    this.startingPrice,
    this.deliveryTime,
    this.hasCarousel = false, required String time, required String price,
    required this.menu,
    this.logo
  });
}

