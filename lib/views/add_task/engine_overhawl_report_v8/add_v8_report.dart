import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/report_v8_controller.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/views/add_task/engine_overhawl_report_v8/cusom_v8_body.dart';

class AddV8ReportScreen extends StatefulWidget {
  final bool isUpdatingTask;
  final String reportType;
  final SideMenuController sideMenu;

  const AddV8ReportScreen(
      {super.key,
      required this.sideMenu,
      required this.isUpdatingTask,
      required this.reportType});

  @override
  State<AddV8ReportScreen> createState() => _CompressorTaskScreenState();
}

class _CompressorTaskScreenState extends State<AddV8ReportScreen> {
  late ReportV8Controller controller;
  late UniversalController universalController;

  @override
  void initState() {
    universalController = Get.find();
    widget.reportType == 'V8'
        ? universalController.numberOfControllers.value = 8
        : widget.reportType == 'V12'
            ? universalController.numberOfControllers.value = 12
            : widget.reportType == 'V16'
                ? universalController.numberOfControllers.value = 16
                : null;
    debugPrint('ControllersValue: ${universalController.numberOfControllers}');

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.put(ReportV8Controller());
    return SafeArea(
        child: PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        widget.sideMenu.changePage(0);
        Get.delete<ReportV8Controller>();
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: NestedScrollView(
              // controller: controller.scrollController,
              // floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: context.height * 0.15,
                    pinned: false,
                    floating: true,
                    primary: false,
                    backgroundColor: Colors.transparent,
                    excludeHeaderSemantics: false,
                    forceMaterialTransparency: false,
                    flexibleSpace: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        TopSection(),
                      ],
                    ),
                  ),
                ];
              },
              body: BottomPageViewSection(sideMenuController: widget.sideMenu)),
          floatingActionButton: FloatingActionButton(
            // onPressed: () => controller.scrollUp(),
            onPressed: () {},
            backgroundColor: AppColors.primaryColor,
            mini: true,
            shape: const CircleBorder(),
            child: const Icon(Icons.arrow_upward_rounded),
          ),
        ),
      ),
    ));
  }
}

class TopSection extends StatelessWidget {
  const TopSection({super.key});

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
              child: ReUsableContainer(
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
                        text: 'Engine OverHaul V8 Report',
                        fontSize: 16.0,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                      ),
                    ), // Expanded(
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomPageViewSection extends StatelessWidget {
  final SideMenuController sideMenuController;

  const BottomPageViewSection({
    super.key,
    required this.sideMenuController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomV8Body1(
            isTaskUpdating: false,
            sideMenuController: sideMenuController,
          ),
        ),
      ],
    );
  }
}
