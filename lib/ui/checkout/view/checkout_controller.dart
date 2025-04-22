import 'package:taza/taza.dart';

class CheckoutController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    printWrapped("CheckoutController initialized");
  }

  RxList<FoodModel> foodList = [
    FoodModel(
        id: "1",
        name: 'Family Bucket',
        imageUrl: 'https://i.ibb.co/whRS5nY7/b.jpg',
        rating: 4.2,
        reviewsCount: 1200,
        deliveryTime: '30-35 min',
        price: 89.0,
        quantity: 4
    ),
    FoodModel(
      id: "2",
      name: 'Cheese Burger',
      imageUrl: 'https://i.ibb.co/FLj0XVLX/burger.webp',
      rating: 4.5,
      reviewsCount: 950,
      deliveryTime: '25-30 min',
      price: 59.0,
    ),
    FoodModel(
      id: "3",
      name: 'Chocolate Cake',
      imageUrl: 'https://i.ibb.co/XfpHPXFP/cake.jpg',
      rating: 4.6,
      reviewsCount: 1100,
      deliveryTime: '20-25 min',
      price: 45.0,
    ),
    FoodModel(
      id: "4",
      name: 'Chinese Combo',
      imageUrl: 'https://i.ibb.co/HLmQQsjy/chinease.jpg',
      rating: 4.4,
      reviewsCount: 780,
      deliveryTime: '35-40 min',
      price: 65.0,
    ),
    /*FoodModel(
      name: 'Crispy Fries',
      imageUrl: 'https://i.ibb.co/Wp59vWJz/fries.jpg',
      rating: 4.1,
      reviewsCount: 620,
      deliveryTime: '10-15 min',
      price: 19.0,
    ),
    FoodModel(
      name: 'Veg Noodles',
      imageUrl: 'https://i.ibb.co/G4BSrKf4/noodles.webp',
      rating: 4.3,
      reviewsCount: 900,
      deliveryTime: '25-30 min',
      price: 39.0,
    ),
    FoodModel(
      name: 'Creamy Pasta',
      imageUrl: 'https://i.ibb.co/Psj33M1h/pasta.jpg',
      rating: 4.5,
      reviewsCount: 1050,
      deliveryTime: '20-25 min',
      price: 49.0,
    ),
    FoodModel(
      name: 'Fresh Salad',
      imageUrl: 'https://i.ibb.co/MkqsDTsx/salad.jpg',
      rating: 4.2,
      reviewsCount: 500,
      deliveryTime: '15-20 min',
      price: 25.0,
    ),
    FoodModel(
      name: 'Green Salad',
      imageUrl: 'https://i.ibb.co/07xdLSS/salad1.webp',
      rating: 4.0,
      reviewsCount: 350,
      deliveryTime: '10-15 min',
      price: 22.0,
    ),*/
  ].obs;
}
