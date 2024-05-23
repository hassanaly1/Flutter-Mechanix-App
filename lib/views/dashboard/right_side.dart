import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:mechanix/views/add_task/compressor_task/add_compressor_task.dart';
import 'package:mechanix/views/add_task/engine_overhawl_report_v8/add_v8_report.dart';
import 'package:mechanix/views/add_task/generator_task/add_generator_task.dart';
import 'package:mechanix/views/engines.dart';
import 'package:mechanix/views/home.dart';
import 'package:mechanix/views/profile.dart';
import 'package:mechanix/views/reports.dart';
import 'package:mechanix/views/view_task.dart';

import '../add_task/engine_overhawl_report_assembly/add_assembly_report.dart';

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
          // 0
          GeneratorTaskScreen(sideMenu: sideMenu, isUpdatingTask: false),
          // 1
          CompressorTaskScreen(sideMenu: sideMenu, isUpdatingTask: false),
          // 2
          AddV8ReportScreen(
              sideMenu: sideMenu, isUpdatingTask: false, reportType: 'V8'),
          // 3
          AddV8ReportScreen(
              sideMenu: sideMenu, isUpdatingTask: false, reportType: 'V12'),
          // 4
          AddV8ReportScreen(
              sideMenu: sideMenu, isUpdatingTask: false, reportType: 'V16'),
          // 5
          AddAssemblyReportScreen(sideMenu: sideMenu, isUpdatingTask: false),
          // 6
          ViewAllTasksScreen(sideMenu: sideMenu),
          // 7
          ReportsScreen(sideMenu: sideMenu),
          // 8
          const SizedBox.shrink(),
          // 9
          EnginesScreen(sideMenu: sideMenu),
          // 10
          const SizedBox.shrink(),
          //Drawer // 11
          // RenewalSubscriptions(sideMenu: sideMenu),
          ProfileSection(sideMenu: sideMenu),
          // 12
        ],
      ),
    );
  }
}
