import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/googlemap_controller.dart';
import 'package:mechanix/controllers/report_v8_controller.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/views/add_task/engine_overhawl_report/custom_v8_body.dart';

class AddReportScreen extends StatefulWidget {
  final String reportType;
  final SideMenuController sideMenu;
  final int? updatingReportIndex;

  const AddReportScreen(
      {super.key,
      required this.sideMenu,
      required this.reportType,
      this.updatingReportIndex});

  @override
  State<AddReportScreen> createState() => _CompressorTaskScreenState();
}

class _CompressorTaskScreenState extends State<AddReportScreen> {
  late OverhaulReportController controller;
  late UniversalController universalController;
  late MapController mapController;

  @override
  void initState() {
    universalController = Get.find();
    widget.reportType == 'V8'
        ? universalController.numberOfControllers.value = 8
        : widget.reportType == 'V12'
            ? universalController.numberOfControllers.value = 12
            : widget.reportType == 'V16'
                ? universalController.numberOfControllers.value = 16
                : universalController.numberOfControllers.value = 12;
    debugPrint('ControllersValue: ${universalController.numberOfControllers}');
    controller = Get.put(OverhaulReportController(widget.updatingReportIndex));
    mapController = Get.put(MapController());
    super.initState();
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        widget.sideMenu.changePage(0);
        universalController.numberOfControllers.value = 0;
        Get.delete<OverhaulReportController>();
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
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: NestedScrollView(
              controller: controller.scrollController,
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
                      children: [
                        TopSection(reportType: widget.reportType),
                      ],
                    ),
                  ),
                ];
              },
              body: BottomPageViewSection(sideMenuController: widget.sideMenu)),
          floatingActionButton: FloatingActionButton(
            onPressed: () => controller.scrollUp(),
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
  final String reportType;

  const TopSection({super.key, required this.reportType});

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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomTextWidget(
                    text: 'Engine OverHaul $reportType Report',
                    fontSize: 16.0,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                  ),
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
