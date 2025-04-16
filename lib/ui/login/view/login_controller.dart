import 'package:taza/taza.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final errorText = RxnString();
  final focusNode = FocusNode();
  final isFocused = false.obs;
  final isExpanded = false.obs;
  final isPhoneValid = false.obs;

  @override
  void onInit() {
    focusNode.addListener(() {
      isFocused.value = focusNode.hasFocus;

      // Expand when focused
      if (focusNode.hasFocus) {
        isExpanded.value = true;
      }
    });

    phoneController.addListener(() {
      isPhoneValid.value = phoneController.text.trim().length == 10;
    });

    super.onInit();
  }

  void collapseSheet() {
    isExpanded.value = false;
    focusNode.unfocus();
  }

  @override
  void dispose() {
    focusNode.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
