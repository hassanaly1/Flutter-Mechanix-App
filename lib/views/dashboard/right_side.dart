import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:mechanix/views/add_task/add_task.dart';
import 'package:mechanix/views/dashboard/home.dart';
import 'package:mechanix/views/dashboard/profile_section.dart';
import 'package:mechanix/views/view_task.dart';

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
          const SizedBox.shrink(),
          AddTaskScreen(),
          ViewAllTasksScreen(),
          const ProfileSection(),
          const SizedBox.shrink(),
        ],
      ),
    );
  }
}
