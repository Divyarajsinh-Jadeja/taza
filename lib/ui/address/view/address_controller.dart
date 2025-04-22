import 'package:taza/taza.dart';

class AddressController extends GetxController {

  final TextEditingController houseController = TextEditingController(text: "C-1401");
  final TextEditingController apartmentController = TextEditingController(text: "The First, near Mansi Circle");
  final TextEditingController directionController = TextEditingController(text: "It is behind ITC narmada");
  RxString selectedLabel = 'Home'.obs;

  @override
  void onInit() {
    printWrapped("AddressController initialized");
    super.onInit();
  }

  onSaveAsChanged(String value){
    selectedLabel.value = value;
  }
}