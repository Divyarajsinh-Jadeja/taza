import 'package:taza/taza.dart';

/// All routes for app pages are defined here
class AppRoutes {
  static const initialRoute = '/';
  static const loginPage = '/login_page';
  static const otpVerificationPage = '/otp_verification_page';
  static const dashboardPage = '/dashboard_page';
  static const checkoutPage = '/checkout_page';
  static const orderTrackingPage = '/order_tracking_page';
  static const couponsPage = '/coupons_page';
  static const profilePage = '/profile_page';
  static const paymentPage = '/paymentPage';
  static const foodDetailsPage = '/food_details_page';
  static const categoryPage = '/category_page';
  static const addressPage = '/address_page';
  static const selectDeliveryLocationPage = '/select_delivery_location_page';
  static const saveAddressDetailsPage = '/save_address_details_page';

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
      name: AppRoutes.otpVerificationPage,
      page: () => const OtpVerificationPage(),
      binding: OtpVerificationBinding(),
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
    GetPage(
      name: AppRoutes.foodDetailsPage,
      page: () => const FoodDetailsPage(),
      binding: FoodDetailsBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: AppConst.transitionDuration),
    ),
    GetPage(
      name: AppRoutes.categoryPage,
      page: () => const CategoryScreen(),
      binding: CategoryBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: AppConst.transitionDuration),
    ),
    GetPage(
      name: AppRoutes.addressPage,
      page: () => const AddressPage(),
      binding: AddressBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: AppConst.transitionDuration),
    ),
    GetPage(
      name: AppRoutes.selectDeliveryLocationPage,
      page: () => const SelectDeliveryLocationPage(),
      binding: AddressBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: AppConst.transitionDuration),
    ),
    GetPage(
      name: AppRoutes.saveAddressDetailsPage,
      page: () => const SaveAddressDetailsPage(),
      binding: AddressBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: AppConst.transitionDuration),
    ),
  ];
}
