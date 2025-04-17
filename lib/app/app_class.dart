import 'package:taza/taza.dart';

class AppController extends GetMaterialController {
  static AppController get to => Get.find();
  final AppThemes appThemes = AppThemes();
  final Connectivity _connectivity = Connectivity();

  Rx<ThemeData> themeData = ThemeData.light().obs; // Temporary default theme
  Rx<Locale> appLocale = const Locale('en').obs;
  final List<Locale> supportedLocales = const [Locale('en'), Locale('ar')];

  Stream? _connectivityStream;
  var isShowLoading = false.obs;

  /// Show-hide top level loading
  void showLoading(bool value) {
    isShowLoading.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    debugPrint('AppController onInit');
    if (_connectivityStream == null) {
      _connectivityStream = _connectivity.onConnectivityChanged;
      _connectivityStream!.listen((result) => checkConnectivityResult(result));
    }
    _loadAppLocale();
    _loadAppTheme();
  }

  // Load the saved theme from storage
  Future<void> _loadAppTheme() async {
    final String theme = StorageManager.instance.getTheme();
    debugPrint("theme $theme");

    if (theme == AppConst.themeDark) {
      themeData.value = appThemes.dark();
    } else if (theme == AppConst.themeLight) {
      themeData.value = appThemes.light();
    } else if (theme == AppConst.themeSystem) {
      /// TODO: Need to change based on system theme
    }
  }

  // Handle theme change
  void onChangeTheme(String theme) async {
    if (theme == AppConst.themeDark) {
      await setThemeDataDark();
    } else if (theme == AppConst.themeLight) {
      await setThemeDataLight();
    } else if (theme == AppConst.themeSystem) {
      bool systemTheme = StorageManager.instance.getSystemTheme();
      //TODO: Need to change based on system theme
      if (systemTheme) {
        await setThemeDataDark();
      } else {
        await setThemeDataLight();
      }
    }
  }

  // Set Dark theme
  Future<void> setThemeDataDark() async {
    themeData.value = appThemes.dark();
    StorageManager.instance.setTheme(AppConst.themeDark);
  }

  // Set Light theme
  Future<void> setThemeDataLight() async {
    themeData.value = appThemes.light();
    StorageManager.instance.setTheme(AppConst.themeLight);
  }

  // Method to check connectivity result (as per your original code)
  void checkConnectivityResult(dynamic result) {
    // Add your connectivity handling logic here
  }

  // Load and set locale on startup
  Future<void> _loadAppLocale() async {
    final code = StorageManager.instance.getUserLanguage();
    if (code != null) {
      appLocale.value = supportedLocales.firstWhere((loc) => loc.languageCode == code, orElse: () => const Locale('en', 'US'));
    } else {
      appLocale.value = Get.deviceLocale ?? const Locale('en', 'US');
    }

    Get.updateLocale(appLocale.value);
  }

  // Change language
  void changeLocale(Locale locale) {
    appLocale.value = locale;
    Get.updateLocale(locale);
    StorageManager.instance.saveUserLanguage(locale.languageCode);
  }
}
