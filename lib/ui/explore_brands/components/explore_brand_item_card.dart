import 'package:taza/taza.dart';

class ExploreBrandItemCard extends StatelessWidget {
  const ExploreBrandItemCard({
    super.key,
    required this.model,
    this.onIncrease,
    this.onDecrease,
    required this.index,
  });

  final FoodModel model;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final int index;

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).foodCardStyle;
    final loginStyle = AppTheme.of(context).loginPageStyle;

    return SmartRow(
      onTap: () => Get.toNamed(AppRoutes.categoryPage),
      margin: EdgeInsetsDirectional.only(bottom: 16.h),
      decoration: style.cardDecoration,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SmartColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            padding: EdgeInsetsDirectional.only(start: 12.w, top: 10.h, bottom: 10.h),
            children: [
              SmartRow(
                spacing: 6.w,
                children: [
                  SmartText("🔥Bestseller", style: style.subTitleStyle.copyWith(color: Colors.red, fontSize: 12.sp)),
                  SmartText("15mins", style: style.subTitleStyle.copyWith(fontSize: 12.sp)),
                ],
              ),
              4.verticalSpace,
              SmartText(
                model.name,
                style: style.titleStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              6.verticalSpace,
              SmartRow(
                spacing: 4.w,
                children: [
                  SmartImage(
                    path: AppImages.icStar,
                    height: 14.h,
                  ),
                  SmartText(
                    "${model.rating} (${model.reviewsCount})",
                    style: style.subTitleStyle.copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
              6.verticalSpace,
              SmartText(
                model.price.toCurrencyCodeFormat() ?? '',
                style: style.subTitleStyle.copyWith(fontSize: 14.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              6.verticalSpace,
              SmartRow(
                spacing: 4.w,
                children: [
                  Icon(Icons.favorite_border, size: 14.sp, color: Colors.grey),
                  SmartText("Save to Eatlist", style: style.subTitleStyle.copyWith(fontSize: 14.sp)),
                ],
              ),
              6.verticalSpace,
              SmartText(
                "Paneer sabji+ Vegetable Slice + Steam Rice + Capsicum.... More",
                style: style.subTitleStyle.copyWith(fontSize: 14.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SmartColumn(
          padding: EdgeInsetsDirectional.only(end: 12.w, top: 10.h, bottom: 10.h),
          children: [
            Container(
              width: 160.w,
              margin: EdgeInsetsDirectional.only(end: 12.w, top: 10.h, bottom: 10.h),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: SmartImage(
                      width: 160.w,
                      height: 140.h,
                      path: model.imageUrl,
                      imageBorderRadius: style.imageDecoration,
                      animator: SmartAnimator(
                        animateFade: true,
                        animateScale: true,
                        animationDelay: 400.ms,
                        animationDuration: 400.ms,
                      ),
                    ),
                  ),

                  /// Positioned ADD button
                  Positioned(
                    bottom: -16.h,
                    left: 35.w,
                    child: Container(
                      width: 90.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: loginStyle.loginPageBgColor,
                        borderRadius: BorderRadius.circular(6.r),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(178, 189, 194, 0.25).withAlpha(102),
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: SmartText(
                        "ADD",
                        style: TextStyle(
                          color: loginStyle.continueButtonBgColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            SmartText(
              "Customisable",
              style: style.subTitleStyle.copyWith(fontSize: 12.sp, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}

