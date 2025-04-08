class BottomNavigationBarDataModel {
  final String label;
  final String icon;
  final String activeIcon;
  final bool isProfile;
  final bool isShowBadge;

  BottomNavigationBarDataModel({
    required this.label,
    required this.icon,
    required this.activeIcon,
    this.isProfile = false,
    this.isShowBadge = false,
  });
}
