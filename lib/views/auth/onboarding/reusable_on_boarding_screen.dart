import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_text.dart';

class ReUsableBoardingScreen extends StatelessWidget {
  final String text;
  final String subText;

  const ReUsableBoardingScreen(
      {super.key, required this.text, required this.subText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: text,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  textColor: AppColors.blueTextColor,
                ),
                SizedBox(height: Get.height * 0.01),
                CustomTextWidget(
                  text: subText,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  textColor: AppColors.blueTextColor.withOpacity(0.7),
                ),
              ],
            ),
          )),
    );
  }
}
