import 'package:taza/taza.dart';

class FoodOptionCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String subtitle;
  final String tag;
  final String image;
  final String? time;
  final String? duration;

  final Color? cardColor;
  final Color? shadowColor;
  final Color? tagGradientStart;
  final Color? tagGradientEnd;
  final Color? timeBorderColor;

  const FoodOptionCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.image,
    this.time,
    this.duration,
    this.cardColor,
    this.shadowColor,
    this.tagGradientStart,
    this.tagGradientEnd,
    this.timeBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTheme.of(context).foodOptionCardStyle;
    return SmartRow(
      padding: EdgeInsetsDirectional.only(
        top: 16.w,
        bottom: 16.w,
        start: 16.w,
        end: 8.w,
      ),
      decoration: BoxDecoration(
        color: cardColor ?? style.foodCardBgColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? const Color.fromRGBO(178, 189, 194, 0.25),
            offset: const Offset(0, 0),
            blurRadius: 5.0.r,
            spreadRadius: 5.r,
          ),
        ],
      ),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmartColumn(
          expanded: true,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmartText(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: style.foodCardTitleStyle,
            ),
            SizedBox(height: 2.h),
            SmartText(
              subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: style.foodCardSubTitleStyle,
            ),
            SizedBox(height: 4.h),
            Container(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: 6.h,
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    tagGradientStart ?? style.tagStartGradientStartColor,
                    tagGradientEnd ?? style.tagEndGradientStartColor,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: SmartText(
                tag,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: style.foodCardTagStyle,
              ),
            ),
            SizedBox(height: 8.h),
            if (time == null) ...[
              SizedBox(height: 26.h),
            ] else ...[
              SmartRow(
                height: 26.h,
                mainAxisSize: MainAxisSize.min,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 6.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.r),
                  border: Border.all(
                    color: timeBorderColor ?? style.timeContainerBorderColor,
                  ),
                ),
                children: [
                  SmartAnimator(
                    animationDuration: const Duration(seconds: 2),
                    repeat: true,
                    customEffectBuilder: (context, value, child) {
                      final yRotation = value * 2 * 3.1416;
                      final xRotation = 0.2 * sin(value * 2 * 3.1416);
                      return Transform(
                        alignment: Alignment.center,
                        transform:
                            Matrix4.identity()
                              ..rotateX(xRotation)
                              ..rotateY(yRotation),
                        child: child,
                      );
                    },
                    child: SmartImage(path: AppImages.icFlash),
                  ),
                  SizedBox(width: 4.w),
                  Flexible(
                    child: SmartRichText(
                      spans: [
                        SmartTextSpan(
                          text: time ?? "",
                          style: style.foodCardTimeStyle,
                        ),
                        SmartTextSpan(text: " "),
                        SmartTextSpan(
                          text: duration ?? "",
                          style: style.foodCardDurationStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
        SizedBox(width: 10.w),
        SmartImage(width: 172.w, height: 110.h, path: image, fit: BoxFit.fill),
      ],
    );
  }
}
