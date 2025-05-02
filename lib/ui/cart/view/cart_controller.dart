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

  final imageUrls = [
    "https://i.ibb.co/whRS5nY7/b.jpg",
    "https://i.ibb.co/FLj0XVLX/burger.webp",
    "https://i.ibb.co/XfpHPXFP/cake.jpg",
    "https://i.ibb.co/HLmQQsjy/chinease.jpg"
  ];

  void addToCart(FoodModel product) {
    Utils.showMessage("Added to cart");
    foodList.add(product);
  }
  void removeFromCart(FoodModel product) {
    Utils.showMessage("Removed from cart");
    foodList.remove(product);
  }

}
