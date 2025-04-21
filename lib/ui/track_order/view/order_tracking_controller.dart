import 'package:taza/taza.dart';

class OrderTrackingController extends GetxController {
  final List<Map<String, dynamic>> instructions = <Map<String, dynamic>>[];
  final List<Map<String, dynamic>> tips = <Map<String, dynamic>>[];
  final RxSet<int> selectedInstructionIndexes = <int>{}.obs;

  @override
  void onInit() {
    debugPrint("LoginController onInit");
    loadLists();
    super.onInit();
  }


  void toggleInstructionIndex(int index) {
    if (selectedInstructionIndexes.contains(index)) {
      selectedInstructionIndexes.remove(index);
    } else {
      selectedInstructionIndexes.add(index);
    }
  }


  void loadLists() {
    instructions.assignAll([
      {'icon': AppImages.icBellWithSplash, 'label': LocaleKeys.instructionDontRingBell.tr},
      {'icon': AppImages.icDog, 'label': LocaleKeys.instructionPetAtHome.tr},
      {'icon': AppImages.icDoor, 'label': LocaleKeys.instructionLeaveAtDoor.tr},
      {'icon': AppImages.icSecurityGuard, 'label': LocaleKeys.instructionLeaveAtGate.tr},
    ]);

    tips.assignAll([
      {'icon': AppImages.icBellWithSplash, 'rupees': "₹10"},
      {'icon': AppImages.icDog, 'rupees': "₹20"},
      {'icon': AppImages.icDoor, 'rupees': "₹50"},
      {'icon': AppImages.icSecurityGuard, 'rupees': "₹100"},
    ]);
  }
}

