import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/helpers/appcolors.dart';

class CustomTabBar extends StatelessWidget {
  final String title1;
  final String title2;

  const CustomTabBar({
    super.key,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: Colors.black45)),
      child: TabBar(
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: AppColors.secondaryColor,
        ),
        labelStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'poppins'),
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          Tab(text: title1),
          Tab(text: title2),
        ],
      ),
    );
  }
}
