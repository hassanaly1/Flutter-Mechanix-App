import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/auth_controllers.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/helpers/validator.dart';
import 'package:mechanix/views/auth/forget_password.dart';
import 'package:mechanix/views/auth/signup.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController controller = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/auth-background.png', fit: BoxFit.cover),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: context.height * 0.05,
                        bottom: context.height * 0.05),
                    child: Image.asset('assets/images/app-logo.png',
                        height: context.height * 0.12, fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: context.height * 0.02,
                      horizontal: context.width * 0.02),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                          spreadRadius: 5.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ]),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Opacity(
                          opacity: 0.3,
                          child: Image.asset(
                            'assets/images/gear.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.width > 700
                                ? context.width * 0.2
                                : context.width * 0.1),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: context.height * 0.1),
                              CustomTextWidget(
                                text: 'Login to your Account',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomTextWidget(
                                text: 'Please enter your Email & Password.',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                                fontStyle: FontStyle.italic,
                                maxLines: 4,
                              ),
                              Form(
                                key: controller.loginFormKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(height: context.height * 0.03),
                                    ReUsableTextField(
                                      controller: controller.emailController,
                                      hintText: 'Email',
                                      keyboardType: TextInputType.emailAddress,
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: AppColors.primaryColor,
                                      ),
                                      validator: (val) =>
                                          AppValidator.validateEmail(
                                              value: val),
                                    ),
                                    ReUsableTextField(
                                      controller: controller.passwordController,
                                      hintText: 'Password',
                                      obscureText: true,
                                      prefixIcon: Icon(
                                        Icons.lock_open_rounded,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => Get.to(
                                        () => ForgetPasswordScreen(),
                                        transition: Transition.size,
                                        duration: const Duration(seconds: 1),
                                      ),
                                      child: CustomTextWidget(
                                        text: 'Forget Password?',
                                        fontSize: 12.0,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: context.height * 0.01),
                              Obx(
                                () => CustomButton(
                                  buttonText: 'Login',
                                  isLoading: controller.isLoading.value,
                                  onTap: () {
                                    if (controller.loginFormKey.currentState!
                                        .validate()) {
                                      controller.loginUser();
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: context.height * 0.02),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => SignupScreen(),
                                      transition: Transition.size,
                                      duration: const Duration(seconds: 1),
                                    );
                                  },
                                  child: Text.rich(
                                    TextSpan(
                                      text: 'If you don’t have any account? ',
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.0),
                                      children: [
                                        TextSpan(
                                          text: 'Signup',
                                          style: TextStyle(
                                              color: AppColors.blueTextColor,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: context.height * 0.02),
                              // InkWell(
                              //   onTap: () {
                              //     //   Get.to(
                              //     //   () => SubscriptionScreen(),
                              //     //   transition: Transition.size,
                              //     //   duration: const Duration(seconds: 1),
                              //     // );
                              //   },
                              //   child: CustomTextWidget(
                              //     text: 'Want to Buy Subscription?',
                              //     fontSize: 16.0,
                              //     textAlign: TextAlign.center,
                              //     fontWeight: FontWeight.w500,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
