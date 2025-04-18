import 'package:taza/taza.dart';

class CouponsPage extends GetView<CouponsController> {
  const CouponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).checkoutStyle;
    return Scaffold(
      backgroundColor: style.backgroundColor,
      appBar: SmartAppBar(title: LocaleKeys.coupons.tr),
      body: Padding(
        padding: EdgeInsetsDirectional.all(8.0.w),
        child: ListView.builder(
          itemCount: controller.coupons.length,
          itemBuilder: (context, index) {
            final coupon = controller.coupons[index];
            return Obx(() {
              final isSelected = controller.selected.value == coupon;
              return Padding(
                padding:  EdgeInsets.all(8.0.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: SmartRow(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    margin: EdgeInsetsDirectional.symmetric(
                      vertical: 10.h,
                      horizontal: 15.w,
                    ),
                    onTap: () => controller.selectCoupon(coupon),
                    children: [
                      ClipPath(
                        clipper: CuponClipper(textDirection: Directionality.of(context)),
                        child: Container(
                          width: 35.w,
                          height: 145.h,
                          color: isSelected? style.primaryColor:style.couponColor,
                          alignment: Alignment.center,
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: SmartText(
                              "40% OFF",
                              style: style.couponWhiteStyle,
                            ),
                          ),
                        ),
                      ),
                      SmartColumn(
                        expanded: true,
                        height: 145.h,
                        mainAxisSize: MainAxisSize.min,
                        color: style.whiteColor,
                        padding: EdgeInsetsDirectional.all(20.w),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SmartRow(
                            children: [
                              SmartText(coupon, style: style.savingTitleStyle,isExpanded: true,),
                              if(isSelected)SmartText(LocaleKeys.applied.tr,style: style.appliedTextStyle,)
                            ],
                          ),
                          SmartText(
                            "Save 70% with this code",
                            style: style.subCardTitleStyle,
                          ),
                          Spacer(),
                          SmartText(
                            "Use code TAZAAPP & get 40% off on orders above 199. Maximum discount is 80",
                            style: style.subCardTitleStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}

class CuponClipper extends CustomClipper<Path> {
  final TextDirection textDirection;

  CuponClipper({required this.textDirection});

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    final radius = size.height * .065;
    final Path holePath = Path();

    // Direction-aware clipping: apply notches to the correct edge
    if (textDirection == TextDirection.ltr) {
      // Notches on the left
      for (int i = 1; i <= 4; i++) {
        holePath.addOval(
          Rect.fromCircle(
            center: Offset(0, (size.height * .2) * i),
            radius: radius,
          ),
        );
      }
    } else {
      // Notches on the right
      for (int i = 1; i <= 4; i++) {
        holePath.addOval(
          Rect.fromCircle(
            center: Offset(size.width, (size.height * .2) * i),
            radius: radius,
          ),
        );
      }
    }

    return Path.combine(PathOperation.difference, path, holePath);
  }

  @override
  bool shouldReclip(covariant CuponClipper oldClipper) =>
      oldClipper.textDirection != textDirection;
}

