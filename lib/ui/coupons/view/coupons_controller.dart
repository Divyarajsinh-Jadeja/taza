import 'package:taza/taza.dart';

class CouponsController extends GetxController {
  final List<String> coupons = [
    '${10.toCurrencyCodeFormat()} OFF',
    '${20.toCurrencyCodeFormat()} OFF',
    'Buy 1 Get 1 Free',
    'Free Delivery',
    '${100.toCurrencyCodeFormat()} OFF on orders above ${500.toCurrencyCodeFormat()}',
  ];

  final selected = ''.obs;

  void selectCoupon(String value) {
    if(selected.value==value){
      selected.value='';
    }
    else{
      selected.value = value;
    }
  }

  @override
  void onInit() {
    super.onInit();
    printWrapped("CouponsController initialized");
  }
}
