import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/task_controllers.dart';
import 'package:mechanix/helpers/appbar.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/models/payload.dart';
import 'package:mechanix/views/add_task/custom_stepperbody1.dart';
import 'package:mechanix/views/add_task/custom_stepperbody2.dart';
import 'package:mechanix/views/add_task/custom_stepperbody3.dart';
import 'package:mechanix/views/add_task/custom_stepperbody4.dart';

class UpdateTaskScreen extends StatefulWidget {
  final Payload model;
  const UpdateTaskScreen({super.key, required this.model});

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  late AddTaskController controller;
  @override
  void initState() {
    controller = Get.put(AddTaskController());
    controller.updateControllers(widget.model);
    controller.setActivePage(0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
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
                        flexibleSpace: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: ReUsableAppbar(title: 'Update Task')))
                  ];
                },
                body: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Obx(
                      () => Column(
                        children: [
                          CustomTextWidget(
                            text: widget.model.task?.name ?? '',
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center,
                            textColor: Colors.white,
                          ),
                          Expanded(
                            child: IndexedStack(
                              sizing: StackFit.loose,
                              index: controller.activePageIndex.value,
                              children: [
                                CustomStepperBody1(isTaskUpdating: false),
                                CustomStepperBody2(isTaskUpdating: false),
                                CustomStepperBody3(isTaskUpdating: false),
                                CustomStepperBody4(
                                  isTaskUpdating:
                                      controller.isTaskUpdating.value,
                                  model: widget.model,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
