import 'package:taza/taza.dart';

/// All routes for app pages are defined here
class AppRoutes {
  static const initialRoute = '/';
  static const dashboardPage = '/dashboard_page';
  static const reOrderScreen = '/reorder_screen';

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.initialRoute,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: AppConst.transitionDuration),
    ),
    GetPage(
      name: AppRoutes.dashboardPage,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: AppConst.transitionDuration),
    ),
    GetPage(
      name: AppRoutes.reOrderScreen,
      page: () => const ReorderScreen(),
    ),
  ];
}
