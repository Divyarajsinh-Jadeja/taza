import 'package:taza/taza.dart';

class OtpVerificationController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  final RxnString errorText = RxnString();
  final RxBool isOtpValid = false.obs;
  final RxInt secondsRemaining = 20.obs;
  final RxBool isTimerCompleted = false.obs;
  bool isInitialLogin = false;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    isInitialLogin = StorageManager.instance.isInitialLoginDone();
    otpController.addListener(() {
      isOtpValid.value = otpController.text.trim().length == 6;
    });
    _startTimer();
  }

  void _startTimer() {
    isTimerCompleted.value = false;
    secondsRemaining.value = 20;

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 1) {
        secondsRemaining.value--;
      } else {
        secondsRemaining.value = 0;
        isTimerCompleted.value = true;
        _timer?.cancel();
      }
    });
  }

  void retryOtp() {
    if (isTimerCompleted.value) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void navigateToDashboardPage(){
    if (isOtpValid.value) {
      if (otpController.text.trim() == "123456") {
        errorText.value = null;
        StorageManager.instance.setInitialLoginDone(true);
        StorageManager.instance.setLoginDone(true);
        Get.offNamed(AppRoutes.dashboardPage);
      } else {
        errorText.value = LocaleKeys.otpInvalid.tr;
      }
    }
  }
}
