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
import 'package:mechanix/models/report_model.dart';

class ReportsScreen extends StatelessWidget {
  final SideMenuController sideMenu;

  ReportsScreen({super.key, required this.sideMenu});

  final UniversalController controller = Get.find();
  Rx<DateTime> selectedDate = DateTime.now().obs;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          sideMenu.changePage(0);
        },
        child: RefreshIndicator(
          onRefresh: () => controller.getAllReports(),
          color: AppColors.primaryColor,
          backgroundColor: AppColors.secondaryColor,
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: context.height * 0.02,
                  horizontal: context.width * 0.05),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            context.isLandscape ? context.width * 0.08 : 0.0),
                    child: ReUsableTextField(
                      hintText: 'Search Reports',
                      controller: controller.searchController,
                      suffixIcon: const Icon(Icons.search_sharp),
                      onChanged: (value) {
                        controller.getAllReports(searchName: value);
                      },
                    ),
                  ),
                  ReUsableContainer(
                    child: ListTile(
                      visualDensity: VisualDensity.compact,
                      onTap: () {
                        _selectDate(context);
                      },
                      leading: Icon(Icons.calendar_month,
                          color: AppColors.blueTextColor),
                      title: Obx(
                        () => CustomTextWidget(
                          // text: DateFormat('yyyy-MM-dd').format(now),
                          text: DateFormat('yyyy-MM-dd')
                              .format(selectedDate.value),
                        ),
                      ),
                      trailing: CustomTextWidget(
                        text: 'Change',
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Obx(
                    () => controller.isReportsAreLoading.value
                        ? const SingleChildScrollView(
                            child: Center(
                                heightFactor: 3,
                                child: SpinKitCircle(
                                  color: Colors.black87,
                                  size: 40.0,
                                )),
                          )
                        : controller.reports.isEmpty
                            ? Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(height: context.height * 0.15),
                                      Image.asset('assets/images/view-task.png',
                                          height: context.height * 0.15),
                                      CustomTextWidget(
                                        text: 'No Reports found',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(height: context.height * 0.35),
                                    ],
                                  ),
                                ),
                              )
                            : Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: controller.reports.length,
                                  itemBuilder: (context, index) =>
                                      CustomReportCard(
                                          controller: controller,
                                          reportModel:
                                              controller.reports[index]),
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      String formattedStartDate =
          DateFormat('yyyy-MM-dd').format(selectedDate.value);
      print('SelectedDate: $formattedStartDate');
      await controller.getAllReports(date: formattedStartDate);
    }
  }
}

class CustomReportCard extends StatelessWidget {
  final ReportModel reportModel;
  final UniversalController controller;

  const CustomReportCard({
    super.key,
    required this.reportModel,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: 'Report Id: ${reportModel.reportId ?? 'Not Specified'}',
                  fontSize: 12.0,
                ),
                InkWell(
                  onTap: () {
                    _showDeletePopup(
                        context: context,
                        controller: controller,
                        model: reportModel);
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            CustomTextWidget(
              text: 'Report Name: ${reportModel.name ?? 'Not Specified'}',
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
            CustomTextWidget(
              text:
                  'Customer Email: ${controller.generatorTasks.firstWhereOrNull((payload) => reportModel.user == payload.task?.userId)?.task?.customerEmail ?? 'Not Specified'}',
              fontSize: 10.0,
              fontWeight: FontWeight.w300,
            ),
            const SizedBox(height: 6.0),
            CustomTextWidget(
              text:
                  'Report Date: ${DateFormat('yyyy-MM-dd').format(reportModel.reportDate ?? DateTime.now())}',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
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
    required ReportModel model}) {
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
                                'Are you sure to delete the Report? This action cannot be undone.',
                            fontSize: 14.0,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w400),
                        const SizedBox(height: 12.0),
                        Obx(
                          () => InkWell(
                              onTap: () {
                                controller.deleteReport(reportId: model.id);
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
