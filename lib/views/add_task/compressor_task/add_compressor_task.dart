import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/compressor_task_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/views/add_task/compressor_task/cusom_compressor_body.dart';
import 'package:mechanix/views/add_task/generator_task/scan_qrcode.dart';

class CompressorTaskScreen extends StatefulWidget {
  final bool isUpdatingTask;
  final SideMenuController sideMenu;

  const CompressorTaskScreen(
      {super.key, required this.sideMenu, required this.isUpdatingTask});

  @override
  State<CompressorTaskScreen> createState() => _CompressorTaskScreenState();
}

class _CompressorTaskScreenState extends State<CompressorTaskScreen> {
  late CompressorTaskController controller;

  @override
  void initState() {
    controller = Get.put(CompressorTaskController());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CompressorTaskController controller = Get.find();
    return SafeArea(
        child: PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        widget.sideMenu.changePage(0);
        Get.delete<CompressorTaskController>();
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
                      children: [
                        TopSection(controller: controller),
                      ],
                    ),
                  ),
                ];
              },
              body: const BottomPageViewSection()),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            // onPressed: () => controller.scrollUp(),
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
  const TopSection({
    super.key,
    required this.controller,
  });

  final CompressorTaskController controller;

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
                    // Expanded(
                    //   child: CustomTextWidget(
                    //     text: controller.engineBrandName.value == ''
                    //         ? 'CAT 3600 SERVICE'
                    //         : controller.engineBrandName.value,
                    //     fontSize: 16.0,
                    //     maxLines: 2,
                    //     textAlign: TextAlign.center,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
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
        ],
      ),
    );
  }
}

class BottomPageViewSection extends StatelessWidget {
  const BottomPageViewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomCompressorBody1(isTaskUpdating: false),
        ),
      ],
    );
  }
}
