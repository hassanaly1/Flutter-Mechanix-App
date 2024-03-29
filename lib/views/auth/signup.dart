import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/auth_controllers.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';

class SignupScreen extends StatelessWidget {
  final AuthController controller;
  const SignupScreen({super.key, required this.controller});

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
                padding: EdgeInsets.symmetric(vertical: context.height * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        onTap: () => controller.isLoginScreen.value = true,
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
    );
  }
}
