class ApiEndPoints {
  static String baseUrl = 'https://mechanix-api-production.up.railway.app';
  //Authentications
  static String registerUserUrl = '/api/auth/register';
  static String verifyEmailUrl = '/api/auth/verify-email';
  static String loginUserUrl = '/api/auth/login';
  static String sendOtpUrl = '/api/auth/send-reset-password-email';
  static String verifyOtpUrl = '/api/auth/verify-reset-otp';
  static String changePasswordUrl = '/api/auth/changepassword';
}
