import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:mechanix/views/add_task/compressor_task/add_compressor_task.dart';
import 'package:mechanix/views/add_task/custom_task/add_custom_task.dart';
import 'package:mechanix/views/add_task/engine_overhawl_report/add_v8_report.dart';
import 'package:mechanix/views/add_task/generator_task/add_generator_task.dart';
import 'package:mechanix/views/engines.dart';
import 'package:mechanix/views/home.dart';
import 'package:mechanix/views/profile.dart';
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
          CustomTaskScreen(sideMenu: sideMenu),
          GeneratorTaskScreen(sideMenu: sideMenu),
          CompressorTaskScreen(sideMenu: sideMenu),
          AddReportScreen(sideMenu: sideMenu, reportType: 'V8'),
          AddReportScreen(sideMenu: sideMenu, reportType: 'V12'),
          AddReportScreen(sideMenu: sideMenu, reportType: 'V16'),
          AddReportScreen(sideMenu: sideMenu, reportType: 'L7042GL C-14871'),
          ViewAllTasksScreen(sideMenu: sideMenu),
          EnginesScreen(sideMenu: sideMenu),
          const SizedBox.shrink(),
          ProfileSection(sideMenu: sideMenu),
        ],
      ),
    );
  }
}
