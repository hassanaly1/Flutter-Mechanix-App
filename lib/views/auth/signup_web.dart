import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/auth_controllers.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/views/auth/login_web.dart';

class SignupScreenWeb extends StatelessWidget {
  final AuthController controller;
  const SignupScreenWeb({super.key, required this.controller});

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
            mainAxisSize: MainAxisSize.max,
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
                  padding:
                      EdgeInsets.symmetric(vertical: context.height * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: context.height * 0.02),
                      CustomTextWidget(
                        text: 'Register Account',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                      CustomTextWidget(
                        text:
                            'Please enter your Details to register the Account.',
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
                                hintText: 'Name',
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: AppColors.primaryColor,
                                )

                                // validator: (val) =>
                                //     AppValidator.validateEmail(value: val),
                                ),
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
                          ],
                        ),
                      ),
                      SizedBox(height: context.height * 0.02),
                      CustomButton(
                        buttonText: 'Register',
                        onTap: () {},
                      ),
                      SizedBox(height: context.height * 0.01),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            context.width > 900
                                ? controller.isLoginScreen.value = true
                                : Get.to(() =>
                                    LoginScreenWeb(controller: controller));
                          },
                          child: Text.rich(
                            TextSpan(
                              text: 'Already have an account? ',
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0),
                              children: [
                                TextSpan(
                                  text: 'Login',
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
