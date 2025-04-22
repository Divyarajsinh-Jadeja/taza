import 'package:taza/taza.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      designSize: AppConst.designSize,
      builder: (context, child) {
        Get.put(AppController());
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          enableLog: true,
          title: AppConst.appName,
          theme: AppController.to.themeData.value,
          builder: (context, widget) => getMainAppViewBuilder(context, widget),
          getPages: AppRoutes.pages,
          initialRoute: AppRoutes.initialRoute,
          navigatorKey: NavigatorKey.navigatorKey,
          translationsKeys: AppTranslation.translations,
          locale: AppController.to.appLocale.value,
          supportedLocales: AppController.to.supportedLocales,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

        );
      },
    );
  }

  /// Create main app view builder
  Widget getMainAppViewBuilder(BuildContext context, Widget? widget) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Stack(
        children: [
          Obx(() {
            return PopScope(
              canPop: AppController.to.isShowLoading.isFalse,
              child: IgnorePointer(
                ignoring: AppController.to.isShowLoading.isTrue,
                child: Stack(
                  children: [
                    if (widget != null) widget,
                    buildDateBannerTag(),
                    if (AppController.to.isShowLoading.isTrue) // Top level loading ( used while api calls)
                      ColoredBox(color: Colors.black.withValues(alpha: 0.5), child: const Center(child: CircularProgressIndicator())),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  /// Build date banner tag on top right corner
  Align buildDateBannerTag() {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: const Banner(
        message: "22 April",
        location: BannerLocation.topEnd,
      ),
    );
  }
}
