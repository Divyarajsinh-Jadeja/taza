import 'package:taza/taza.dart';

class RewardDialog extends StatelessWidget {
  const RewardDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final style = theme.rewardDialogStyle;

    return Center(
      child: Dialog(
        child: SmartColumn(
          width: 300.w,
          decoration: BoxDecoration(
            color: style.backgroundColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w,),
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.h,),
            SmartImage(
              path: AppImages.icClose,
              onTap: () => Get.back(),
              alignment: AlignmentDirectional.topEnd,
            ),
            SmartImage(path: AppImages.reward, size: 100.w),
            SizedBox(height: 16.h),
            /// TODO : below string will chane and come from api
            SmartText("Congratulations!", style: style.titleTextStyle),
            SizedBox(height: 12.h),
            SmartText(
              "100 free cash added",
              style: style.highlightTextStyle,
            ),
            SmartText("on this order!", style: style.subtitleTextStyle),
            SizedBox(height: 20.h),
            SmartText("YAY!", style: style.celebrateTextStyle),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
