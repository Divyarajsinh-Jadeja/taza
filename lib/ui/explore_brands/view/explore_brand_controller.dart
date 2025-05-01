import 'package:taza/taza.dart';

class ExploreBrandController extends GetxController {

  RxBool isNonVeg = true.obs;
  RxBool isVeg = true.obs;
  late final RestaurantItemModel item;


  @override
  void onInit() {
    super.onInit();
    item = Get.arguments as RestaurantItemModel;
  }

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

  ].obs;


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
