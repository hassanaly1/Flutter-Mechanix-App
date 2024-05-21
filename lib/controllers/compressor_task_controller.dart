import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/data/compressor_task_service.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/storage_helper.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/models/compressor_model.dart';

class CompressorTaskController extends GetxController {
  RxBool isLoading = false.obs;
  final ScrollController scrollController = ScrollController();
  CompressorTaskService compressorTaskService = CompressorTaskService();
  final UniversalController controller = Get.find();

  void scrollUp() {
    if (scrollController.hasClients) {
      scrollController.animateTo(0.0,
          duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
    }
  }

  Future<void> addCompressorTask(SideMenuController? sideMenuController) async {
    var compressorTask = CompressorTaskModel(
      compressorId: '66486afb62fcb4e3463550c0',
      user: storage.read('user_info')['_id'],
      taskName: taskName.text.trim(),
      customerEmail: customerEmail.text.trim(),
      make: make.text.trim(),
      model: model.text.trim(),
      crossHeadShoes: crossheadShoes.text.trim(),
      mainBearing: mainBearings.text.trim(),
      connRodBearings: connRodBearings.text.trim(),
      crossHeadPinThruBolt: crossHeadPinthruBolt.text.trim(),
      spacerBarBolts: spacerBarBolts.text.trim(),
      crossHeadGuideToCrankcase: crossHeadGuideToCrankcase.text.trim(),
      crossHeadGuideToCyl: crossheadGuideToCyl.text.trim(),
      rodPackingBolt: rodPackingBolts.text.trim(),
      pistonNut: pistonNut.text.trim(),
      crossHeadNut: crossheadNut.text.trim(),
      connRadBushing: connRodBushing.text.trim(),
      babbit: babbit.text.trim(),
      bronze: bronze.text.trim(),
      castIron: castIron.text.trim(),
      connRodSideClearance: connRodSideClearance.text.trim(),
      mainRodSideClearance: mainBearingClearance.text.trim(),
      pistonEndCleareance: pistonEndClearance.text.trim(),
      connRoadBearingClearance: connRodBearingClearance.text.trim(),
      rodPackingSideClearance: rodPackingSideClearance.text.trim(),
      clearanceBronze: bronze2.text.trim(),
      teflon: teflon.text.trim(),
      crankstaftEndClearance: crankshaftEndClearance.text.trim(),
      compressorOilPressure: compressorOilPressure.text.trim(),
      valveCaps: [
        ValveCap(name: '3/8', type: valueOf3By8.value, size: '3/8'),
        ValveCap(name: '7/16', type: valueOf7By16.value, size: '7/16'),
        ValveCap(name: '1/2', type: valueOf1By2.value, size: '1/2'),
        ValveCap(name: '5/8', type: valueOf5By8.value, size: '5/8'),
        ValveCap(name: '3/4', type: valueOf3By4.value, size: '3/4'),
        ValveCap(name: '7/8', type: valueOf7By8.value, size: '7/8'),
        ValveCap(name: '1', type: valueOf1.value, size: '1'),
        ValveCap(name: '1 1/8', type: valueOf1_1By8.value, size: '1 1/8'),
        ValveCap(name: '1 1/4', type: valueOf1_1By4.value, size: '1 1/4'),
        ValveCap(name: '1 3/8', type: valueOf1_3By8.value, size: '1 3/8'),
        ValveCap(name: '1 1/2', type: valueOf1_1By2.value, size: '1 1/2'),
        ValveCap(name: '1 3/4', type: valueOf1_3By4.value, size: '1 3/4'),
        ValveCap(name: '2', type: valueOf2.value, size: '2'),
      ],
    );
    try {
      debugPrint('Add Generator Task Called');
      if (taskName.text.trim() == '' && customerEmail.text.trim() == '') {
        ToastMessage.showToastMessage(
            message: 'Please Enter Client Name and Email',
            backgroundColor: Colors.red);
      } else {
        isLoading.value = true;
        CompressorTaskResponse taskResponse =
            await compressorTaskService.createTask(
                token: storage.read('token'), compressor: compressorTask);

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
          await controller.getAllCompressorTasks();
          sideMenuController?.changePage(0);
          Get.delete<CompressorTaskController>();
        } else {
          ToastMessage.showToastMessage(
              message: 'Failed to create task, please try again',
              backgroundColor: Colors.red);
        }
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

  Future<void> updateCompressorTask({required String taskId}) async {
    var compressorTask = CompressorTaskModel(
      compressorId: '66486afb62fcb4e3463550c0',
      user: storage.read('user_info')['_id'],
      taskName: taskName.text.trim(),
      customerEmail: customerEmail.text.trim(),
      make: make.text.trim(),
      model: model.text.trim(),
      crossHeadShoes: crossheadShoes.text.trim(),
      mainBearing: mainBearings.text.trim(),
      connRodBearings: connRodBearings.text.trim(),
      crossHeadPinThruBolt: crossHeadPinthruBolt.text.trim(),
      spacerBarBolts: spacerBarBolts.text.trim(),
      crossHeadGuideToCrankcase: crossHeadGuideToCrankcase.text.trim(),
      crossHeadGuideToCyl: crossheadGuideToCyl.text.trim(),
      rodPackingBolt: rodPackingBolts.text.trim(),
      pistonNut: pistonNut.text.trim(),
      crossHeadNut: crossheadNut.text.trim(),
      connRadBushing: connRodBushing.text.trim(),
      babbit: babbit.text.trim(),
      bronze: bronze.text.trim(),
      castIron: castIron.text.trim(),
      connRodSideClearance: connRodSideClearance.text.trim(),
      mainRodSideClearance: mainBearingClearance.text.trim(),
      pistonEndCleareance: pistonEndClearance.text.trim(),
      connRoadBearingClearance: connRodBearingClearance.text.trim(),
      rodPackingSideClearance: rodPackingSideClearance.text.trim(),
      clearanceBronze: bronze2.text.trim(),
      teflon: teflon.text.trim(),
      crankstaftEndClearance: crankshaftEndClearance.text.trim(),
      compressorOilPressure: compressorOilPressure.text.trim(),
      valveCaps: [
        ValveCap(name: '3/8', type: valueOf3By8.value, size: '3/8'),
        ValveCap(name: '7/16', type: valueOf7By16.value, size: '7/16'),
        ValveCap(name: '1/2', type: valueOf1By2.value, size: '1/2'),
        ValveCap(name: '5/8', type: valueOf5By8.value, size: '5/8'),
        ValveCap(name: '3/4', type: valueOf3By4.value, size: '3/4'),
        ValveCap(name: '7/8', type: valueOf7By8.value, size: '7/8'),
        ValveCap(name: '1', type: valueOf1.value, size: '1'),
        ValveCap(name: '1 1/8', type: valueOf1_1By8.value, size: '1 1/8'),
        ValveCap(name: '1 1/4', type: valueOf1_1By4.value, size: '1 1/4'),
        ValveCap(name: '1 3/8', type: valueOf1_3By8.value, size: '1 3/8'),
        ValveCap(name: '1 1/2', type: valueOf1_1By2.value, size: '1 1/2'),
        ValveCap(name: '1 3/4', type: valueOf1_3By4.value, size: '1 3/4'),
        ValveCap(name: '2', type: valueOf2.value, size: '2'),
      ],
    );
    try {
      debugPrint('Update Compressor Task Called');
      if (taskName.text.trim() == '') {
        ToastMessage.showToastMessage(
            message: 'Please Enter Task Name', backgroundColor: Colors.red);
      } else {
        isLoading.value = true;
        bool taskUpdated = await compressorTaskService.updateTaskById(
            taskId: taskId,
            token: storage.read('token'),
            compressor: compressorTask);

        if (taskUpdated) {
          ToastMessage.showToastMessage(
              message: 'Task Updated Successfully',
              backgroundColor: AppColors.blueTextColor);
          controller.getAllCompressorTasks(page: 1);
          Get.back();
          Get.delete<CompressorTaskController>();
        } else {
          ToastMessage.showToastMessage(
              message: 'Failed to update task, please try again',
              backgroundColor: Colors.red);
        }
      }
    } catch (error) {
      // Handle error scenario
      debugPrint('Error Updating Generator Task: $error');
      ToastMessage.showToastMessage(
          message: 'Something went wrong, please try again',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  void updateControllers(CompressorTaskModel model) {
    taskName.text = model.taskName ?? '';
    customerEmail.text = model.customerEmail ?? '';
    make.text = model.make ?? '';
    this.model.text = model.model ?? '';
    crossheadShoes.text = model.crossHeadShoes ?? '';
    mainBearings.text = model.mainBearing ?? '';
    connRodBearings.text = model.connRodBearings ?? '';
    crossHeadPinthruBolt.text = model.crossHeadPinThruBolt ?? '';
    spacerBarBolts.text = model.spacerBarBolts ?? '';
    crossHeadGuideToCrankcase.text = model.crossHeadGuideToCrankcase ?? '';
    crossheadGuideToCyl.text = model.crossHeadGuideToCyl ?? '';
    rodPackingBolts.text = model.rodPackingBolt ?? '';
    pistonNut.text = model.pistonNut ?? '';
    crossheadNut.text = model.crossHeadNut ?? '';
    if (model.valveCaps![0].name == '3/8') {
      valueOf3By8.value = model.valveCaps![0].type ?? 'NF';
    }
    if (model.valveCaps![1].name == '7/16') {
      valueOf7By16.value = model.valveCaps![1].type ?? 'NF';
    }
    if (model.valveCaps![2].name == '1/2') {
      valueOf1By2.value = model.valveCaps![2].type ?? 'NF';
    }
    if (model.valveCaps![3].name == '5/8') {
      valueOf5By8.value = model.valveCaps![3].type ?? 'NF';
    }
    if (model.valveCaps![4].name == '3/4') {
      valueOf3By4.value = model.valveCaps![4].type ?? 'NF';
    }
    if (model.valveCaps![5].name == '7/8') {
      valueOf7By8.value = model.valveCaps![5].type ?? 'NF';
    }
    if (model.valveCaps![6].name == '1') {
      valueOf1.value = model.valveCaps![6].type ?? 'NF';
    }
    if (model.valveCaps![7].name == '1 1/8') {
      valueOf1_1By8.value = model.valveCaps![7].type ?? 'NF';
    }
    if (model.valveCaps![8].name == '1 1/4') {
      valueOf1_1By4.value = model.valveCaps![8].type ?? 'NF';
    }
    if (model.valveCaps![9].name == '1 3/8') {
      valueOf1_3By8.value = model.valveCaps![9].type ?? 'NF';
    }
    if (model.valveCaps![10].name == '1 1/2') {
      valueOf1_1By2.value = model.valveCaps![10].type ?? 'NF';
    }
    if (model.valveCaps![11].name == '1 3/4') {
      valueOf1_3By4.value = model.valveCaps![11].type ?? 'NF';
    }
    if (model.valveCaps![12].name == '2') {
      valueOf2.value = model.valveCaps![12].type ?? 'NF';
    }

    // valueOf1By2.value = model.valveCaps?[2].type ?? 'NF';
    // valueOf5By8.value = model.valveCaps?[3].type ?? 'NF';
    // valueOf3By4.value = model.valveCaps?[4].type ?? 'NF';
    // valueOf7By8.value = model.valveCaps?[5].type ?? 'NF';
    // valueOf1.value = model.valveCaps?[6].type ?? 'NF';
    // valueOf1_1By8.value = model.valveCaps?[7].type ?? 'NF';
    // valueOf1_1By4.value = model.valveCaps?[8].type ?? 'NF';
    // valueOf1_3By8.value = model.valveCaps?[9].type ?? 'NF';
    // valueOf1_1By2.value = model.valveCaps?[10].type ?? 'NF';
    // valueOf1_3By4.value = model.valveCaps?[11].type ?? 'NF';
    // valueOf2.value = model.valveCaps?[12].type ?? 'NF';
    connRodBushing.text = model.connRadBushing ?? '';
    babbit.text = model.babbit ?? '';
    bronze.text = model.bronze ?? '';
    castIron.text = model.castIron ?? '';
    connRodSideClearance.text = model.connRodSideClearance ?? '';
    mainBearingClearance.text = model.mainRodSideClearance ?? '';
    pistonEndClearance.text = model.pistonEndCleareance ?? '';
    connRodBearingClearance.text = model.connRoadBearingClearance ?? '';
    rodPackingSideClearance.text = model.rodPackingSideClearance ?? '';
    bronze2.text = model.clearanceBronze ?? '';
    teflon.text = model.teflon ?? '';
    crankshaftEndClearance.text = model.crankstaftEndClearance ?? '';
    compressorOilPressure.text = model.compressorOilPressure ?? '';
  }

  TextEditingController taskName = TextEditingController();
  TextEditingController customerEmail = TextEditingController();
  TextEditingController make = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController crossheadShoes = TextEditingController();
  TextEditingController mainBearings = TextEditingController();
  TextEditingController connRodBearings = TextEditingController();
  TextEditingController crossHeadPinthruBolt = TextEditingController();
  TextEditingController spacerBarBolts = TextEditingController();
  TextEditingController crossHeadGuideToCrankcase = TextEditingController();
  TextEditingController crossheadGuideToCyl = TextEditingController();
  TextEditingController rodPackingBolts = TextEditingController();
  TextEditingController pistonNut = TextEditingController();
  TextEditingController crossheadNut = TextEditingController();
  RxString valueOf3By8 = 'NF'.obs;
  RxString valueOf7By16 = 'NF'.obs;
  RxString valueOf1By2 = 'NF'.obs;
  RxString valueOf5By8 = 'NF'.obs;
  RxString valueOf3By4 = 'NF'.obs;
  RxString valueOf7By8 = 'NF'.obs;
  RxString valueOf1 = 'NF'.obs;
  RxString valueOf1_1By8 = 'NF'.obs;
  RxString valueOf1_1By4 = 'NF'.obs;
  RxString valueOf1_3By8 = 'NF'.obs;
  RxString valueOf1_1By2 = 'NF'.obs;
  RxString valueOf1_3By4 = 'NF'.obs;
  RxString valueOf2 = 'NF'.obs;
  TextEditingController connRodBushing = TextEditingController();
  TextEditingController babbit = TextEditingController();
  TextEditingController bronze = TextEditingController();
  TextEditingController castIron = TextEditingController();
  TextEditingController connRodSideClearance = TextEditingController();
  TextEditingController mainBearingClearance = TextEditingController();
  TextEditingController pistonEndClearance = TextEditingController();
  TextEditingController connRodBearingClearance = TextEditingController();
  TextEditingController rodPackingSideClearance = TextEditingController();
  TextEditingController bronze2 = TextEditingController();
  TextEditingController teflon = TextEditingController();
  TextEditingController crankshaftEndClearance = TextEditingController();
  TextEditingController compressorOilPressure = TextEditingController();
}
