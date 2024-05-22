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
      length: 13,
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
      height:
          context.isLandscape ? context.height * 0.15 : context.height * 0.15,
      child:
          // context.isLandscape
          //     ? Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               context.isLandscape
          //                   ? Image.asset(
          //                       'assets/images/app-logo-white.png',
          //                       height: context.height * 0.1,
          //                       fit: BoxFit.cover,
          //                     )
          //                   : IconButton(
          //                       onPressed: () => sideMenu.changePage(1),
          //                       icon: const Icon(Icons.arrow_back_rounded,
          //                           color: Colors.white70)),
          //               Obx(
          //                 () => CustomTextWidget(
          //                   text: controller.currentPage.value == 0
          //                       ? 'Service reports made easy'
          //                       : controller.currentPage.value == 2
          //                           ? 'Service reports made easy'
          //                           : controller.currentPage.value == 3
          //                               ? 'View Task'
          //                               : controller.currentPage.value == 5
          //                                   ? 'Reports'
          //                                   : controller.currentPage.value == 6
          //                                       ? 'Customize Units'
          //                                       : controller.currentPage.value == 7
          //                                           ? 'Engines'
          //                                           : '',
          //                   textColor: Colors.white,
          //                   fontSize: context.isLandscape ? 20.0 : 18.0,
          //                   fontWeight: FontWeight.w600,
          //                   maxLines: 2,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: context.isLandscape
          //                 ? Container(
          //                     decoration: BoxDecoration(
          //                       shape: BoxShape.circle,
          //                       color: Colors.grey.shade200,
          //                     ),
          //                     child: IconButton(
          //                       onPressed: () {},
          //                       icon: const Icon(Icons.logout_rounded),
          //                     ),
          //                   )
          //                 : Visibility(
          //                     visible:
          //                         controller.currentPage.value == 3 ? false : true,
          //                     child: ProfileAvatar(
          //                       onTap: () => sideMenu.changePage(8),
          //                     )),
          //           ),
          //         ],
          //       )
          //     :
          Padding(
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
                //todo: Back button functionality remaining.
                // : IconButton(
                //     onPressed: () => sideMenu.changePage(0),
                //     icon: const Icon(Icons.arrow_back_rounded,
                //         color: Colors.white70)),
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
                      : Visibility(
                          visible:
                              controller.currentPage.value == 3 ? false : true,
                          child: Row(
                            children: [
                              // IconButton(
                              //   onPressed: () => sideMenu.changePage(8),
                              //   icon: const Icon(
                              //     Symbols.event_repeat_rounded,
                              //     color: Colors.white,
                              //     size: 30,
                              //   ),
                              // ),
                              ProfileAvatar(
                                onTap: () => sideMenu.changePage(8),
                              ),
                            ],
                          )),
                ),
              ],
            ),
            Obx(
              () => Flexible(
                child: CustomTextWidget(
                  text: controller.currentPage.value == 0
                      ? 'Service reports made easy'
                      : controller.currentPage.value == 1
                          ? 'Add Generator Task'
                          : controller.currentPage.value == 2
                              ? 'Add Compressor Task'
                              : controller.currentPage.value == 3
                                  ? 'Add V8 Report'
                                  : controller.currentPage.value == 4
                                      ? 'Add V12 Report'
                                      : controller.currentPage.value == 5
                                          ? 'Add V16 Report'
                                          : controller.currentPage.value == 6
                                              ? 'Add Assembly Report'
                                              : controller.currentPage.value ==
                                                      7
                                                  ? 'View Task'
                                                  : controller.currentPage
                                                              .value ==
                                                          8
                                                      ? 'Reports'
                                                      : controller.currentPage
                                                                  .value ==
                                                              9
                                                          ? 'Customize Units'
                                                          : controller.currentPage
                                                                      .value ==
                                                                  10
                                                              ? 'Engines'
                                                              : '',
                  textColor: Colors.white,
                  fontSize: context.isLandscape ? 20.0 : 18.0,
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
