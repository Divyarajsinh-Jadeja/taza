class FoodModel {
   String name;
   String imageUrl;
   double rating;
   int reviewsCount;
   String deliveryTime;
   double price;
   int quantity;

  FoodModel({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.reviewsCount,
    required this.deliveryTime,
    required this.price,
    this.quantity = 1,
  });
}
