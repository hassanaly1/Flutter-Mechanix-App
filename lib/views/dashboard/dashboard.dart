import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/profile_avatar.dart';
import 'package:mechanix/views/dashboard/right_side.dart';
import 'package:mechanix/views/dashboard/side_menu.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/home-bg.png', fit: BoxFit.fill),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const HomeAppbar(),
              Expanded(
                child: Container(
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
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22.0),
                      topRight: Radius.circular(22.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                          visible: context.isLandscape,
                          child: SideMenuCard(sideMenu: sideMenu)),
                      RightSideWidget(
                          pageController: pageController, sideMenu: sideMenu),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          context.isLandscape ? context.height * 0.15 : context.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                Image.asset('assets/images/app-logo-white.png',
                    height: context.height * 0.1, fit: BoxFit.cover),
                Flexible(
                  child: CustomTextWidget(
                    text: 'Service reports made easy',
                    textColor: Colors.white,
                    fontSize: context.isLandscape ? 20.0 : 16.0,
                    fontWeight: FontWeight.w600,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: context.isLandscape
                ? Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade200),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.logout_rounded)))
                : const ProfileAvatar(),
          )
        ],
      ),
    );
  }
}
