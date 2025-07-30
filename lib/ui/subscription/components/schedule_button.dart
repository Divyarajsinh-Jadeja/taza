import 'package:taza/taza.dart';
import 'package:taza/ui/subscription/view/product_subscription_controller.dart';

class ScheduleButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const ScheduleButton({required this.label, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductSubscriptionController>();

    return Obx(() {
      final isSelected = controller.selectedSchedule.value == label;
      final loginStyle = AppTheme.of(context).loginPageStyle;

      return GestureDetector(
        onTap: () {
          controller.selectSchedule(label);
          onTap();
        },
        child: SmartColumn(
          margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            border: Border.all(color: isSelected ? loginStyle.continueButtonBgColor : loginStyle.continueButtonDisableBgColor),
            borderRadius: BorderRadius.circular(25.r),
            color: isSelected ? loginStyle.continueButtonBgColor.withValues(alpha: 0.3) : loginStyle.loginPageBgColor,
          ),
          children: [
            SmartText(
              label,
              style: loginStyle.countryCodeTextStyle.copyWith(fontSize: 13.sp),
            ),
          ],
        ),
      );
    });
  }
}
