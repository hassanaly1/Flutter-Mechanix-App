import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final SideMenuController sideMenu;
  const HomeScreen({
    super.key,
    required this.sideMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
        // decoration: reusableContainerDecoration(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DashboardCard(
                // onTap: () => pageController.jumpToPage(1),
                onTap: () => sideMenu.changePage(2),
                // onTap: () => Get.to(
                //   () => AddTaskScreen(),
                //   transition: Transition.size,
                // ),
                title: 'Start New Task',
                subtitle: 'Equipment Repair',
                image: 'assets/images/start-task.png',
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  SmallCard(
                    onTap: () => sideMenu.changePage(4),

                    // onTap: () => Get.to(
                    //   () => const ReportsScreen(),
                    //   transition: Transition.zoom,
                    // ),
                    title: 'Reports',
                    icon: Symbols.lab_profile,
                  ),
                  const SmallCard(
                    // onTap: () => sideMenu.changePage(5),
                    title: 'Customize Units',
                    icon: Symbols.dashboard_customize,
                  ),
                  SmallCard(
                    // onTap: () => Get.to(
                    //   () => EnginesScreen(),
                    //   transition: Transition.zoom,
                    // ),

                    onTap: () => sideMenu.changePage(6),

                    title: 'Engines',
                    icon: Symbols.manufacturing,
                  ),
                ],
              ),
              DashboardCard(
                // onTap: () => Get.to(
                //   () => ViewAllTasksScreen(),
                //   transition: Transition.size,
                // ),

                onTap: () => sideMenu.changePage(3),

                title: 'View Tasks',
                subtitle:
                    'Click here to view all submitted repair forms and their details.',
                image: 'assets/images/view-task.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  const SmallCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.isLandscape ? context.width * 0.02 : 0.0),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: ReUsableContainer(
              color: AppColors.blueTextColor,
              child: Padding(
                padding: EdgeInsets.all(context.isLandscape ? 8.0 : 4.0),
                child: Icon(icon,
                    color: Colors.white,
                    size: context.isLandscape ? 60.0 : 40.0),
              ),
            ),
          ),
          CustomTextWidget(text: title, fontSize: 12.0)
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final VoidCallback? onTap;
  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        onTap: onTap,
        child: ReUsableContainer(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: title,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      maxLines: 2,
                    ),
                    CustomTextWidget(
                      text: subtitle,
                      maxLines: 5,
                      fontSize: 10.0,
                    )
                  ],
                ),
              ),
              Image.asset(image, height: context.height * 0.18)
            ],
          ),
        ),
      ),
    );
  }
}
