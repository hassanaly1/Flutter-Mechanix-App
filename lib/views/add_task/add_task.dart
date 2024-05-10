import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/googlemap_controller.dart';
import 'package:mechanix/controllers/task_controllers.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/views/add_task/custom_stepperbody1.dart';
import 'package:mechanix/views/add_task/custom_stepperbody2.dart';
import 'package:mechanix/views/add_task/custom_stepperbody3.dart';
import 'package:mechanix/views/add_task/custom_stepperbody4.dart';
import 'package:mechanix/views/add_task/scan_qrcode.dart';
import 'package:mechanix/views/add_task/stepper_header.dart';

class TaskScreen extends StatefulWidget {
  final bool isUpdatingTask;
  final SideMenuController sideMenu;
  const TaskScreen(
      {super.key, required this.sideMenu, required this.isUpdatingTask});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late AddTaskController controller;
  @override
  void initState() {
    controller = Get.put(AddTaskController());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AddTaskController controller = Get.find();
    return SafeArea(
        child: PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        widget.sideMenu.changePage(0);
        Get.delete<AddTaskController>();
        Get.delete<MapController>();
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
        ),
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: NestedScrollView(
                controller: controller.scrollController,
                // floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      expandedHeight: context.height * 0.28,
                      pinned: false,
                      floating: true,
                      primary: false,
                      backgroundColor: Colors.transparent,
                      excludeHeaderSemantics: false,
                      forceMaterialTransparency: false,
                      flexibleSpace: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          // AddTaskAppbar(controller: controller),
                          TopSection(controller: controller),
                        ],
                      ),
                    ),
                  ];
                },
                body: BottomPageViewSection(
                    controller: controller, sideMenu: widget.sideMenu)),
            floatingActionButton: FloatingActionButton(
              onPressed: () => controller.scrollUp(),
              backgroundColor: AppColors.primaryColor,
              mini: true,
              shape: const CircleBorder(),
              child: const Icon(Icons.arrow_upward_rounded),
            ),
          ),
        ),
      ),
    ));
  }
}

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
    required this.controller,
  });

  final AddTaskController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: context.width,
              child: Obx(
                () => ReUsableContainer(
                  color: AppColors.primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const IconButton(
                          onPressed: null,
                          icon: Icon(Icons.qr_code_scanner_rounded,
                              color: Colors.transparent)),
                      Expanded(
                        child: CustomTextWidget(
                          text: controller.engineBrandId.value == ''
                              ? 'CAT 3600 SERVICE'
                              : controller.engineBrandId.value,
                          fontSize: 16.0,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(() => const ScanQrCodeScreen(),
                                transition: Transition.rightToLeft);
                          },
                          icon: const Icon(Icons.qr_code_scanner_rounded))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => CustomTextWidget(
              text: 'Steps ${controller.activePageIndex.value + 1} of 4',
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              textColor: AppColors.blueTextColor,
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
              indent: context.width * 0.3,
              endIndent: context.width * 0.3,
              color: Colors.black26),
          StepperHeader(controller: controller),
        ],
      ),
    );
  }
}

class BottomPageViewSection extends StatelessWidget {
  final SideMenuController sideMenu;
  const BottomPageViewSection({
    super.key,
    required this.controller,
    required this.sideMenu,
  });

  final AddTaskController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: IndexedStack(
              sizing: StackFit.loose,
              index: controller.activePageIndex.value,
              children: [
                CustomStepperBody1(isTaskUpdating: false),
                CustomStepperBody2(isTaskUpdating: false),
                CustomStepperBody3(isTaskUpdating: false),
                CustomStepperBody4(isTaskUpdating: false, sideMenu: sideMenu),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
