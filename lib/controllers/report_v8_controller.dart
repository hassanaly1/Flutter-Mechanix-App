import 'dart:io';

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/storage_helper.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/models/overhaul_report_model.dart';
import 'package:mechanix/services/overhaul_report_service.dart';
import 'package:mechanix/views/add_task/generator_task/custom_stepperbody4.dart';

class OverhaulReportController extends GetxController {
  final int? updatingReportIndex;

  OverhaulReportController(this.updatingReportIndex);

  RxBool isLoading = false.obs;
  File? pdfFile;

  final UniversalController universalController = Get.find();
  late OverHaulReportModel overHaulReport;
  OverhaulReportServices overhaulReportServices = OverhaulReportServices();
  final ScrollController scrollController = ScrollController();

  @override
  onInit() async {
    if (updatingReportIndex != null) {
      overHaulReport =
          universalController.overhaulReportsTasks[updatingReportIndex!];
    } else {
      overHaulReport = OverHaulReportModel(
          type: universalController.numberOfControllers.value == 8
              ? 'V8'
              : universalController.numberOfControllers.value == 12
                  ? 'V12'
                  : universalController.numberOfControllers.value == 16
                      ? 'V16'
                      : universalController.numberOfControllers.value == 18
                          ? 'L7042GL C-14871'
                          : 'V8');
    }
    super.onInit();
  }

  Future<void> addOverhaulReportTask(
      BuildContext context, SideMenuController? sideMenuController) async {
    try {
      isLoading.value = true;
      OverhaulReportTaskResponse taskResponse =
          await overhaulReportServices.createOverhaulReport(
        data: overHaulReport.finalToJson(),
        token: storage.read('token'),
      );
      debugPrint('Type: ${overHaulReport.type}');
      if (taskResponse.success) {
        ToastMessage.showToastMessage(
            message: 'Task Created Successfully',
            backgroundColor: AppColors.blueTextColor);
        showConfirmationPopup(
          context: context,
          taskId: taskResponse.taskId ?? '',
          token: storage.read('token'),
          taskName: overHaulReport.type,
          customerEmail: overHaulReport.customerEngineInfo.customer.text.trim(),
        );
        // await controller.getAllCompressorTasks();
        sideMenuController?.changePage(0);
        universalController.numberOfControllers.value = 0;
        Get.delete<OverhaulReportController>();
      } else {
        ToastMessage.showToastMessage(
            message: 'Failed to create task, please try again',
            backgroundColor: Colors.red);
      }
    } catch (error) {
      debugPrint('Error adding Overhawl task: $error');
      ToastMessage.showToastMessage(
          message: 'Something went wrong, try again',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateOverhaulReportTask() async {
    try {
      isLoading.value = true;
      OverhaulReportTaskResponse taskResponse =
          await overhaulReportServices.updateOverhaulReport(
        data: overHaulReport.finalToJson(),
        token: storage.read('token'),
        taskId: '${overHaulReport.engineAssemblyReportCont.id}',
      );
      debugPrint('Type: ${overHaulReport.type}');
      if (taskResponse.success) {
        ToastMessage.showToastMessage(
            message: 'Task Updated Successfully',
            backgroundColor: AppColors.blueTextColor);
        // await controller.getAllCompressorTasks();
        Get.back();
        universalController.numberOfControllers.value = 0;
      } else {
        ToastMessage.showToastMessage(
            message: 'Failed to update overhaul task, please try again',
            backgroundColor: Colors.red);
      }
    } catch (error) {
      debugPrint('Error updating overhaul task: $error');
      ToastMessage.showToastMessage(
          message: 'Something went wrong, try again',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  void scrollUp() {
    if (scrollController.hasClients) {
      scrollController.animateTo(0.0,
          duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      helpText: 'Select the Date',
      confirmText: 'Select Date',
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      overHaulReport.customerEngineInfo.date.value = formattedDate;
      print(overHaulReport.customerEngineInfo.date.value);
      print(formattedDate); // Output: 2024-05-06
    }
  }

// String finalToJson() {
//   return jsonEncode({
//     'customer_engine_info': customerEngineInfo.toJson(),
//     'engine_assembly': engineAssembly.toJson(),
//     'engine_assembly_report_cont': engineAssemblyReportCont.toJson(),
//     'engine_assembly_parts_exchange_catalog':
//         engineAssemblyPartsExchangeCatalog.toJson(),
//     "type": "V8",
//     "gear_train": gearTrain.toJson()
//   });
// }
}
