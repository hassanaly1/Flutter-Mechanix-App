class ApiEndPoints {
  static String baseUrl = 'https://mechanix-api-production.up.railway.app';
  //Authentications
  static String registerUserUrl = '/api/auth/register'; //Registration
  static String verifyEmailUrl =
      '/api/auth/verify-email'; //Verification of email
  static String loginUserUrl = '/api/auth/login'; //Login
  static String sendOtpUrl =
      '/api/auth/send-reset-password-email'; //ForgetPassword & SendOtp
  static String verifyOtpUrl = '/api/auth/verify-reset-otp'; //VerifyOtp
  static String changePasswordUrl =
      '/api/auth/changepassword'; //Change Password

  //Task
  static String createTaskUrl = '/api/task/createtask';

  //Engine
  static String addEngineUrl = '/api/engine/createenginebrand';
}
