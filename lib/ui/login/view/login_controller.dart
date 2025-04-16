import 'package:taza/taza.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final errorText = RxnString();
  final focusNode = FocusNode();
  final isFocused = false.obs;
  final isPhoneValid = false.obs;

  @override
  void onInit() {
    debugPrint("LoginController onInit");

    focusNode.addListener(() {
      isFocused.value = focusNode.hasFocus;
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
}

