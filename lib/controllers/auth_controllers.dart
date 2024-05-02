import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mechanix/data/auth_service.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/models/user_model.dart';
import 'package:mechanix/views/auth/change_password.dart';
import 'package:mechanix/views/auth/login.dart';
import 'package:mechanix/views/auth/otp.dart';
import 'package:mechanix/views/auth/verify_email.dart';
import 'package:mechanix/views/dashboard/dashboard.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  RxBool showPassword = false.obs;
  RxBool showConfirmPassword = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final _storage = GetStorage();
  void saveUserInfo(Map<String, dynamic> userInfo) {
    _storage.write('user_info', userInfo);
  }

  //Calling Apis Methods.

  // RegisterUser
  Future<void> registerUser() async {
    // if (signupFormKey.currentState?.validate() ?? false) {
    isLoading.value = true;

    debugPrint('Name: ${nameController.text.trim()}');
    debugPrint('Email: ${emailController.text.trim()}');
    debugPrint('Password: ${passwordController.text.trim()}');
    debugPrint('Confirm Password: ${confirmPasswordController.text.trim()}');

    // Call the separateNames method
    separateNames(nameController.text.trim());
    debugPrint('First Name: $firstName');
    debugPrint('Last Name: $lastName');
    // Call the registerUser method in AuthService
    try {
      // Call the registerUser method in AuthService and handle the response
      Map<String, dynamic> response = await AuthService().registerUser(
          firstName: firstName.value,
          lastName: lastName.value,
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          confirmPassword: confirmPasswordController.text.trim());

      // Handle registration success and failure
      if (response['status'] == 'success') {
        debugPrint('Registration successful');
        Fluttertoast.showToast(msg: response['message']);
        Get.to(() => OtpScreen(
              verifyOtpForForgetPassword: false,
              email: emailController.text.trim(),
            ));
        // clearAllControllers();
        // if response['status'] == 'error'
      } else {
        debugPrint('Registration failed');
        debugPrint(response['message']);
        ToastMessage.showToastMessage(
            message: response['message'], backgroundColor: Colors.red);
      }
    } catch (e) {
      debugPrint('An error occurred during registration: $e');
      Fluttertoast.showToast(msg: 'An error occurred during registration');
    } finally {
      isLoading.value = false;
    }
  }

  //verifyEmail
  Future<void> verifyEmail() async {
    if (emailController.text.isNotEmpty && otpController.text.isNotEmpty) {
      isLoading.value = true;
      debugPrint('Email: ${emailController.text.trim()}');
      debugPrint('OTP: ${otpController.text.trim()}');

      try {
        Map<String, dynamic> response = await AuthService().verifyEmail(
          email: emailController.text.trim(),
          otp: otpController.text.trim(),
        );

        if (response['status'] == 'success') {
          Fluttertoast.showToast(msg: response['message']);
          Get.offAll(() => LoginScreen());
          // clearAllControllers();
        } else {
          Fluttertoast.showToast(msg: response['message']);
        }
      } catch (e) {
        Fluttertoast.showToast(
            msg: 'An error occurred during email verification');
      } finally {
        isLoading.value = false;
      }
    }
  }

  //loginUser
  Future<void> loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isLoading.value = true;
      debugPrint('Email: ${emailController.text.trim()}');
      debugPrint('Password: ${passwordController.text.trim()}');

      try {
        Map<String, dynamic> response = await AuthService().loginUser(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (response['status'] == 'success') {
          Fluttertoast.showToast(
              msg: 'Login Successfully', backgroundColor: Colors.green);
          _storage.write('token', response['token']);
          debugPrint('TokenAtStorage: ${_storage.read('token')}');

          saveUserInfo(response['user']);
          debugPrint('UserInfo: ${_storage.read('user_info')}');
          Get.offAll(() => const DashboardScreen(),
              transition: Transition.zoom);
          // clearAllControllers();
        } else {
          response['message'] == 'Please Verify Your Email First'
              ? Get.to(() => VerifyEmailScreen(),
                  transition: Transition.rightToLeft)
              : null;
          Fluttertoast.showToast(
              msg: response['message'], backgroundColor: Colors.red);
          // Get.offAll(() => OtpScreen(
          //       email: emailController.text.trim(),
          //       verifyOtpForForgetPassword: false,
          //     ));
        }
      } catch (e) {
        Fluttertoast.showToast(msg: 'Something went wrong, please try again.');
      } finally {
        isLoading.value = false;
      }
    }
  }

  //sendOtp
  Future<void> sendOtp({required bool verifyOtpForForgetPassword}) async {
    if (emailController.text.isNotEmpty) {
      isLoading.value = true;
      debugPrint('Email: ${emailController.text.trim()}');

      try {
        Map<String, dynamic> response = await AuthService().sendOtp(
          email: emailController.text.trim(),
        );

        if (response['status'] == 'success') {
          Fluttertoast.showToast(msg: response['message']);

          Get.off(() => OtpScreen(
                verifyOtpForForgetPassword: verifyOtpForForgetPassword,
                email: emailController.text.trim(),
              ));
          // clearAllControllers();
        } else {
          Fluttertoast.showToast(msg: response['message']);
        }
      } catch (e) {
        Fluttertoast.showToast(msg: 'Something went wrong, please try again.');
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> verifyOtp({required bool verifyOtpForForgetPassword}) async {
    if (emailController.text.isNotEmpty && otpController.text.isNotEmpty) {
      isLoading.value = true;
      debugPrint('Email: ${emailController.text.trim()}');
      debugPrint('OTP: ${otpController.text.trim()}');

      try {
        Map<String, dynamic> response = await AuthService().verifyOtp(
          email: emailController.text.trim(),
          otp: otpController.text.trim(),
        );

        if (response['status'] == 'success') {
          debugPrint('verifyOtpForForgetPassword: $verifyOtpForForgetPassword');
          debugPrint('VERIFY OTP API CALLED SUCCESSFULLY');
          ToastMessage.showToastMessage(
              message: 'OTP Verified Successfully',
              backgroundColor: Colors.green);

          // Accessing the token correctly
          // _storage.write('token', response['data']['token']); //giving type errors
          String token = response['data'][0]['token'];

          debugPrint('TokenReceived: $token');
          _storage.write('token', token);
          debugPrint('TokenAtStorage: ${_storage.read('token')}');
          verifyOtpForForgetPassword
              ? Get.offAll(() => ChangePasswordScreen())
              : Get.offAll(() => const DashboardScreen());
          // clearAllControllers();
        } else {
          debugPrint('RESPONSE: ${response['message']}');
          Fluttertoast.showToast(msg: response['message']);
        }
      } catch (e) {
        debugPrint('SOMETHING WENT WRONG: ${e.toString()}');
        Fluttertoast.showToast(msg: e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  //changePassword
  Future<void> changePassword() async {
    if (passwordController.text.isNotEmpty ==
        confirmPasswordController.text.isNotEmpty) {
      isLoading.value = true;
      debugPrint('Password: ${passwordController.text.trim()}');
      debugPrint('ConfirmPassword: ${confirmPasswordController.text.trim()}');

      try {
        Map<String, dynamic> response = await AuthService().changePassword(
            password: passwordController.text.trim(),
            confirmPassword: confirmPasswordController.text.trim(),
            token: _storage.read('token'));

        if (response['status'] == 'success') {
          Fluttertoast.showToast(msg: response['message']);
          Get.offAll(() => const DashboardScreen());
        } else {
          Fluttertoast.showToast(msg: response['message']);
        }
      } catch (e) {
        Fluttertoast.showToast(
            msg: 'An error occurred during changing password');
      } finally {
        isLoading.value = false;
      }
    }
  }

  void separateNames(String fullName) {
    List<String> names = fullName.split(' ');
    if (names.length > 1) {
      firstName.value = names[0];
      lastName.value = names.sublist(1).join(' ');
    } else {
      firstName.value = fullName;
      lastName.value = '';
    }
  }

  // void clearAllControllers() {
  //   nameController.clear();
  //   emailController.clear();
  //   passwordController.clear();
  //   confirmPasswordController.clear();
  //   otpController.clear();
  // }

  @override
  onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  //Subscriptions
  RxBool isSubscriptionPurchased = false.obs;
  late SubscriptionType subscriptionType;
  final Rx<SubscriptionType?> selectedSubscription = SubscriptionType.none.obs;

  void setSelectedSubscription(SubscriptionType subscriptionType) {
    selectedSubscription.value = subscriptionType;
  }

  void updateUserSubscription() {
    subscriptionType = selectedSubscription.value ?? SubscriptionType.none;
    isSubscriptionPurchased.value = true;
  }
}
