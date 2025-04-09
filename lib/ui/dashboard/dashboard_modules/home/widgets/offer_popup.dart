import 'package:taza/taza.dart';
class OfferPopup extends StatelessWidget {
  const OfferPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              child: Image.asset(
                AppImages.icBgRed,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Vignette overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, 0),
                  radius: 0.95,
                  colors: [
                    Colors.transparent,
                    Colors.red.withOpacity(0.4),
                  ],
                  stops: const [0.7, 1.0],
                ),
              ),
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsetsDirectional.all(16.r),
            child: SmartColumn(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SmartImage(
                      path: AppImages.icClose,
                      onTap: () => Get.back(),
                    ),
                  ],
                ),
                SmartText(
                  "Enjoy Our Special Christmas Offer!",
                  style: AppTheme.of(context).interBoldW700TextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 28.sp,
                  ),
                  textAlign: TextAlign.center,
                ).animate()
                    .slideY(
                    begin: -0.2,
                    end: 0,
                    delay: 100.ms,
                    duration: 500.ms,
                    curve: Curves.easeInOutCubic)
                    .scaleXY(
                    begin: 0,
                    end: 1,
                    delay: 100.ms,
                    duration: 500.ms,
                    curve: Curves.easeInOutCubic),
                SmartText(
                  "Minimum 20% off",
                  style: AppTheme.of(context).interBoldW700TextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 17.sp,
                  ),
                  textAlign: TextAlign.center,
                ).animate()
                    .slideY(
                    begin: -0.2,
                    end: 0,
                    delay: 200.ms,
                    duration: 700.ms,
                    curve: Curves.easeInOutCubic)
                    .scaleXY(
                    begin: 0,
                    end: 1,
                    delay: 200.ms,
                    duration: 700.ms,
                    curve: Curves.easeInOutCubic),
                SmartImage(path: AppImages.icFood).animate()
                    .slideY(
                    begin: -0.2,
                    end: 0,
                    delay: 200.ms,
                    duration: 800.ms,
                    curve: Curves.easeInOutCubic)
                    .scaleXY(
                    begin: 0,
                    end: 1,
                    delay: 200.ms,
                    duration: 800.ms,
                    curve: Curves.easeInOutCubic),
                SmartButton.white(
                  borderColor: Colors.white,
                  onTap: () {
                    // Do something
                  },
                  title: "Order",
                ).animate()
                    .slideY(
                    begin: 2,
                    end: 0,
                    delay: 400.ms,
                    duration: 1000.ms,
                    curve: Curves.easeInOutCubic),
              ],
            ),
          ),
        ],
      ),
    );
  }
}