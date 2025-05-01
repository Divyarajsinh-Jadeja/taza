import 'package:taza/taza.dart';

class BottomNavigationBarDataModel {
  final String label;
  final String? icon;
  final String? activeIcon;
  final bool isProfile;
  final bool isShowBadge;
  final TextAlign? textAlign;

  BottomNavigationBarDataModel({
    required this.label,
    this.icon,
    this.activeIcon,
    this.isProfile = false,
    this.isShowBadge = false,
    this.textAlign,
  });
}
