import 'package:easy_sidemenu/easy_sidemenu.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mechanix/controllers/task_controllers.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/models/payload.dart';
import 'package:mechanix/views/add_task/add_task.dart';
import 'package:mechanix/views/update_task.dart';

class ViewAllTasksScreen extends StatelessWidget {
  final SideMenuController sideMenu;
  ViewAllTasksScreen({super.key, required this.sideMenu});

  final UniversalController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          sideMenu.changePage(0);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: context.height * 0.02,
                horizontal: context.width * 0.05),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: RefreshIndicator(
              onRefresh: controller.getAllTasks,
              color: AppColors.primaryColor,
              backgroundColor: AppColors.secondaryColor,
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            context.isLandscape ? context.width * 0.08 : 0.0),
                    child: ReUsableTextField(
                      hintText: 'Search Task',
                      suffixIcon: const Icon(Icons.search_sharp),
                    ),
                  ),
                  ReUsableContainer(
                    child: ListTile(
                      visualDensity: VisualDensity.compact,
                      onTap: () {},
                      leading: Icon(Icons.calendar_month,
                          color: AppColors.blueTextColor),
                      title: CustomTextWidget(
                        text: DateFormat('yyyy-MM-dd').format(now),
                      ),
                      trailing: CustomTextWidget(
                        text: 'Change',
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Obx(
                    () => controller.isTasksAreLoading.value
                        ? const SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: Center(
                                heightFactor: 3,
                                child: SpinKitCircle(
                                  color: Colors.black87,
                                  size: 40.0,
                                )),
                          )
                        : controller.tasks.isEmpty
                            ? Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: context.height * 0.15),
                                      Image.asset('assets/images/view-task.png',
                                          height: context.height * 0.15),
                                      CustomTextWidget(
                                        text: 'No Tasks found',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(height: context.height * 0.25),
                                    ],
                                  ),
                                ),
                              )
                            : Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: controller.tasks.length,
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      Get.to(() => UpdateTaskScreen(
                                          model: controller.tasks[index]));
                                    },
                                    child: CustomTaskCard(
                                      model: controller.tasks[index],
                                      controller: controller,
                                    ),
                                  ),
                                ),
                              ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTaskCard extends StatelessWidget {
  final Payload model;
  final UniversalController controller;
  const CustomTaskCard({
    super.key,
    required this.model,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      color: Colors.white30,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: CustomTextWidget(
                    textAlign: TextAlign.center,
                    text: model.geolocation?.address! == ""
                        ? 'Not Assigned'
                        : model.geolocation?.address ?? '',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _showDeletePopup(
                        context: context, controller: controller, model: model);
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            const SizedBox(height: 4.0),
            CustomTextWidget(
                text:
                    'Date: ${model.task?.date == null ? 'Not Assigned' : DateFormat('yyyy-MM-dd').format(DateTime.parse(model.task?.date ?? ''))}',
                fontSize: 10.0),
            CustomTextWidget(
              text:
                  'Time: ${model.task?.time == null ? 'Not Assigned' : '${model.task?.time}'}',
              fontSize: 10.0,
            ),
            const Divider(),
            Row(
              children: [
                Image.asset(
                  'assets/images/construction-worker.png',
                  height: 30.0,
                  color: AppColors.blueTextColor,
                ),
                const SizedBox(width: 4.0),
                Flexible(
                  child: CustomTextWidget(
                    text: model.task?.nameJourneyMan! == ''
                        ? 'Not Assigned'
                        : model.task?.nameJourneyMan ?? '',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            CustomTextWidget(
              text: 'Job Scope:',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
            CustomTextWidget(
              text: model.task?.jobScope! == ''
                  ? 'Not Assigned'
                  : model.task?.jobScope ?? '',
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}

void _showDeletePopup(
    {required BuildContext context,
    required UniversalController controller,
    required Payload model}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => Container(),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
              child: AlertDialog(
                  scrollable: true,
                  backgroundColor: Colors.transparent,
                  content: Container(
                    width: context.width * 0.7,
                    // height: context.height * 0.3,
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: context.height * 0.02),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(255, 220, 105, 0.4),
                          Color.fromRGBO(86, 127, 255, 0.4),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            spreadRadius: 5.0),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0)
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                            text:
                                'Are you sure to delete the Task? This action cannot be undone.',
                            fontSize: 14.0,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w400),
                        const SizedBox(height: 12.0),
                        Obx(
                          () => InkWell(
                              onTap: () {
                                controller.deleteTask(
                                    taskId: model.task?.taskId);
                              },
                              child: ReUsableContainer(
                                verticalPadding: context.height * 0.01,
                                height: 50,
                                color: Colors.red,
                                child: Center(
                                    child: controller.isLoading.value
                                        ? const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: SpinKitRing(
                                              lineWidth: 2.0,
                                              color: Colors.white,
                                            ),
                                          )
                                        : CustomTextWidget(
                                            text: 'Delete',
                                            fontSize: 12,
                                            textColor: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            textAlign: TextAlign.center,
                                          )),
                              )),
                        ),
                        CustomButton(
                          isLoading: false,
                          usePrimaryColor: false,
                          buttonText: 'Cancel',
                          fontSize: 12.0,
                          onTap: () {
                            Get.back();
                          },
                        )
                      ],
                    ),
                  ))));
    },
  );
}
