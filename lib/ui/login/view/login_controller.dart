import 'package:taza/taza.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final errorText = RxnString();

  @override
  void onInit() {
    debugPrint("LoginController onInit");
    super.onInit();
  }

  bool validatePhone() {
    final phone = phoneController.text.trim();
    if (phone.isEmpty) {
      errorText.value = LocaleKeys.pleaseEnterNumber.tr;
      return false;
    } else if (!RegExp(r'^\+?\d{7,13}$').hasMatch(phone)) {
      errorText.value = LocaleKeys.enterValidNumber.tr;
      return false;
    }
    errorText.value = null;
    return true;
  }
}

