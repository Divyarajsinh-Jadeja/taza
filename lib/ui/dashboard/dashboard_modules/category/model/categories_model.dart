import 'package:taza/taza.dart';
class CategoriesModel {
  final String id;
  final String name;
  final List<SubCategoriesModel> subCategories;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.subCategories,
  });
}
class SubCategoriesModel {
  final String id;
  final String name;
  final String categoryUrl;

  SubCategoriesModel({
    required this.id,
    required this.name,
    required this.categoryUrl,
  });
}
