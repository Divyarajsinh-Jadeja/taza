import 'package:taza/taza.dart';

class AppController extends GetMaterialController {
  static AppController get to => Get.find();
  final AppThemes appThemes = AppThemes();
  final Connectivity _connectivity = Connectivity();

  Rx<ThemeData> themeData = ThemeData.light().obs; // Temporary default theme

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
      //TODO: Need to change based on system theme
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
}
