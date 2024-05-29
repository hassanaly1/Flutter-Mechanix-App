import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/report_v8_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/models/overhaul_report_model.dart';
import 'package:mechanix/views/add_task/engine_overhawl_report/custom_v8_body.dart';

class UpdateOverhaulTaskScreen extends StatefulWidget {
  final OverHaulReportModel model;
  final int index;

  const UpdateOverhaulTaskScreen(
      {super.key, required this.model, required this.index});

  @override
  State<UpdateOverhaulTaskScreen> createState() =>
      _UpdateOverhaulTaskScreenState();
}

class _UpdateOverhaulTaskScreenState extends State<UpdateOverhaulTaskScreen> {
  late OverhaulReportController controller;

  @override
  void initState() {
    controller = Get.put(OverhaulReportController(widget.index));
    super.initState();
  }

  @override
  void dispose() {
    debugPrint('UpdateTaskDisposeCalled');
    Get.delete<OverhaulReportController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/home-bg.png', fit: BoxFit.cover),
          GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: NestedScrollView(
                controller: controller.scrollController,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                        floating: true,
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        forceMaterialTransparency: true,
                        expandedHeight: context.height * 0.15,
                        flexibleSpace: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () => Get.back(),
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      )),
                                  Flexible(
                                    child: CustomTextWidget(
                                      text: widget.model.type,
                                      maxLines: 2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.0,
                                      textColor: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.picture_as_pdf_sharp,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            )))
                  ];
                },
                body: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: const Column(
                      children: [
                        Expanded(child: CustomV8Body1(isTaskUpdating: true)),
                      ],
                    )),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => controller.scrollUp(),
                backgroundColor: AppColors.primaryColor,
                mini: true,
                shape: const CircleBorder(),
                child: const Icon(Icons.arrow_upward_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
