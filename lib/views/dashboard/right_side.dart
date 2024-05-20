import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:mechanix/views/add_task/compressor_task/add_compressor_task.dart';
import 'package:mechanix/views/add_task/generator_task/add_generator_task.dart';
import 'package:mechanix/views/engines.dart';
import 'package:mechanix/views/home.dart';
import 'package:mechanix/views/profile.dart';
import 'package:mechanix/views/reports.dart';
import 'package:mechanix/views/view_task.dart';

class RightSideWidget extends StatelessWidget {
  const RightSideWidget({
    super.key,
    required this.pageController,
    required this.sideMenu,
    required this.tabController,
  });

  final PageController pageController;
  final SideMenuController sideMenu;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    debugPrint('RightSideBuildCalled');
    return Expanded(
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        // controller: pageController,
        controller: tabController,
        children: [
          HomeScreen(sideMenu: sideMenu), // 0
          // const SizedBox.shrink(), //Drawer // 1
          GeneratorTaskScreen(sideMenu: sideMenu, isUpdatingTask: false), // 1
          CompressorTaskScreen(sideMenu: sideMenu, isUpdatingTask: false), // 2
          ViewAllTasksScreen(sideMenu: sideMenu), // 3
          ReportsScreen(sideMenu: sideMenu), // 4
          const SizedBox.shrink(), //Customize Units // 5
          EnginesScreen(sideMenu: sideMenu), // 6
          const SizedBox.shrink(), //Drawer // 7
          // RenewalSubscriptions(sideMenu: sideMenu),
          ProfileSection(sideMenu: sideMenu), // 8
        ],
      ),
    );
  }
}
