import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mechanix/controllers/compressor_task_controller.dart';
import 'package:mechanix/controllers/generator_task_controllers.dart';
import 'package:mechanix/controllers/googlemap_controller.dart';
import 'package:mechanix/controllers/report_v8_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/reusable_container.dart';

class SideMenuCard extends StatelessWidget {
  const SideMenuCard({
    super.key,
    required this.sideMenu,
  });

  final SideMenuController sideMenu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ReUsableContainer(
        child: SideMenu(
          controller: sideMenu,
          style: SideMenuStyle(
            compactSideMenuWidth: 200,
            displayMode: SideMenuDisplayMode.open,
            showHamburger: false,
            itemInnerSpacing: 8.0,
            hoverColor: AppColors.primaryColor,
            selectedColor: AppColors.blueTextColor,
            toggleColor: Colors.red,
            selectedIconColor: Colors.white,
            selectedTitleTextStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            unselectedTitleTextStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          title: Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 120,
                  maxWidth: 120,
                ),
                child: Image.asset(
                  'assets/images/app-logo.png',
                ),
              ),
              const Divider(
                indent: 8.0,
                endIndent: 8.0,
              ),
            ],
          ),
          items: [
            //0
            SideMenuItem(
                title: 'Home',
                onTap: (index, _) async {
                  debugPrint('HomeScreenCalled');
                  sideMenu.changePage(index);
                  if (Get.isRegistered<AddTaskController>()) {
                    await Get.delete<AddTaskController>();
                  }
                  if (Get.isRegistered<MapController>()) {
                    await Get.delete<MapController>();
                  }
                  if (Get.isRegistered<CompressorTaskController>()) {
                    await Get.delete<CompressorTaskController>();
                  }
                  if (Get.isRegistered<OverhaulReportController>()) {
                    await Get.delete<OverhaulReportController>();
                  }
                },
                icon: const Icon(CupertinoIcons.home)),
            SideMenuExpansionItem(
              title: "Tasks",
              icon: const Icon(Icons.task),
              children: [
                SideMenuItem(
                  //1 GeneratorTask
                  title: 'Generator Task',
                  onTap: (index, _) async {
                    sideMenu.changePage(index);
                    debugPrint('GeneratorTaskScreenCalled');
                    if (Get.isRegistered<CompressorTaskController>()) {
                      await Get.delete<CompressorTaskController>();
                    }
                    if (Get.isRegistered<OverhaulReportController>()) {
                      await Get.delete<OverhaulReportController>();
                    }
                  },
                  icon: const Icon(FontAwesomeIcons.plus),
                  tooltipContent: "Start Task",
                ),
                SideMenuItem(
                  //2 CompressorTask
                  title: 'Compressor Task',
                  onTap: (index, _) async {
                    sideMenu.changePage(index);
                    debugPrint('CompressorTaskScreenCalled');
                    if (Get.isRegistered<AddTaskController>()) {
                      await Get.delete<AddTaskController>();
                    }
                    if (Get.isRegistered<MapController>()) {
                      await Get.delete<MapController>();
                    }
                    if (Get.isRegistered<OverhaulReportController>()) {
                      await Get.delete<OverhaulReportController>();
                    }
                  },
                  icon: const Icon(FontAwesomeIcons.plus),
                  tooltipContent: "Start Task",
                ),
                SideMenuItem(
                  //2 CompressorTask
                  title: 'OverHaul Report V8',
                  onTap: (index, _) async {
                    sideMenu.changePage(index);
                    debugPrint('OverHaulReportV8Called');
                    if (Get.isRegistered<AddTaskController>()) {
                      await Get.delete<AddTaskController>();
                    }
                    if (Get.isRegistered<MapController>()) {
                      await Get.delete<MapController>();
                    }
                    if (Get.isRegistered<CompressorTaskController>()) {
                      await Get.delete<CompressorTaskController>();
                    }
                    if (Get.isRegistered<OverhaulReportController>()) {
                      await Get.delete<OverhaulReportController>();
                    }
                  },
                  icon: const Icon(FontAwesomeIcons.plus),
                  tooltipContent: "OverHaul Report V8",
                ),
                SideMenuItem(
                  //2 CompressorTask
                  title: 'OverHaul Report V12',
                  onTap: (index, _) async {
                    sideMenu.changePage(index);
                    debugPrint('OverHaulReportV12Called');
                    if (Get.isRegistered<AddTaskController>()) {
                      await Get.delete<AddTaskController>();
                    }
                    if (Get.isRegistered<MapController>()) {
                      await Get.delete<MapController>();
                    }
                    if (Get.isRegistered<CompressorTaskController>()) {
                      await Get.delete<CompressorTaskController>();
                    }
                    if (Get.isRegistered<OverhaulReportController>()) {
                      await Get.delete<OverhaulReportController>();
                    }
                  },
                  icon: const Icon(FontAwesomeIcons.plus),
                  tooltipContent: "OverHaul Report V12",
                ),
                SideMenuItem(
                  //2 CompressorTask
                  title: 'OverHaul Report V16',
                  onTap: (index, _) async {
                    sideMenu.changePage(index);
                    debugPrint('OverHaulReportV16Called');
                    if (Get.isRegistered<AddTaskController>()) {
                      await Get.delete<AddTaskController>();
                    }
                    if (Get.isRegistered<MapController>()) {
                      await Get.delete<MapController>();
                    }
                    if (Get.isRegistered<CompressorTaskController>()) {
                      await Get.delete<CompressorTaskController>();
                    }
                    if (Get.isRegistered<OverhaulReportController>()) {
                      await Get.delete<OverhaulReportController>();
                    }
                  },
                  icon: const Icon(FontAwesomeIcons.plus),
                  tooltipContent: "OverHaul Report V16",
                ),
                SideMenuItem(
                  //2 CompressorTask
                  title: 'OverHaul Assembly Report',
                  onTap: (index, _) async {
                    sideMenu.changePage(index);
                    debugPrint('OverHaulReportAssemblyCalled');
                    if (Get.isRegistered<AddTaskController>()) {
                      await Get.delete<AddTaskController>();
                    }
                    if (Get.isRegistered<MapController>()) {
                      await Get.delete<MapController>();
                    }
                    if (Get.isRegistered<CompressorTaskController>()) {
                      await Get.delete<CompressorTaskController>();
                    }
                    if (Get.isRegistered<OverhaulReportController>()) {
                      await Get.delete<OverhaulReportController>();
                    }
                  },
                  icon: const Icon(FontAwesomeIcons.plus),
                  tooltipContent: "OverHaul Assembly Report",
                ),
              ],
            ),
            SideMenuItem(
              //3
              title: 'View Tasks',
              onTap: (index, _) {
                sideMenu.changePage(index);
                debugPrint('ViewTaskScreenCalled');
              },
              icon: const Icon(FontAwesomeIcons.listCheck),
              tooltipContent: "View Task",
            ),
            // SideMenuItem(
            //   //4
            //   title: 'Reports',
            //   onTap: (index, _) {
            //     sideMenu.changePage(index);
            //   },
            //   icon: const Icon(Symbols.lab_profile),
            //   trailing: Padding(
            //     padding: const EdgeInsets.all(2.0),
            //     child: Container(
            //         decoration: const BoxDecoration(
            //             color: Colors.amber,
            //             borderRadius: BorderRadius.all(Radius.circular(6))),
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 6.0, vertical: 3),
            //           child: Text(
            //             'New',
            //             style: TextStyle(fontSize: 11, color: Colors.grey[800]),
            //           ),
            //         )),
            //   ),
            // ),
            // SideMenuItem(
            //   //5
            //   title: 'Customize Units',
            //   onTap: (index, _) {
            //     sideMenu.changePage(index);
            //   },
            //   icon: const Icon(Symbols.dashboard_customize),
            // ),
            SideMenuItem(
              //6
              title: 'Engines',
              onTap: (index, _) {
                sideMenu.changePage(index);
                debugPrint('EnginesScreenCalled');
              },
              icon: const Icon(Symbols.manufacturing),
            ),
            SideMenuItem(
              //7
              builder: (context, displayMode) {
                return const Divider(endIndent: 8, indent: 8);
              },
            ),
            // SideMenuItem(
            //   title: 'Subscription',
            //   onTap: (index, _) {
            //     sideMenu.changePage(index);
            //   },
            //   icon: const Icon(Symbols.event_repeat_rounded),
            // ),
            SideMenuItem(
              //8
              title: 'Profile',
              onTap: (index, _) {
                sideMenu.changePage(index);
                debugPrint('ProfileScreenCalled');
              },
              icon: const Icon(Symbols.manufacturing),
            ),
          ],
        ),
      ),
    );
  }
}
