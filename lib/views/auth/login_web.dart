import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/auth_controllers.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/views/auth/forget_password.dart';
import 'package:mechanix/views/auth/signup_web.dart';
import 'package:mechanix/views/dashboard/dashboard.dart';

class LoginScreenWeb extends StatelessWidget {
  final AuthController controller;
  const LoginScreenWeb({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(255, 220, 105, 0.4),
                Color.fromRGBO(86, 127, 255, 0.4),
              ],
            ),
            boxShadow: [
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: context.height * 0.1),
              Image.asset('assets/images/app-logo.png',
                  height: context.height * 0.15, fit: BoxFit.cover),
              SizedBox(height: context.height * 0.08),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(22.0),
                        topRight: Radius.circular(22.0))),
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: context.height * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            InkWell(
                              onTap: () {
                                context.width > 900
                                    ? null
                                    : Get.to(() => const ForgetPasswordScreen());
                              },
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
                      SizedBox(height: context.height * 0.02),
                      CustomButton(
                        buttonText: 'Login',
                        onTap: () {
                          Get.offAll(
                            () => const DashboardScreen(),
                            transition: Transition.size,
                            duration: const Duration(milliseconds: 700),
                          );
                          ToastMessage.showToastMessage(
                              message: 'Login Successfully',
                              backgroundColor: AppColors.blueTextColor);
                        },
                      ),
                      SizedBox(height: context.height * 0.01),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            context.width > 900
                                ? controller.isLoginScreen.value = false
                                : Get.to(() =>
                                    SignupScreenWeb(controller: controller));
                          },
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
      ),
    );
  }
}
