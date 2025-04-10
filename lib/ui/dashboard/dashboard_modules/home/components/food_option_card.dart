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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmartText(title, style: style.foodCardTitleStyle),
            SizedBox(height: 2.h),
            SmartText(subtitle, style: style.foodCardSubTitleStyle),
            SizedBox(height: 4.h),
            Container(
              height: 30.h,
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
              child: SmartText(tag, style: style.foodCardTagStyle),
            ),
            SizedBox(height: 8.h),
            time != null
                ? SmartRow(
                  height: 26.h,
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 6.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.r),
                    border: Border.all(
                      color: timeBorderColor ?? style.timeContainerBorderColor,
                    ),
                  ),
                  children: [
                    SmartImage(path: AppImages.icFlash)
                        .animate(onPlay: (controller) => controller.repeat())
                        .custom(
                          duration: const Duration(seconds: 2),
                          builder: (context, value, child) {
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
                        ),
                    SizedBox(width: 4.w),
                    SmartRichText(
                      spans: [
                        SmartTextSpan(
                          text: time!,
                          style: style.foodCardTimeStyle,
                        ),
                        SmartTextSpan(text: " "),
                        SmartTextSpan(
                          text: duration ?? "",
                          style: style.foodCardDurationStyle,
                        ),
                      ],
                    ),
                  ],
                )
                : SizedBox(height: 20.h),
          ],
        ),
        SizedBox(width: 10.w),
        SmartImage(width: 172.w, height: 110.h, path: image, fit: BoxFit.fill),
      ],
    );
  }
}
