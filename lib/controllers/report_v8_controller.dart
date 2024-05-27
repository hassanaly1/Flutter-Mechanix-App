import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/storage_helper.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/models/overhaul_report_model.dart';
import 'package:mechanix/services/overhaul_report_service.dart';

class ReportV8Controller extends GetxController {
  RxBool isLoading = false.obs;

  final UniversalController universalController = Get.find();
  late OverHaulReport overHaulReport;

  // final customerEngineInfo = CustomerEngineInfo();
  // late EngineAssembly engineAssembly;
  // late EngineAssemblyReportCont engineAssemblyReportCont;
  // final engineAssemblyPartsExchangeCatalog =
  //     EngineAssemblyPartsExchangeCatalog();
  // final gearTrain = GearTrain();

  OverhaulReportServices overhaulReportServices = OverhaulReportServices();

  @override
  onInit() async {
    overHaulReport = OverHaulReport(
        type: universalController.numberOfControllers.value == 8
            ? 'V8'
            : universalController.numberOfControllers.value == 12
                ? 'V12'
                : universalController.numberOfControllers.value == 16
                    ? 'V16'
                    : 'L7042GL C-14871');
    // debugPrint(
    //     'NumberOfControllersAtInit: ${universalController.numberOfControllers.value}');
    // engineAssembly =
    //     EngineAssembly(count: universalController.numberOfControllers.value);
    // engineAssemblyReportCont = EngineAssemblyReportCont(
    //     count: universalController.numberOfControllers.value);

    // engineAssembly.fromJson(json);
    // print(engineAssembly.toJson());
    super.onInit();
  }

  Future<void> addOverhaulReportTask(
      SideMenuController? sideMenuController) async {
    try {
      isLoading.value = true;

      // final OverHaulReport overHaulReport = OverHaulReport(
      //   customerEngineInfo: customerEngineInfo,
      //   engineAssembly: engineAssembly,
      //   engineAssemblyReportCont: engineAssemblyReportCont,
      //   engineAssemblyPartsExchangeCatalog: engineAssemblyPartsExchangeCatalog,
      //   type: universalController.numberOfControllers.value == 8
      //       ? 'V8'
      //       : universalController.numberOfControllers.value == 12
      //           ? 'V12'
      //           : universalController.numberOfControllers.value == 16
      //               ? 'V16'
      //               : 'L7042GL C-14871',
      //   gearTrain: gearTrain,
      // );
      OverhaulReportTaskResponse taskResponse =
          await overhaulReportServices.createOverhaulReport(
        data: overHaulReport.finalToJson(),
        token: storage.read('token'),
      );
      print('Type: ${overHaulReport.type}');
      if (taskResponse.success) {
        ToastMessage.showToastMessage(
            message: 'Task Created Successfully',
            backgroundColor: AppColors.blueTextColor);
        // showConfirmationPopup(
        //   context: context,
        //   taskId: taskResponse.taskId ?? '',
        //   token: storage.read('token'),
        //   taskName: taskName.text.trim(),
        //   customerEmail: clientEmail.text.trim(),
        // );
        // await controller.getAllCompressorTasks();
        sideMenuController?.changePage(0);
        universalController.numberOfControllers.value = 0;
        Get.delete<ReportV8Controller>();
      } else {
        ToastMessage.showToastMessage(
            message: 'Failed to create task, please try again',
            backgroundColor: Colors.red);
      }
    } catch (error) {
      debugPrint('Error adding Generator task: $error');
      ToastMessage.showToastMessage(
          message: 'Something went wrong, try again',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
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
