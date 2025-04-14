import 'package:taza/taza.dart';

class FoodCategory {
  final String imagePath;
  final String name;
  final VoidCallback onTap;

  FoodCategory({required this.imagePath, required this.name, required this.onTap});
}
