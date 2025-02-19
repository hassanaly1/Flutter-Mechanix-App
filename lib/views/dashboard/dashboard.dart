import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/dashboard_controller.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/profile_avatar.dart';
import 'package:mechanix/views/dashboard/right_side.dart';
import 'package:mechanix/views/dashboard/side_menu.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  final UniversalController universalController =
      Get.put(UniversalController());
  final DashboardController controller = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
    debugPrint('DashboardScreenOnInitCalled');
    controller.tabController = TabController(
      initialIndex: 0,
      length: 12,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('DashboardScreenBuildCalled');
    return SafeArea(
      child: DefaultTabController(
        length: 9,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/home-bg.png', fit: BoxFit.fill),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  HomeAppbar(sideMenu: controller.sideMenu),
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
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.circular(32.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: context.isLandscape,
                            child: SideMenuCard(sideMenu: controller.sideMenu),
                          ),
                          RightSideWidget(
                            pageController: controller.pageController,
                            sideMenu: controller.sideMenu,
                            tabController: controller.tabController,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeAppbar extends StatelessWidget {
  final SideMenuController sideMenu;

  HomeAppbar({
    super.key,
    required this.sideMenu,
  });

  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    // var currentPage = sideMenu.currentPage;

    return SizedBox(
      height: context.height * 0.15,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                context.isLandscape
                    ? Image.asset(
                        'assets/images/app-logo-white.png',
                        height: context.height * 0.1,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: context.isLandscape
                      ? Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.logout_rounded),
                          ),
                        )
                      : Obx(
                          () => controller.currentPage.value == 0
                              ? ProfileAvatar(
                                  onTap: () => sideMenu.changePage(11),
                                )
                              : const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.transparent),
                        ),
                ),
              ],
            ),
            Obx(
              () => Flexible(
                child: CustomTextWidget(
                  text: controller.currentPage.value == 0
                      ? 'Service reports made easy'
                      : controller.currentPage.value == 1
                          ? 'Add Task'
                          : controller.currentPage.value == 2
                              ? 'Add Generator Task'
                              : controller.currentPage.value == 3
                                  ? 'Add Compressor Task'
                                  : controller.currentPage.value == 4
                                      ? 'Add V8 Report'
                                      : controller.currentPage.value == 5
                                          ? 'Add V12 Report'
                                          : controller.currentPage.value == 6
                                              ? 'Add V16 Report'
                                              : controller.currentPage.value ==
                                                      7
                                                  ? 'Add Assembly Report'
                                                  : controller.currentPage
                                                              .value ==
                                                          8
                                                      ? 'View Task'
                                                      : controller.currentPage
                                                                  .value ==
                                                              9
                                                          ? 'Engines'
                                                          : controller.currentPage
                                                                      .value ==
                                                                  11
                                                              ? 'Profile'
                                                              : '',
                  textColor: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
