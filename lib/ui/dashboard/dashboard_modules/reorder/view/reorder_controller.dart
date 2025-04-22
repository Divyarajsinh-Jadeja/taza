import 'package:taza/taza.dart';

class ReorderController extends GetxController {

  RxBool isNonVeg = true.obs;
  RxBool isVeg = true.obs;


  RxList<FoodModel> foodList = [
    FoodModel(
      id: "11",
      name: 'Family Bucket',
      imageUrl: 'https://i.ibb.co/whRS5nY7/b.jpg',
      rating: 4.2,
      reviewsCount: 1200,
      deliveryTime: '30-35 min',
      price: 89.0,
      quantity: 0
    ),
    FoodModel(
      id: "12",
      name: 'Cheese Burger',
      imageUrl: 'https://i.ibb.co/FLj0XVLX/burger.webp',
      rating: 4.5,
      reviewsCount: 950,
      deliveryTime: '25-30 min',
      price: 59.0,
    ),
    FoodModel(
      id: "13",
      name: 'Chocolate Cake',
      imageUrl: 'https://i.ibb.co/XfpHPXFP/cake.jpg',
      rating: 4.6,
      reviewsCount: 1100,
      deliveryTime: '20-25 min',
      price: 45.0,
    ),
    FoodModel(
      id: "14",
      name: 'Chinese Combo',
      imageUrl: 'https://i.ibb.co/HLmQQsjy/chinease.jpg',
      rating: 4.4,
      reviewsCount: 780,
      deliveryTime: '35-40 min',
      price: 65.0,
    ),
    FoodModel(
      id: "15",
      name: 'Crispy Fries',
      imageUrl: 'https://i.ibb.co/Wp59vWJz/fries.jpg',
      rating: 4.1,
      reviewsCount: 620,
      deliveryTime: '10-15 min',
      price: 19.0,
    ),

  ].obs;

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
