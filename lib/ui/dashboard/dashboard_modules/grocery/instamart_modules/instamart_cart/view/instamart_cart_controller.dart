import 'package:taza/taza.dart';

class InstamartCartController extends GetxController {
  final RxList<InstamartProductModel> foodList = <InstamartProductModel>[].obs;
  int get totalCartItems => foodList.length;
  int get cartTotal => foodList.fold(0, (sum, product) => sum + (product.price * product.quantity).toInt());
  int get cartQuantity => foodList.fold(0, (sum, product) => sum + (product.quantity).toInt());

  /// Progress (0.0 to 1.0), max 3 stages
  double get cartProgress => (cartQuantity / 3).clamp(0.0, 1.0);

  /// Emoji stage logic
  String get cartProgressEmoji {
    if (cartQuantity >= 3) return "🚀";
    if (cartQuantity == 2) return "🛒";
    if (cartQuantity == 1) return "🧺";
    return "🥺";
  }

  /// cartTitle is used to show particular
  /// message on bottom cart
  String get cartTitle {
    if (cartQuantity == 2) {
      return "Add 1 more item to unlock FREE DELIVERY! 🚀";
    } else if (cartQuantity == 1) {
      return "Add 2 more items to unlock FREE DELIVERY! 🚀";
    } else {
      return "🎉 Hooray! FREE DELIVERY unlocked! 🚀";
    }
  }


  @override
  void onInit() {
    super.onInit();
    printWrapped("CheckoutController initialized");
  }


  void addToCart({required BuildContext context,required InstamartProductModel product,}) {
    final index = foodList.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      foodList[index].quantity += 1;
    } else {
      product.quantity = 1;
      foodList.add(product);
    }
    foodList.refresh();

    if(cartQuantity==3){
      HapticFeedback.heavyImpact();
      Confetti.launch(
        context,
        options: const ConfettiOptions(particleCount: 100, spread: 70, y: 0.8,),
      );
    }else{
      HapticFeedback.lightImpact();
    }
  }

  void removeFromCart(InstamartProductModel product) {
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
