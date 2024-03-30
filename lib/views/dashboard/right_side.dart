import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:mechanix/views/dashboard/customize_units.dart';
import 'package:mechanix/views/dashboard/engines.dart';
import 'package:mechanix/views/dashboard/home.dart';
import 'package:mechanix/views/dashboard/reports.dart';
import 'package:mechanix/views/dashboard/start_task.dart';
import 'package:mechanix/views/dashboard/view_task.dart';

class RightSideWidget extends StatelessWidget {
  const RightSideWidget({
    super.key,
    required this.pageController,
    required this.sideMenu,
  });

  final PageController pageController;
  final SideMenuController sideMenu;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeSection(sideMenu: sideMenu),
          const StartTaskSection(),
          const ViewTaskSection(),
          const ReportSection(),
          const CustomizeUnitSection(),
          const EngineSection(),
          const SizedBox.shrink(),
        ],
      ),
    );
  }
}
