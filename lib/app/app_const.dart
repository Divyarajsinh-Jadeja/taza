import 'package:taza/taza.dart';

class AppConst {
  AppConst._();

  static Size designSize = const Size(390, 844);
  static const double defaultScrollControlDisabledMaxHeightRatio = 9.0 / 16.0;
  static const String appName = 'Tazza';
  static const String themeDark = 'dark';
  static const String themeLight = 'light';
  static const String themeSystem = 'system';
  static const String googleApiKey = ''; // Replace with your API Key

  ///Navigation Constants
  static const String isFromHome = 'isFromHome';
  static const String isFromInstamart = 'isFromInstamart';
  static const String isFromFood = 'isFromFood';

  static const int transitionDuration = 500;
}
