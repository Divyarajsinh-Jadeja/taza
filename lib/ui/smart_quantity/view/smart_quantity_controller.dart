import 'package:taza/taza.dart';
class QuantityController extends GetxController {
  final RxList<RxInt> quantities = <RxInt>[].obs;

  void initializeQuantities(int length) {
    quantities.value = List.generate(length, (_) => 0.obs);
  }

  void increment(int index) {
    quantities[index].value++;
    HapticFeedback.lightImpact();
  }

  void decrement(int index) {
    if (quantities[index].value != 0) {
      quantities[index].value--;
      HapticFeedback.lightImpact();
    }
  }
}

