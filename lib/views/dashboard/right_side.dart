import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:mechanix/views/add_task/add_task.dart';
import 'package:mechanix/views/home.dart';
import 'package:mechanix/views/profile.dart';
import 'package:mechanix/views/engines.dart';
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
          HomeScreen(sideMenu: sideMenu),
          const SizedBox.shrink(), //Drawer
          AddTaskScreen(sideMenu: sideMenu),
          ViewAllTasksScreen(sideMenu: sideMenu),
          ReportsScreen(sideMenu: sideMenu),
          const SizedBox.shrink(), //Customize Units
          EnginesScreen(sideMenu: sideMenu),
          const SizedBox.shrink(), //Drawer
          // RenewalSubscriptions(sideMenu: sideMenu),
          ProfileSection(sideMenu: sideMenu),
        ],
      ),
    );
  }
}
