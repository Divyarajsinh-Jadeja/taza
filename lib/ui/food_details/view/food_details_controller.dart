import 'package:taza/taza.dart';

class FoodDetailsController extends GetxController {

  final RxBool isInCart = false.obs;
  final RxInt currentImageIndex = 0.obs;
  final RxInt quantity = 1.obs;
  final RxBool showFullDescription = false.obs;

  void addToCart() {
    isInCart.value = true;
    Get.snackbar(
      'Added to Cart',
      'DAAWAT Basmati Rice added to your cart',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void goToCart() {
   // Get.to(() => CartScreen());
  }

  void changeImage(int index) {
    currentImageIndex.value = index;
  }

  void toggleDescription() {
    showFullDescription.value = !showFullDescription.value;
  }

}