import 'package:taza/taza.dart';
import 'package:taza/ui/food_details/view/product_bottom_sheet.dart';

class FoodDetailsController extends GetxController {
  final PageController pageController = PageController();
  final RxBool isInCart = false.obs;
  final RxInt currentImageIndex = 0.obs;
  final RxInt quantity = 1.obs;
  final RxBool showFullDescription = false.obs;
  Timer? autoSlideTimer;

  final List<String> productImages = [
    "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg",
    "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg",
    "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg",
  ];

  @override
  void onInit() {
    printWrapped("FoodDetailsController initialized");
    startAutoSlide();
    super.onInit();
  }

  @override
  void onClose() {
    stopAutoSlide();
    pageController.dispose();
    super.onClose();
  }

  void startAutoSlide() {
    // Auto-slide every 3 seconds
    autoSlideTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (currentImageIndex.value < productImages.length - 1) {
        changeImage(currentImageIndex.value + 1);
      } else {
        changeImage(0); // Loop back to first image
      }
    });
  }

  void stopAutoSlide() {
    autoSlideTimer?.cancel();
    autoSlideTimer = null;
  }

  void addToCart(BuildContext context) {
    isInCart.value = true;
    Utils.showSmartModalBottomSheet(context: context, builder: (context) => ProductBottomSheet());
  }

  void goToCart() {
   // Get.to(() => CartScreen());
  }

  void changeImage(int index) {
    currentImageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  void onPageChanged(int index) {
    currentImageIndex.value = index;
  }

  void toggleDescription() {
    showFullDescription.value = !showFullDescription.value;
  }

}