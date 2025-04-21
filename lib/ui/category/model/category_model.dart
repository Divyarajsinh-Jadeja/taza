import 'package:taza/ui/category/model/product_model.dart';

class CategoryModel {
  final String? id;
  final String? name;
  final String? image;
  final List<ProductModel>? products;

  CategoryModel({this.id, this.name, this.image, this.products});
}
