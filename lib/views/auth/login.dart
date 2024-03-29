import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/auth_controllers.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/helpers/toast.dart';

class LoginScreen extends StatelessWidget {
  final AuthController controller;
  const LoginScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/app-logo.png',
                height: context.height * 0.1, fit: BoxFit.cover),
            SizedBox(height: context.height * 0.05),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.0)),
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: context.height * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: context.height * 0.02),
                    CustomTextWidget(
                      text: 'Login',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomTextWidget(
                      text: 'Please enter your Email Password.',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      fontStyle: FontStyle.italic,
                      maxLines: 4,
                    ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: context.height * 0.03),
                          ReUsableTextField(
                              hintText: 'Email',
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: AppColors.primaryColor,
                              )

                              // validator: (val) =>
                              //     AppValidator.validateEmail(value: val),
                              ),
                          ReUsableTextField(
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock_open_rounded,
                                color: AppColors.primaryColor,
                              )
                              // validator: (val) =>
                              //     AppValidator.validatePassword(value: val),
                              ),
                          CustomTextWidget(
                            text: 'Forget Password?',
                            fontSize: 12.0,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.height * 0.02),
                    CustomButton(
                      buttonText: 'Login',
                      onTap: () {
                        // Get.offAll(
                        //   () => const DashboardScreen(),
                        //   transition: Transition.size,
                        //   duration: const Duration(milliseconds: 700),
                        // );
                        ToastMessage.showToastMessage(
                            message: 'Login Successfully',
                            backgroundColor: AppColors.blueTextColor);
                      },
                    ),
                    SizedBox(height: context.height * 0.01),
                    Center(
                      child: GestureDetector(
                        onTap: () => controller.isLoginScreen.value = false,
                        child: Text.rich(
                          TextSpan(
                            text: 'If you don’t have any account? ',
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0),
                            children: [
                              TextSpan(
                                text: 'Signup',
                                style: TextStyle(
                                    color: AppColors.blueTextColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
