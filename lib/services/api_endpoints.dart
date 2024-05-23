class ApiEndPoints {
  static String baseUrl = 'https://mechanix-api-production.up.railway.app';
  static String newBaseUrl = 'https://mechanix-api.vercel.app';

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
  static String updateProfileUrl = '/api/auth/editprofile';

  //Generator-Task
  static String createTaskUrl = '/api/task/createtask';
  static String getAllTaskUrl = '/api/task/getalltasks';
  static String updateTaskUrl = '/api/task/updatetask';
  static String deleteTaskUrl = '/api/task/deletetask';

  //Compressor-Task
  static String createCompressorUrl = '/api/compressor/createcompressor';
  static String getAllCompressorUrl = '/api/compressor/getCompressor';
  static String deleteCompressorByIdUrl = '/api/compressor/deleteCompressor';
  static String updateCompressorByIdUrl = '/api/compressor/updateCompressor';

  //OverHaul Reports

  //Engine
  static String addEngineUrl = '/api/engine/createenginebrand';
  static String getEngineUrl = '/api/engine/getenginebrandpagination';
  static String getEngineBrandById = '/api/engine/getenginebrandbyid';
  static String updateEngineUrl = '/api/engine/updateenginebrand';
  static String deleteEngineUrl = '/api/engine/deleteenginebrand';
  static String updateEngineImageUrl = '/api/engine/updateengineprofile';

  // Report
  static String createReportUrl = '/api/report/generateReportbyid';
  static String getReportUrl = '/api/report/getreportlistpagniation';
  static String getReportByIdUrl = '/api/report/getreportbyid';
  static String deleteReportUrl = '/api/report/deletereportbyid';
}
