import 'package:taza/taza.dart';

class LoginController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final RxnString errorText = RxnString();
  final FocusNode focusNode = FocusNode();
  final RxBool isFocused = false.obs;
  final RxBool isExpanded = false.obs;
  final RxBool isPhoneValid = false.obs;
  bool isInitialLogin = false;


  @override
  void onInit() {

    isInitialLogin = StorageManager.instance.isInitialLoginDone();

    focusNode.addListener(() {
      isFocused.value = focusNode.hasFocus;

      if (focusNode.hasFocus) {
        isExpanded.value = true;
      }
    });

    phoneController.addListener(() {
      isPhoneValid.value = phoneController.text.trim().length == 10;
    });

    super.onInit();
  }


  @override
  void dispose() {
    focusNode.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void navigateToOtpScreen() {
    if (isPhoneValid.value) {
      Get.offNamed(AppRoutes.otpVerificationPage);
    }
  }
}
