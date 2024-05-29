import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/helpers/appcolors.dart';

class CustomTabBar extends StatelessWidget {
  final String? title1;
  final String? title2;
  final String? title3;
  void Function(int)? onTap;

  CustomTabBar({super.key, this.title1, this.title2, this.title3, this.onTap});

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
        onTap: onTap,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: AppColors.secondaryColor,
        ),
        labelStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'poppins'),
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: true,
        tabAlignment: TabAlignment.center,
        tabs: [
          Tab(text: title1),
          Tab(text: title2),
          if (title3 != null) Tab(text: title3),
        ],
      ),
    );
  }
}
