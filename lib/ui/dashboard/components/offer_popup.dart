import 'package:taza/taza.dart';

class OfferPopup extends StatelessWidget {
  const OfferPopup({super.key, this.title, this.subTitle, this.image, this.buttonText, this.onTap,this.bgImage});
  final String? title;
  final String? subTitle;
  final String? image;
  final String? bgImage;
  final String? buttonText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var style = AppTheme.of(context).offerPopupStyle;
    return Container(
      height: 400.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(20.r),
          topEnd: Radius.circular(20.r),
        ),
      ),
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: SmartImage(path: bgImage?? AppImages.icBgRed,
              clipBehavior: Clip.antiAlias,
              imageBorderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),),
          ),

          // Content
          SmartColumn(
            padding: EdgeInsetsDirectional.all(16.r),
            children: [
              SmartRow(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SmartImage(
                    path: AppImages.icClose,
                    onTap: () => Get.back(),
                  ),
                ],
              ),
              SmartText(
                title?? "Enjoy Our Special Christmas Offer!",
                style: style.titleStyle,
                textAlign: TextAlign.center,
                animator: SmartAnimator(
                  animationDelay: 100.ms,
                  animationDuration: 500.ms,
                  animateSlideY: true,
                  animateScale: true,
                ),

              ),

              SmartText(
               subTitle?? "Minimum 20% off",
                style: style.subTitleStyle,
                textAlign: TextAlign.center,
                animator: SmartAnimator(
                  animateSlideY: true,
                  animationDuration: 700.ms,
                  animationDelay: 200.ms,
                  animateScale: true,
                ),
              ),
              Expanded(
                child: SmartImage(
                  fit: BoxFit.contain,
                  path: image?? AppImages.icFood,
                  animator: SmartAnimator(
                    animateSlideY: true,
                    animateScale: true,
                    animationDelay: 200.ms,
                    animationDuration: 800.ms,
                    animationCurve: Curves.easeInOutCubic,
                  ),
                ),
              ),
              SmartButton.white(
                onTap: () {
                  onTap?.call();
                },
                title: buttonText?? LocaleKeys.order.tr,
                animator: SmartAnimator(
                  animateSlideY: true,
                  slideYBegin: const Offset(0, 2),
                  slideEnd: Offset.zero,
                  animationDelay: 400.ms,
                  animationDuration: 1000.ms,
                  animationCurve: Curves.easeInOutCubic,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
