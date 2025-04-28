import 'package:taza/taza.dart';

class FoodTabData {
  final String imagePath;
  final Color themeColor;
  final Widget bannerWidget;
  final String? tabText;

  FoodTabData({required this.imagePath, required this.themeColor, required this.bannerWidget, this.tabText});
}

class ShoppingListOption {
  final String title;
  final IconData icon;
  final Color backgroundGradientStart;
  final Color backgroundGradientEnd;
  final VoidCallback? onTap;

  ShoppingListOption({
    required this.title,
    required this.icon,
    required this.backgroundGradientStart,
    required this.backgroundGradientEnd,
    this.onTap,
  });
}
