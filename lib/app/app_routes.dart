import 'package:taza/taza.dart';
import 'package:taza/ui/track_order/binding/order_tracking_binding.dart';
import 'package:taza/ui/track_order/view/order_tracking_page.dart';

/// All routes for app pages are defined here
class AppRoutes {
  static const initialRoute = '/';
  static const loginPage = '/login_page';
  static const dashboardPage = '/dashboard_page';
  static const checkoutPage = '/checkout_page';
  static const orderTrackingPage = '/order_tracking_page';

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.initialRoute,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: AppConst.transitionDuration),
    ),
    GetPage(
      name: AppRoutes.loginPage,
      page: () => const LoginPage(),
      binding: LoginBinding(),
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
      name: AppRoutes.checkoutPage,
      page: () => const CheckoutPage(),
      binding: CheckoutBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: AppConst.transitionDuration),
    ),
    GetPage(
      name: AppRoutes.orderTrackingPage,
      page: () => const OrderTrackingPage(),
      binding: OrderTrackingBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: AppConst.transitionDuration),
    ),
  ];
}
