import 'package:taza/taza.dart';

class AddressController extends GetxController {

  final TextEditingController houseController = TextEditingController(text: "1600");
  final TextEditingController apartmentController = TextEditingController(text: "Amphitheatre Parkway, Mountain View,");
  final TextEditingController directionController = TextEditingController(text : "Near Joseph cafe");
  RxString selectedLabel = 'Home'.obs;

  final usAddresses = [
    "1600 Amphitheatre, Mountain View, CA 94043",
    "350 5th Ave, New York, NY 10118",
    "1 Infinite Loop, New York, NY 10118",
    "233 S Wacker Dr, Chicago, IL 60606",
  ];

  @override
  void onInit() {
    printWrapped("AddressController initialized");
    super.onInit();
  }

  onSaveAsChanged(String value){
    selectedLabel.value = value;
  }
}