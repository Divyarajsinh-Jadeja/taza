import 'package:taza/taza.dart';

class SearchCategoryModel {
  final String title;
  final List<InstamartProductModel>? products;
  final List<FoodTabData>? foodTabData;
  List<String>? pastSearches;

  SearchCategoryModel({required this.title, this.products, this.foodTabData, this.pastSearches});
}