import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/helpers/tabbar.dart';
import 'package:mechanix/models/compressor_model.dart';
import 'package:mechanix/models/overhaul_report_model.dart';
import 'package:mechanix/models/payload.dart';
import 'package:mechanix/views/update_task/update_compressor_task.dart';
import 'package:mechanix/views/update_task/update_generator_task.dart';
import 'package:mechanix/views/update_task/update_overhaul_task.dart';

class ViewAllTasksScreen extends StatefulWidget {
  final SideMenuController sideMenu;

  const ViewAllTasksScreen({super.key, required this.sideMenu});

  @override
  State<ViewAllTasksScreen> createState() => _ViewAllTasksScreenState();
}

class _ViewAllTasksScreenState extends State<ViewAllTasksScreen> {
  final UniversalController controller = Get.find();
  RxInt currentPage = 0.obs;

  @override
  void initState() {
    debugPrint('CallingAllTasks');
    _callAllTasks();
    super.initState();
  }

  void _callAllTasks() {
    controller.getAllGeneratorTasks(page: 1);
    controller.getAllCompressorTasks(page: 1);
    controller.getAllOverhaulTasks(page: 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          widget.sideMenu.changePage(0);
          controller.currentPage.value = 1;
        },
        child: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: context.height * 0.02,
                  horizontal: context.width * 0.05),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: RefreshIndicator(
                onRefresh: () => controller.getAllGeneratorTasks(page: 1),
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
                        controller: controller.searchController,
                        hintText: 'Search Task',
                        suffixIcon: const Icon(Icons.search_sharp),
                        onChanged: (value) {
                          if (currentPage.value == 0) {
                            debugPrint('SearchingGeneratorTasks');
                            controller.getAllGeneratorTasks(searchName: value);
                          } else if (currentPage.value == 1) {
                            debugPrint('SearchingCompressorTasks');
                            controller.getAllCompressorTasks(searchName: value);
                          } else if (currentPage.value == 2) {
                            debugPrint('SearchingOverhaulTasks');
                            controller.getAllOverhaulTasks(searchName: value);
                          }
                        },
                      ),
                    ),
                    CustomTabBar(
                      onTap: (val) {
                        currentPage.value = val;
                      },
                      title1: 'Generator',
                      title2: 'Compressor',
                      title3: 'OverHaul Reports',
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Obx(
                                () =>
                            controller.isGeneratorTasksAreLoading.value
                                ? const SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Center(
                                  heightFactor: 3,
                                  child: SpinKitCircle(
                                    color: Colors.black87,
                                    size: 40.0,
                                  )),
                            )
                                : controller.generatorTasks.isEmpty
                                ? SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: context.height * 0.15),
                                  Image.asset(
                                      'assets/images/view-task.png',
                                      height: context.height * 0.15),
                                  CustomTextWidget(
                                    text: 'No Tasks found',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                      height: context.height * 0.4),
                                ],
                              ),
                            )
                                : ListView.builder(
                              controller: controller
                                  .scrollControllerForGenerator,
                              shrinkWrap: true,
                              physics:
                              const AlwaysScrollableScrollPhysics(),
                              itemCount:
                              controller.generatorTasks.length +
                                  (controller.isLoading.value
                                      ? 1
                                      : 0),
                              itemBuilder: (context, index) {
                                if (index <
                                    controller
                                        .generatorTasks.length) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() =>
                                          UpdateGeneratorTaskScreen(
                                              model: controller
                                                  .generatorTasks[
                                              index]));
                                    },
                                    child: CustomGeneratorTaskCard(
                                      model: controller
                                          .generatorTasks[index],
                                      controller: controller,
                                    ),
                                  );
                                } else if (controller
                                    .isLoading.value) {
                                  return const Center(
                                    heightFactor: 3,
                                    child: SpinKitCircle(
                                        color: Colors.black87,
                                        size: 40.0),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                          Obx(
                                () =>
                            controller.isCompressorTasksAreLoading.value
                                ? const SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Center(
                                  heightFactor: 3,
                                  child: SpinKitCircle(
                                    color: Colors.black87,
                                    size: 40.0,
                                  )),
                            )
                                : controller.compressorTasks.isEmpty
                                ? SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: context.height * 0.15),
                                  Image.asset(
                                      'assets/images/view-task.png',
                                      height: context.height * 0.15),
                                  CustomTextWidget(
                                    text: 'No Tasks found',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                      height: context.height * 0.4),
                                ],
                              ),
                            )
                                : ListView.builder(
                              controller: controller
                                  .scrollControllerForCompressor,
                              shrinkWrap: true,
                              physics:
                              const AlwaysScrollableScrollPhysics(),
                              itemCount:
                              controller.compressorTasks.length +
                                  (controller.isLoading.value
                                      ? 1
                                      : 0),
                              itemBuilder: (context, index) {
                                if (index <
                                    controller
                                        .compressorTasks.length) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() =>
                                          UpdateCompressorTaskScreen(
                                              model: controller
                                                  .compressorTasks[
                                              index]));
                                    },
                                    child: CustomCompressorTaskCard(
                                      model: controller
                                          .compressorTasks[index],
                                      controller: controller,
                                    ),
                                  );
                                } else if (controller
                                    .isLoading.value) {
                                  return const Center(
                                    heightFactor: 3,
                                    child: SpinKitCircle(
                                        color: Colors.black87,
                                        size: 40.0),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                          Obx(
                                () =>
                            controller.isOverhaulTasksAreLoading.value
                                ? const SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Center(
                                  heightFactor: 3,
                                  child: SpinKitCircle(
                                    color: Colors.black87,
                                    size: 40.0,
                                  )),
                            )
                                : controller.overhaulReportsTasks.isEmpty
                                ? SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: context.height * 0.15),
                                  Image.asset(
                                      'assets/images/view-task.png',
                                      height: context.height * 0.15),
                                  CustomTextWidget(
                                    text: 'No Tasks found',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                      height: context.height * 0.4),
                                ],
                              ),
                            )
                                : ListView.builder(
                              controller: controller
                                  .scrollControllerForOverhaul,
                              shrinkWrap: true,
                              physics:
                              const AlwaysScrollableScrollPhysics(),
                              itemCount: controller
                                  .overhaulReportsTasks.length +
                                  (controller.isLoading.value
                                      ? 1
                                      : 0),
                              itemBuilder: (context, index) {
                                if (index <
                                    controller.overhaulReportsTasks
                                        .length) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() =>
                                          UpdateOverhaulTaskScreen(
                                              index: index,
                                              model: controller
                                                  .overhaulReportsTasks[
                                              index]));
                                      // Get.to(() => AddReportScreen(
                                      //     sideMenu: widget.sideMenu,
                                      //     reportType: controller
                                      //         .overhaulReportsTasks[
                                      //             index]
                                      //         .type));
                                    },
                                    child: CustomOverHaulTaskCard(
                                      model: controller
                                          .overhaulReportsTasks[
                                      index],
                                      controller: controller,
                                    ),
                                  );
                                } else if (controller
                                    .isLoading.value) {
                                  return const Center(
                                    heightFactor: 3,
                                    child: SpinKitCircle(
                                        color: Colors.black87,
                                        size: 40.0),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomGeneratorTaskCard extends StatelessWidget {
  final Payload model;
  final UniversalController controller;

  const CustomGeneratorTaskCard({
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
                        ? 'Location not assigned'
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
                'Date: ${model.task?.date == null ? 'Not Assigned' : DateFormat(
                    'yyyy-MM-dd').format(
                    DateTime.parse(model.task?.date ?? ''))}',
                fontSize: 10.0),
            CustomTextWidget(
              text:
              'Time: ${model.task?.time == null ? 'Not Assigned' : '${model.task
                  ?.time}'}',
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
                    text: model.task?.name! == ''
                        ? 'Not Assigned'
                        : model.task?.name ?? '',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                CustomTextWidget(
                  text: 'Technician: ',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                ),
                CustomTextWidget(
                  text: model.task?.nameJourneyMan! == ''
                      ? 'Not Assigned'
                      : model.task?.nameJourneyMan ?? '',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
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

class CustomCompressorTaskCard extends StatelessWidget {
  final CompressorTaskModel model;
  final UniversalController controller;

  const CustomCompressorTaskCard({
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
                Column(
                  children: [
                    CustomTextWidget(
                      text: 'Model: ${model.model ?? 'Not Assigned'}',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                    CustomTextWidget(
                      text: 'Make: ${model.make ?? 'Not Assigned'}',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
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
                    text: model.taskName ?? 'Not Assigned',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            CustomTextWidget(
              text: 'Customer Email: ${model.customerEmail ?? 'Not Assigned'}',
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomOverHaulTaskCard extends StatelessWidget {
  final OverHaulReportModel model;
  final UniversalController controller;

  const CustomOverHaulTaskCard({
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text:
                      'Date: ${model.customerEngineInfo.date}',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                    CustomTextWidget(
                      text:
                      'Location: ${model.customerEngineInfo.location.text
                          .trim() == "" ? 'Not Assigned' : model
                          .customerEngineInfo.location.text.trim()}',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
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
                    text: model.customerEngineInfo.customer.text.trim() == ""
                        ? 'Not Assigned'
                        : model.customerEngineInfo.customer.text.trim(),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            CustomTextWidget(
              text: 'Report Type: ${model.type}',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
            CustomTextWidget(
              text:
              'Customer Email: ${model.customerEngineInfo.customerContact.text
                  .trim() == "" ? 'Not Assigned' : model.customerEngineInfo
                  .customerContact.text.trim()}',
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
            CustomTextWidget(
              text:
              'Mechanic 1: ${model.customerEngineInfo.mechanic1.text.trim() ==
                  "" ? 'Not Assigned' : model.customerEngineInfo.mechanic1.text
                  .trim()}',
              fontSize: 10.0,
              fontWeight: FontWeight.w400,
            ),
            CustomTextWidget(
              text:
              'Mechanic 2: ${model.customerEngineInfo.mechanic2.text.trim() ==
                  "" ? 'Not Assigned' : model.customerEngineInfo.mechanic2.text
                  .trim()}',
              fontSize: 10.0,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}

void _showDeletePopup({required BuildContext context,
  required UniversalController controller,
  required dynamic model}) {
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
                              () =>
                              InkWell(
                                  onTap: () {
                                    if (model.runtimeType == Payload) {
                                      debugPrint('GeneratorTaskDeleteCalled');
                                      controller.deleteGeneratorTask(
                                          taskId: model.task?.taskId);
                                    } else if (model.runtimeType ==
                                        CompressorTaskModel) {
                                      debugPrint('CompressorTaskDeleteCalled');
                                      controller.deleteCompressorTask(
                                          taskId: model.taskId ?? '');
                                    } else if (model.runtimeType ==
                                        OverHaulReportModel) {
                                      debugPrint('OverHaulTaskDeleteCalled');
                                      controller.deleteOverhaulTask(
                                          taskId: model.engineAssemblyReportCont
                                              .id
                                              .value ??
                                              '');
                                    } else {
                                      return;
                                    }
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
