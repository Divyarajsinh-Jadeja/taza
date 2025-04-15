import 'package:taza/taza.dart';
class GroceryCategoryModel {
  final String id;
  final String name;
  final List<SubCategoryModel> subCategories;

  GroceryCategoryModel({
    required this.id,
    required this.name,
    required this.subCategories,
  });
}
class SubCategoryModel {
  final String id;
  final String name;
  final List<FoodModel> foods;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.foods,
  });
}
