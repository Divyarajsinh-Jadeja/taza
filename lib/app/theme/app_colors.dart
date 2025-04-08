import 'package:taza/taza.dart';

AppColor colors(BuildContext context) => Theme.of(context).colors;

/// To get Light and dark mode.[AppThemes]
class AppThemes {
  late ThemeData selectedColor;
  AppColor appColor = const AppColor(
    primary: Color(0xFF231F20),
    white: Color(0xFFFFFFFF),
    transparent: Color(0x00000000),
    colorF65D3C: Color(0xFFF65D3C),
    color303538: Color(0xFF303538),
    colorD3DAE0: Color(0xFFD3DAE0),
    colorF7F9FA: Color(0xFFF7F9FA),
    color8C8C8C: Color(0xFF8C8C8C),
    colorC5DEEB: Color(0xFFC5DEEB),
    black: Color(0xFF000000),
    color0CF52B: Color(0xFF0CF52B),
    color1D1D1F: Color(0xFF1D1D1F),
    colorF5F5F7: Color(0xFFF5F5F7),
    color424245: Color(0xFF424245),
    colorD2D2D7: Color(0xFFD2D2D7),
    color911CD2: Color(0xFF911CD2),
    colorFF0000: Color(0xFFFF0000),
    colorFFFF00: Color(0xFFFFFF00),
    color1546E3: Color(0xFF1546E3),
    color34C759: Color(0xFF34C759),
    color6E6E73: Color(0xFF6E6E73),
    color30D158: Color(0xFF30D158),
    color231F20: Color(0xFF231F20),
    colorEEEAE5: Color(0xFFEEEAE5),
    colorB3866F: Color(0xFFB3866F),
    colorF5F2EF: Color(0xFFF5F2EF),
    colorF2E6DF: Color(0xFFF2E6DF),
    colorFFBF9F: Color(0xFFFFBF9F),
    color00BAB3: Color(0xFF00BAB3),
  );

  ThemeData light({MaterialColor? theme}) {
    return ThemeData(
        useMaterial3: true,
        primaryColor: appColor.primary,
        scaffoldBackgroundColor: appColor.white,
        dividerTheme: DividerThemeData(color: appColor.colorD3DAE0, space: 1.h),
        colorScheme: ColorScheme.fromSeed(seedColor: appColor.primary, primary: appColor.primary),
        indicatorColor: appColor.primary,
        textSelectionTheme: TextSelectionThemeData(
            // selectionHandleColor: appColor.primary,
            // cursorColor: appColor.primary,
            // selectionColor: appColor.primary,
            ))
      ..addThemeConfig(appColor);
  }

  ThemeData dark({MaterialColor? theme}) {
    return ThemeData(
        useMaterial3: true,
        primaryColor: appColor.primary,
        scaffoldBackgroundColor: appColor.white,
        dividerTheme: DividerThemeData(color: appColor.colorD3DAE0, space: 1.h),
        colorScheme: ColorScheme.fromSeed(seedColor: appColor.primary),
        textSelectionTheme: const TextSelectionThemeData(
            //TODO: will update this.
            // cursorColor: appColor.bg7AD6FF,
            // selectionColor: appColor.bg7AD6FF,
            // selectionHandleColor: appColor.bg7AD6FF,
            ))
      ..addThemeConfig(appColor);
  }
}

class AppColor {
  final Color primary;
  final Color white;
  final Color black;
  final Color transparent;
  final Color colorF65D3C;
  final Color color303538;
  final Color colorD3DAE0;
  final Color colorF7F9FA;
  final Color color8C8C8C;
  final Color colorC5DEEB;
  final Color color0CF52B;
  final Color color1D1D1F;
  final Color colorF5F5F7;
  final Color color424245;
  final Color colorD2D2D7;
  final Color color911CD2;
  final Color colorFF0000;
  final Color color1546E3;
  final Color colorFFFF00;
  final Color color34C759;
  final Color color6E6E73;
  final Color color30D158;
  final Color color231F20;
  final Color colorEEEAE5;
  final Color colorB3866F;
  final Color colorF5F2EF;
  final Color colorF2E6DF;
  final Color colorFFBF9F;
  final Color color00BAB3;

  const AppColor({
    required this.primary,
    required this.white,
    required this.colorF65D3C,
    required this.color303538,
    required this.colorD3DAE0,
    required this.colorF7F9FA,
    required this.color8C8C8C,
    required this.colorC5DEEB,
    required this.transparent,
    required this.black,
    required this.color0CF52B,
    required this.color1D1D1F,
    required this.colorF5F5F7,
    required this.color424245,
    required this.colorD2D2D7,
    required this.color911CD2,
    required this.colorFF0000,
    required this.color1546E3,
    required this.colorFFFF00,
    required this.color34C759,
    required this.color6E6E73,
    required this.color30D158,
    required this.color231F20,
    required this.colorEEEAE5,
    required this.colorB3866F,
    required this.colorF5F2EF,
    required this.colorF2E6DF,
    required this.colorFFBF9F,
    required this.color00BAB3
  });
}

extension ThemeDataExtensions on ThemeData {
  static final Map<InputDecorationTheme, AppColor> _colors = {};

  void addThemeConfig(AppColor theme) {
    _colors[inputDecorationTheme] = theme;
  }

  static AppColor? empty;

  // AppThemeData get  theme => _themeData[inputDecorationTheme] ?? AppThemeData.empty();
  AppColor get colors => _colors[inputDecorationTheme]!;
}
