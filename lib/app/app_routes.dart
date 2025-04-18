import 'package:taza/taza.dart';

/// All routes for app pages are defined here
class AppRoutes {
  static const initialRoute = '/';
  static const loginPage = '/login_page';
  static const dashboardPage = '/dashboard_page';
  static const checkoutPage = '/checkout_page';
  static const orderTrackingPage = '/order_tracking_page';
  static const couponsPage = '/coupons_page';
  static const profilePage = '/profile_page';
  static const paymentPage = '/paymentPage';

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
      name: AppRoutes.couponsPage,
      page: () => const CouponsPage(),
      binding: CouponsBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: AppConst.transitionDuration),
    ),
    GetPage(
      name: AppRoutes.profilePage,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
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
    GetPage(
      name: AppRoutes.paymentPage,
      page: () => const PaymentMethodScreen(),
      binding: PaymentBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: AppConst.transitionDuration),
    ),
  ];
}
