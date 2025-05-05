import 'package:taza/taza.dart';

class CartController extends GetxController {
  final RxList<FoodModel> foodList = <FoodModel>[].obs;
  int get totalCartItems => foodList.length;
  int get cartTotal => foodList.fold(0, (sum, product) => sum + product.price.toInt());

  @override
  void onInit() {
    super.onInit();

    printWrapped("CheckoutController initialized");
  }


  void addToCart(FoodModel product) {
    final index = foodList.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      foodList[index].quantity += 1;
    } else {
      product.quantity = 1;
      foodList.add(product);
    }
    foodList.refresh();
    HapticFeedback.lightImpact();
  }

  void removeFromCart(FoodModel product) {
    final index = foodList.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      if (foodList[index].quantity > 1) {
        foodList[index].quantity -= 1;
      } else {
        foodList.removeAt(index);
      }
      foodList.refresh();
      HapticFeedback.lightImpact();

    }
  }


}
