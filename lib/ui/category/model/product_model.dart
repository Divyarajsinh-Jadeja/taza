import 'package:taza/taza.dart';
class InstamartProductModel {
   String id;
   String name;
   String description;
   double price;
   String imageUrl;
   int quantity;
   List<SubCategoryItemVariant>? variants;
  InstamartProductModel({required this.id, required this.name, required this.description, required this.price, required this.imageUrl,this.variants,this.quantity=0});
}
