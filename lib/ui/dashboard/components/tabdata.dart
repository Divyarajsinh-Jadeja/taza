import 'package:taza/taza.dart';

class TabData<T> {
  final WidgetBuilder pageBuilder;
  final BottomNavigationBarDataModel bottomNavData;
  final VoidCallback? onInit;
  final bool shouldAlwaysInitialize;

  TabData({required this.pageBuilder, required this.bottomNavData, this.onInit, this.shouldAlwaysInitialize = false});
}
