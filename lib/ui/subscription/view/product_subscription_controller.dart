import 'package:taza/taza.dart';

class ProductSubscriptionController extends GetxController {
  RxString selectedSchedule = ''.obs;
  RxString selectedDate = ''.obs;
  RxSet<String> selectedWeekDays = <String>{}.obs;
  RxList<DateTime> selectedDeliveryDates = <DateTime>[].obs;

  RxList<DateTime> monthDates = List.generate(31,
        (i) => DateTime(DateTime.now().year, DateTime.now().month, i + 1),
  ).obs;

  final List<String> weekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  void toggleWeekDay(String day) {
    if (selectedWeekDays.contains(day)) {
      selectedWeekDays.remove(day);
    } else {
      selectedWeekDays.add(day);
    }
  }

  void toggleDeliveryDate(DateTime date) {
    if (selectedDeliveryDates.contains(date)) {
      selectedDeliveryDates.remove(date);
    } else {
      selectedDeliveryDates.add(date);
    }
    // selectedDeliveryDates.refresh();
  }

  void selectSchedule(String schedule) {
    selectedSchedule.value = schedule;
  }

  void showSelectDeliveryDaysBottomSheet(
    BuildContext context,
    LoginPageStyle loginStyle,
  ) {
    Utils.showSmartModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(6.r)),
      ),
      builder: (context) {
        return Obx(() {
          return SmartSingleChildScrollView(
            child: SmartColumn(
              padding: EdgeInsetsDirectional.only(
                start: 16.w,
                end: 16.w,
                bottom: 16.h,
              ),
              width: Get.width,
              decoration: BoxDecoration(
                color: loginStyle.loginPageBgColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                SmartText(
                  'Select Delivery Days',
                  style: loginStyle.accountTextStyle.copyWith(fontSize: 16.sp),
                ),
                SizedBox(height: 12.h),
                ...weekDays.map((day) {
                  final isSelected = selectedWeekDays.contains(day);
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Checkbox(
                      value: isSelected,
                      activeColor: loginStyle.continueButtonBgColor,
                      onChanged: (_) {
                        toggleWeekDay(day);
                      },
                    ),
                    title: SmartText(
                      day,
                      style: loginStyle.errorTextStyle.copyWith(
                        color: loginStyle.dividerColor,
                      ),
                    ),
                    onTap: () => toggleWeekDay(day),
                  );
                }),
                SmartColumn(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: loginStyle.continueButtonDisableBgColor,
                    ),
                  ),
                  children: [
                    ListTile(
                      contentPadding: EdgeInsetsDirectional.zero,
                      leading: Padding(
                        padding: EdgeInsetsDirectional.only(start: 10.w),
                        child: Icon(Icons.calendar_month_outlined, size: 30.w),
                      ),
                      title: SmartText(
                        'Subscription Start Date',
                        style: loginStyle.bottomTextStyle,
                      ),
                      subtitle: SmartText(
                        DateTime.now().dateToStringFormat(
                          outputDateFormat: DateFormatter.dateFormatDDMMMMYYYY,
                        ),
                        style: loginStyle.termsAndPrivacyTextStyle,
                      ),
                      trailing: Padding(
                        padding: EdgeInsetsDirectional.only(end: 8.0.w),
                        child: Icon(Icons.keyboard_arrow_down),
                      ),
                      onTap: () {
                        openCalendar(loginStyle, context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                SmartButton(
                  title: 'Submit',
                  borderRadius: BorderRadius.circular(12.r),
                  onTap: () {
                    // You can validate and close bottom sheet here
                    Get.back();
                  },
                ),
              ],
            ),
          );
        });
      },
    );
  }

  void openCalendar(LoginPageStyle loginStyle, BuildContext context) async {
    final DateTime today = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: DateTime(today.year + 1),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: loginStyle.continueButtonBgColor,
              onPrimary: loginStyle.loginPageBgColor,
              onSurface: loginStyle.dividerColor,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedDate.value = DateFormat(
        DateFormatter.dateFormatEEEMMMdyyyy,
      ).format(picked);
      print('Selected date: $selectedDate');
    }
  }
}
