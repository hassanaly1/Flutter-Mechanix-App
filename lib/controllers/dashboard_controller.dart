import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final PageController pageController = PageController();
  final SideMenuController sideMenu = Get.put(SideMenuController());

  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
      currentPage.value = sideMenu.currentPage;
      print('Index: $index');
      print('CurrentPage: ${currentPage.value}');
    });
    super.onInit();
  }
}
