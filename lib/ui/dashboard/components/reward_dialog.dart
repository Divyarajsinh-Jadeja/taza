import 'package:taza/taza.dart';

class RewardDialog extends StatelessWidget {
  const RewardDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final style = theme.rewardDialogStyle;

    return Center(
      child: Dialog(
        child: Container(
          width: 300.w,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: style.backgroundColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: SmartColumn(
            mainAxisSize: MainAxisSize.min,
            children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
