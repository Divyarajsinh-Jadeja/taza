/// All api endpoints are defined here
class ApiClient {
  ApiClient._();

  static const String apiBaseUrl = 'https://pestcontrolapp-api.btdemo.biz';

  static const String registerUser = '$apiBaseUrl/auth/register';
  static const String loginUser = '$apiBaseUrl/auth/login';
  static const String verifyEmail = '$apiBaseUrl/auth/verify-email';
  static const String resendOtp = '$apiBaseUrl/auth/resend-otp';
}
