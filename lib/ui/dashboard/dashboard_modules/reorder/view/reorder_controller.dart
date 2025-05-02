import 'package:taza/taza.dart';

class ReorderController extends GetxController {

  RxBool isNonVeg = true.obs;
  RxBool isVeg = true.obs;



  @override
  void onInit() {
    debugPrint("ReorderController onInit");
    super.onInit();
  }

  toggleNonVeg(bool value){
    isNonVeg.value = value;
  }

  toggleVeg(bool value){
    isVeg.value = value;
  }

  void onTabSelected() {
    debugPrint('ReorderController → Tab Init');
  }

}
