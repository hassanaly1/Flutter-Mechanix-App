import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class AddTaskScreen extends StatefulWidget {
  final SideMenuController sideMenu;
  const AddTaskScreen({super.key, required this.sideMenu});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
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
      },
      child: Container(
        color: Colors.transparent,
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
          SizedBox(
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
                        text: controller.engineBrand.value == ''
                            ? 'CAT 3600 SERVICE'
                            : controller.engineBrand.value,
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
          Obx(
            () => CustomTextWidget(
              text: 'Steps ${controller.activePageIndex.value + 1} of 4',
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              textColor: AppColors.blueTextColor,
              textAlign: TextAlign.center,
            ),
          ),
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
              // key: UniqueKey(),
              sizing: StackFit.loose,
              index: controller.activePageIndex.value,
              children: [
                CustomStepperBody1(),
                CustomStepperBody2(),
                CustomStepperBody3(),
                CustomStepperBody4(sideMenu: sideMenu),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration reusableDecoration() {
  return const BoxDecoration(
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
  );
}
