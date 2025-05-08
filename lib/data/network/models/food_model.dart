class FoodModel {
  String id;
  String name;
  String imageUrl;
  double rating;
  int reviewsCount;
  String deliveryTime;
  double price;
  int quantity;
  bool isVeg;
  String? restaurantName;
  List<AddOnModel> addons;

  FoodModel({
    this.id = "",
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.reviewsCount,
    required this.deliveryTime,
    required this.price,
    this.quantity = 1,
    this.isVeg = true,
    this.restaurantName,
    this.addons = const [],
  });

  double get totalAddOnPrice =>
      addons.where((a) => a.isSelected).fold(0, (sum, a) => sum + a.price);

  double get totalPrice =>
      (price + totalAddOnPrice) * quantity;
}
class AddOnModel {
  String id;
  String name;
  double price;
  bool isSelected;

  AddOnModel({
    required this.id,
    required this.name,
    required this.price,
    this.isSelected = false,
  });
}
