import 'package:taza/taza.dart';
class CategoriesModel {
  final String? id;
  final String? name;
  final List<SubCategoriesModel>? subCategories;

  CategoriesModel({
    this.id,
    this.name,
    this.subCategories,
  });
}
class SubCategoriesModel {
  final String? id;
  final String? name;
  final String? categoryUrl;
  final List<InstamartProductModel>? products;
  SubCategoriesModel({
    this.id,
    this.name,
    this.categoryUrl,
    this.products,
  });
}
class SubCategoryItemVariant {
  final String unit;
  final double price;
  final double originalPrice;

  SubCategoryItemVariant({
    required this.unit,
    required this.price,
    required this.originalPrice,
  });
}
