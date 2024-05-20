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
  static String updateProfileUrl = '/api/auth/editprofile';

  //Generator-Task
  static String createTaskUrl = '/api/task/createtask';
  static String getAllTaskUrl = '/api/task/getalltasks';
  static String updateTaskUrl = '/api/task/updatetask';
  static String deleteTaskUrl = '/api/task/deletetask';

  //Compressor-tASK
  static String createCompressorUrl = '/api/compressor/createcompressorbrand';
  static String getCompressorUrl =
      '/api/compressor/getcompressorbrandpagination';
  static String getCompressorBrandById =
      '/api/compressor/getcompressorbrandbyid';
  static String updateCompressorUrl = '/api/compressor/updatecompressorbrand';
  static String deleteCompressorUrl = '/api/compressor/deletecompressorbrand';
  static String updateCompressorImageUrl =
      '/api/compressor/updatecompressorprofile';

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
