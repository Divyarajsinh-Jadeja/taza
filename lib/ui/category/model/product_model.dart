import 'package:taza/taza.dart';
class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final List<SubCategoryItemVariant>? variants;
  ProductModel({required this.id, required this.name, required this.description, required this.price, required this.imageUrl,this.variants});
}
