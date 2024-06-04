import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mechanix/controllers/googlemap_controller.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/storage_helper.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/models/payload.dart';
import 'package:mechanix/models/task_model.dart';
import 'package:mechanix/services/generator_task_service.dart';
import 'package:mechanix/views/add_task/generator_task/custom_stepperbody4.dart';

class GeneratorTaskController extends GetxController {
  RxBool isLoading = false.obs;
  var activePageIndex = 0.obs;
  final ScrollController scrollController = ScrollController();
  final UniversalController controller = Get.find();
  final MapController mapController = Get.put(MapController());
  SideMenuController? sideMenuController;
  GeneratorTaskService taskService = GeneratorTaskService();
  List<Part> partsList = <Part>[].obs;

  @override
  void onInit() {
    selectedAddress.text = mapController.selectedAddress.value;
    selectedAddressLatitude = mapController.selectedAddressLatitude;
    selectedAddressLongitude = mapController.selectedAddressLongitude;
    // Getting the current date and time
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String formattedTime = DateFormat('HH:mm').format(now);
    taskSelectedDate = Rx<String>(formattedDate);
    taskSelectedTime = Rx<String>(formattedTime);
    for (int i = 0; i < 16; i++) {
      cylinderExhaustPyrometerTemperatureCtrl.add(TextEditingController());
    }
    for (int i = 0; i < 16; i++) {
      burnTemperatureCtrl.add(TextEditingController());
    }
    for (int i = 0; i < 16; i++) {
      hotCompressionTemperatureCtrl.add(TextEditingController());
    }
    super.onInit();
  }

  Future<void> addTask(
      BuildContext context, SideMenuController sideMenuController) async {
    //Geolocation
    Geolocation geolocation = Geolocation(
      address: selectedAddress.text.trim(),
      geolat: int.tryParse(selectedAddressLatitude.value),
      geolong: int.tryParse(selectedAddressLongitude.value),
    );
    //CylinderExhaustPyrometer
    List<Temperatures> cylinderExhaustPyrometer = [];
    for (TextEditingController controller
        in cylinderExhaustPyrometerTemperatureCtrl) {
      cylinderExhaustPyrometer.add(
        Temperatures(
          forCylinder: true,
          forBurnTemperature: false,
          forHotCompression: false,
          temperature: int.tryParse(controller.text.trim()),
        ),
      );
      // debugPrint(
      //     'cylinderExhaustPyrometer Temperature: ${controller.text.trim()}');
    }

    //HotCompression
    List<Temperatures> hotCompression = [];
    for (TextEditingController controller in hotCompressionTemperatureCtrl) {
      hotCompression.add(
        Temperatures(
          forCylinder: true,
          forBurnTemperature: false,
          forHotCompression: false,
          temperature: int.tryParse(controller.text.trim()),
        ),
      );
      // debugPrint('HotTemperature: ${controller.text.trim()}');
    }
    //BurnCompression
    List<Temperatures> burnCompression = [];
    for (TextEditingController controller in burnTemperatureCtrl) {
      burnCompression.add(
        Temperatures(
          forCylinder: true,
          forBurnTemperature: false,
          forHotCompression: false,
          temperature: int.tryParse(controller.text.trim()),
        ),
      );
      // debugPrint('Burn Temperature: ${controller.text.trim()}');
    }
    //Task
    TaskModel newTask = TaskModel(
      //Page1
      name: taskName.text.trim(),
      // name: _storage.read('user_info')['first_name'],
      userId: storage.read('user_info')['_id'],
      customerEmail: clientEmail.text.trim(),
      unit: int.tryParse(setUnits.text.trim()),
      unitHours: int.tryParse(unitHours.text.trim()),
      date: taskSelectedDate.value,
      time: taskSelectedTime.value,
      nameJourneyMan: nameOfJourneyMan.text.trim(),
      unitOnlineArrival: unitOnlineOnArrival.value,
      jobScope: jobScope.text.trim(),
      problems: operationalProblems.text.trim(),
      engineBrandId: engineBrandId.value,
      modelNumber: int.tryParse(modelNumber.text.trim()),
      serialNumber: int.tryParse(serialNumber.text.trim()),
      arrangementNumber: int.tryParse(arrangementNumber.text.trim()),
      isOilSampleTaken: oilSamplesTaken.value,

      //Page2
      engineLoad: int.tryParse(engineLoad.text.trim()),
      engineRpm: int.tryParse(engineRPM.text.trim()),
      btdc: int.tryParse(ignitionTiming.text.trim()),
      gasSampleAsFound: exhaustGasSampleFound,
      lbBankAsGasFound: int.tryParse(leftBankFound.text.trim()),
      rbBankAsGasFound: int.tryParse(rightBankFound.text.trim()),
      gasSampleAsAdjusted: exhaustGasSampleAdjusted,
      lbBankAsGasAdjusted: int.tryParse(leftBankAdjusted.text.trim()),
      rbBankAsGasAdjusted: int.tryParse(rightBankAdjusted.text.trim()),
      btdcValue: int.tryParse(btuValue.text.trim()),
      btuType: selectedBtuValue.value,
      isMisfiresDetected: missFireDetected.value,
      throttleActuatorPosition:
          int.tryParse(throttleActuatorPosition.text.trim()),
      throttleActuatorFuelValue: int.tryParse(fuelValue.text.trim()),
      engineOilPressurePsi: int.tryParse(engineOilPressure.text.trim()),
      oilPressureDifferentialFilter:
          int.tryParse(oilPressureDifferentialTextField.text.trim()),
      engineOilPressureDifferentialFilterNa: oilPressureDifferential.value,
      oilTemperatureIn: int.tryParse(oilTemperatureIn.text.trim()),
      oilTemperatureOut: int.tryParse(oilTemperatureOut.text.trim()),
      oilEngineLevel: oilLevelEngine.value,
      engineCoolantValue: int.tryParse(engineCoolantPressure.text.trim()),
      engineCoolantType: engineCoolantPressureRadioValue.value,
      jacketWaterLevel: jacketWaterLevel.value,
      auxiliaryCoolant: auxiliaryCoolantlevel1.value,
      jacketWaterTemperatureIn:
          int.tryParse(jacketWaterTemperaturesIn.text.trim()),
      jacketWaterTemperatureOut:
          int.tryParse(jacketWaterTemperaturesOut.text.trim()),
      coolantTemperatureIn: int.tryParse(auxCoolantTemperaturesIn.text.trim()),
      coolantTemperatureOut:
          int.tryParse(auxCoolantTemperaturesOut.text.trim()),
      inletAirTemperatureValue: int.tryParse(inletAirTemp.text.trim()),
      inletAirTemperatureType: inletAirTempRadio.value,
      inletAirPressureValue: int.tryParse(inletAirPressure.text.trim()),
      inletAirPressureType: inletAirPressureRadio.value,
      primaryFuelPressurePsi: int.tryParse(primaryFuelPressure.text.trim()),
      cranKCaseFuelRatio: int.tryParse(actualAirToFuelRatio.text.trim()),
      vaccumCrankCasePressure: int.tryParse(crankcasePressure.text.trim()),
      airfilterRestrictionValue: int.tryParse(airFilterRestriction.text.trim()),
      airfilterRestrictionType: airFilterRestrictionRadio.value,
      cranKCaseHydraulicOilCondition: hydraulicOil.value,
      isLeakageFound: isLeakageFound.value,
      isExcessiveVibration: excessiveVibrationAndOddNoises.value,
      excessiveVibrationDescription:
          excessiveVibrationAndOddNoisesDescription.text.trim(),
      isInDrivingProblem: problemsWithDriver.value,
      drivingProblemDescription: problemsWithDriverDescription.text.trim(),

      //Page3
      intakeValue: int.tryParse(intakeValueSet.text.trim()),
      intakeType: intakeValueSetRadioValue.value,
      exhaustValue: int.tryParse(exhaustValueSet.text.trim()),
      exhaustType: exhaustValueSetRadioValue.value,
      majorValueDetected: majorValueRecessionDetected.value,
      boroscopeRecommended: boroscopeRecommended.value,
      boroscopeInspectionCompleted: boroscopeInspectionCompleted.value,
      installNewSparkPlug: installNewSparkplugs.value,
      sparkplugGap: int.tryParse(sparkplugGap.text.trim()),
      extensionInstalled: sparkplugExtensionInstalled.value,
      anyNewExtension: newExtensionInstalled.value,
      replaceExtensionList: listOfNewExtensionInstalled.text.trim(),
      sparkWireCondition: sparkplugWireCondition.value,
      sparkWireConditionValue: listOfSparkplugWireCondition.text.trim(),
      canNOnPlugTight: cannonPlugConnectorsTight.value,
      replacedListTransformerCoils: listOfTransformerCoilsReplaced.text.trim(),
      crankcaseInspection: crankcaseBreatherInspection.value,
      newBreatherElementInstalled: newBreatherElementInstalled.value,
      beltsCoolers: checkAllCanonFan.value,
      listOfBeltCoolers: listOfCheckAllCoolerFan.text.trim(),
      coolantSystemLeakageChecks: coolantSystemCheck.value,
      lubricantSystemCheck: lubricationSystemCheck.value,
      coolantSystemLeakageGreasers: coolingSystemCheck.value,
      fuelGasFilter: checkFuelGasFilter.value,
      fuelGasFilterFound: fuelGasFilterFound.value,
      airFilterInspection: airFilterInspection.value,
      turboChargesInspection: turboChargerInspection.value,
      carburetorInspection: carburetorInternalCleaningInspection.value,
      engineOilFilterAsk: engineOilFilterChange.value,
      engineOilFilterValue: engineOilFilterChange2.value,
      oilCoolerDrained: oilCoolerDrained.value,
      hyraulicOilFilter: hydraulicOilFilterChange.value,
      hyraulicOilNew: hydraulicOilNew.value,
      oilLevelCorrect: engineOilSystemPrimed.value,
      oilDrainedIsolation: oilDrainIsolationValvesShutIn.value,
      tankFilter: dayTankFiltersInstalledNew.value,
      tankValuesOpen: dayTankValvesOpen.value,

      //Page4
      oilPressureEngineGood: oilPressureEngineAndGood.value,
      engineOilLevel: engineOilLevel.value,
      jacketWaterCoolantLevel: jacketWaterCoolantLevel.value,
      auxiliaryCoolantLevel: auxiliaryCoolantLevel2.value,
      temperaturePressureChecks:
          allTempsAndPressuresStableAndNormalRanges.value,
      nOiseVibrationDetected: noisesOrVibrationsDetected.value,
      engineExhaustGasAdjusted:
          engineExhaustGasCheckedAndAdjustedAtMaxLoad.value,
      documentFinalSetPoints:
          documentFinalSetPointExhaustGasOxygenOrCOLevels.text.trim(),
      documentFinalManifoldPressure:
          documentFinalManifoldPressureAndRPM.text.trim(),
      engineDeficienciesRepairedFuture: engineDeficienciesRadio.value,
      engineDeficienciesDescribed: engineDeficienciesTextfield.text.trim(),
      partRepairedOrder: partsOrderingStatus.value,
      // partsList: partsList,
    );
    //turboTemperatures
    List<TurboTemperature> turboTemperature = [
      TurboTemperature(
        lbInType: lbTurboIn.value,
        lbInValue: int.tryParse(lbTurboInTemp.text.trim()),
        isTurboIn: true,
        isTurboOut: false,
        rbInType: rbTurboIn.value,
        rbInValue: int.tryParse(rbTurboInTemp.text.trim()),
      ),
      TurboTemperature(
        lbInType: lbTurboOut.value,
        lbInValue: int.tryParse(lbTurboOutTemp.text.trim()),
        isTurboIn: false,
        isTurboOut: true,
        rbInType: rbTurboOut.value,
        rbInValue: int.tryParse(rbTurboOutTemp.text.trim()),
      ),
    ];
    //LeakageFound
    LeakageFound leakageFound = LeakageFound(
      hasOilLeakage: hasOilLeakage.value,
      oilDescription: oilDescription.text.trim(),
      hasCoolantLeakage: hasCoolantLeakage.value,
      coolantDescription: coolantDescription.text.trim(),
      hasGasLeakage: hasGasLeakage.value,
      gasDescription: gasDescription.text.trim(),
      hasExhaustGasLeakage: hasExhaustGasLeakage.value,
      exhaustGasDescription: exhaustDescription.text.trim(),
      hasAirLeakage: hasAirLeakage.value,
      airDescription: airDescription.text.trim(),
    );
    //Parts
    List<Part> parts = partsList;

    try {
      debugPrint('Add Generator Task Called');
      if (taskName.text.trim() == '' && clientEmail.text.trim() == '') {
        ToastMessage.showToastMessage(
            message: 'Please Enter Client Name and Email',
            backgroundColor: Colors.red);
      }
      if (engineBrandId.value == "") {
        ToastMessage.showToastMessage(
            message: 'Please Select Engine Brand from 1st Tab',
            backgroundColor: Colors.red);
      } else {
        print(
            'CylinderTemperatures: ${cylinderExhaustPyrometer.map((e) => e.temperature).toList()}');
        print(
            'HotTemperatures: ${hotCompression.map((e) => e.temperature).toList()}');
        print(
            'BurnTemperatures: ${burnCompression.map((e) => e.temperature).toList()}');
        isLoading.value = true;
        GeneratorTaskResponse taskResponse = await taskService.createTask(
          token: storage.read('token'),
          geolocation: geolocation,
          task: newTask,
          turboTemperature: turboTemperature,
          cylinderExhaustPyrometer: cylinderExhaustPyrometer,
          hotCompression: hotCompression,
          burnCompression: burnCompression,
          leakageFound: leakageFound,
          parts: parts,
        );

        if (taskResponse.success) {
          ToastMessage.showToastMessage(
              message: 'Task Created Successfully',
              backgroundColor: AppColors.blueTextColor);
          showConfirmationPopup(
            context: context,
            taskId: taskResponse.taskId ?? '',
            token: storage.read('token'),
            taskName: taskName.text.trim(),
            customerEmail: clientEmail.text.trim(),
          );
          // await controller.getAllGeneratorTasks();
          sideMenuController.changePage(0);
          Get.delete<GeneratorTaskController>();
          Get.delete<MapController>();
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

  Future<void> updateTask(String taskId) async {
    //Geolocation
    Geolocation geolocation = Geolocation(
      address: selectedAddress.text.trim(),
      geolat: int.tryParse(selectedAddressLatitude.value),
      geolong: int.tryParse(selectedAddressLongitude.value),
    );
    //CylinderExhaustPyrometer
    List<Temperatures> cylinderExhaustPyrometer = [];
    for (TextEditingController controller
        in cylinderExhaustPyrometerTemperatureCtrl) {
      cylinderExhaustPyrometer.add(
        Temperatures(
          forCylinder: true,
          forBurnTemperature: false,
          forHotCompression: false,
          temperature: int.tryParse(controller.text.trim()),
        ),
      );
    }

    //HotCompression
    List<Temperatures> hotCompression = [];
    for (TextEditingController controller in hotCompressionTemperatureCtrl) {
      hotCompression.add(
        Temperatures(
          forCylinder: true,
          forBurnTemperature: false,
          forHotCompression: false,
          temperature: int.tryParse(controller.text.trim()),
        ),
      );
    }
    //BurnCompression
    List<Temperatures> burnCompression = [];
    for (TextEditingController controller in burnTemperatureCtrl) {
      burnCompression.add(
        Temperatures(
          forCylinder: true,
          forBurnTemperature: false,
          forHotCompression: false,
          temperature: int.tryParse(controller.text.trim()),
        ),
      );
    }
    //Task
    TaskModel newTask = TaskModel(
      //Page1
      name: taskName.text.trim(),
      userId: storage.read('user_info')['_id'],
      customerEmail: clientEmail.text.trim(),
      unit: int.tryParse(setUnits.text.trim()),
      unitHours: int.tryParse(unitHours.text.trim()),
      date: taskSelectedDate.value,
      time: taskSelectedTime.value,
      nameJourneyMan: nameOfJourneyMan.text.trim(),
      unitOnlineArrival: unitOnlineOnArrival.value,
      jobScope: jobScope.text.trim(),
      problems: operationalProblems.text.trim(),
      // engineBrandId: engineBrandId.value,
      modelNumber: int.tryParse(modelNumber.text.trim()),
      serialNumber: int.tryParse(serialNumber.text.trim()),
      arrangementNumber: int.tryParse(arrangementNumber.text.trim()),
      isOilSampleTaken: oilSamplesTaken.value,

      //Page2
      engineLoad: int.tryParse(engineLoad.text.trim()),
      engineRpm: int.tryParse(engineRPM.text.trim()),
      btdc: int.tryParse(ignitionTiming.text.trim()),
      gasSampleAsFound: exhaustGasSampleFound,
      lbBankAsGasFound: int.tryParse(leftBankFound.text.trim()),
      rbBankAsGasFound: int.tryParse(rightBankFound.text.trim()),
      gasSampleAsAdjusted: exhaustGasSampleAdjusted,
      lbBankAsGasAdjusted: int.tryParse(leftBankAdjusted.text.trim()),
      rbBankAsGasAdjusted: int.tryParse(rightBankAdjusted.text.trim()),
      btdcValue: int.tryParse(btuValue.text.trim()),
      btuType: selectedBtuValue.value,
      isMisfiresDetected: missFireDetected.value,
      throttleActuatorPosition:
          int.tryParse(throttleActuatorPosition.text.trim()),
      throttleActuatorFuelValue: int.tryParse(fuelValue.text.trim()),
      engineOilPressurePsi: int.tryParse(engineOilPressure.text.trim()),
      oilPressureDifferentialFilter:
          int.tryParse(oilPressureDifferentialTextField.text.trim()),
      engineOilPressureDifferentialFilterNa: oilPressureDifferential.value,
      oilTemperatureIn: int.tryParse(oilTemperatureIn.text.trim()),
      oilTemperatureOut: int.tryParse(oilTemperatureOut.text.trim()),
      oilEngineLevel: oilLevelEngine.value,
      engineCoolantValue: int.tryParse(engineCoolantPressure.text.trim()),
      engineCoolantType: engineCoolantPressureRadioValue.value,
      jacketWaterLevel: jacketWaterLevel.value,
      auxiliaryCoolant: auxiliaryCoolantlevel1.value,
      jacketWaterTemperatureIn:
          int.tryParse(jacketWaterTemperaturesIn.text.trim()),
      jacketWaterTemperatureOut:
          int.tryParse(jacketWaterTemperaturesOut.text.trim()),
      coolantTemperatureIn: int.tryParse(auxCoolantTemperaturesIn.text.trim()),
      coolantTemperatureOut:
          int.tryParse(auxCoolantTemperaturesOut.text.trim()),
      inletAirTemperatureValue: int.tryParse(inletAirTemp.text.trim()),
      inletAirTemperatureType: inletAirTempRadio.value,
      inletAirPressureValue: int.tryParse(inletAirPressure.text.trim()),
      inletAirPressureType: inletAirPressureRadio.value,
      primaryFuelPressurePsi: int.tryParse(primaryFuelPressure.text.trim()),
      cranKCaseFuelRatio: int.tryParse(actualAirToFuelRatio.text.trim()),
      vaccumCrankCasePressure: int.tryParse(crankcasePressure.text.trim()),
      airfilterRestrictionValue: int.tryParse(airFilterRestriction.text.trim()),
      airfilterRestrictionType: airFilterRestrictionRadio.value,
      cranKCaseHydraulicOilCondition: hydraulicOil.value,
      isLeakageFound: isLeakageFound.value,
      isExcessiveVibration: excessiveVibrationAndOddNoises.value,
      excessiveVibrationDescription:
          excessiveVibrationAndOddNoisesDescription.text.trim(),
      isInDrivingProblem: problemsWithDriver.value,
      drivingProblemDescription: problemsWithDriverDescription.text.trim(),

      //Page3
      intakeValue: int.tryParse(intakeValueSet.text.trim()),
      intakeType: intakeValueSetRadioValue.value,
      exhaustValue: int.tryParse(exhaustValueSet.text.trim()),
      exhaustType: exhaustValueSetRadioValue.value,
      majorValueDetected: majorValueRecessionDetected.value,
      boroscopeRecommended: boroscopeRecommended.value,
      boroscopeInspectionCompleted: boroscopeInspectionCompleted.value,
      installNewSparkPlug: installNewSparkplugs.value,
      sparkplugGap: int.tryParse(sparkplugGap.text.trim()),
      extensionInstalled: sparkplugExtensionInstalled.value,
      anyNewExtension: newExtensionInstalled.value,
      replaceExtensionList: listOfNewExtensionInstalled.text.trim(),
      sparkWireCondition: sparkplugWireCondition.value,
      sparkWireConditionValue: listOfSparkplugWireCondition.text.trim(),
      canNOnPlugTight: cannonPlugConnectorsTight.value,
      replacedListTransformerCoils: listOfTransformerCoilsReplaced.text.trim(),
      crankcaseInspection: crankcaseBreatherInspection.value,
      newBreatherElementInstalled: newBreatherElementInstalled.value,
      beltsCoolers: checkAllCanonFan.value,
      listOfBeltCoolers: listOfCheckAllCoolerFan.text.trim(),
      coolantSystemLeakageChecks: coolantSystemCheck.value,
      lubricantSystemCheck: lubricationSystemCheck.value,
      coolantSystemLeakageGreasers: coolingSystemCheck.value,
      fuelGasFilter: checkFuelGasFilter.value,
      fuelGasFilterFound: fuelGasFilterFound.value,
      airFilterInspection: airFilterInspection.value,
      turboChargesInspection: turboChargerInspection.value,
      carburetorInspection: carburetorInternalCleaningInspection.value,
      engineOilFilterAsk: engineOilFilterChange.value,
      engineOilFilterValue: engineOilFilterChange2.value,
      oilCoolerDrained: oilCoolerDrained.value,
      hyraulicOilFilter: hydraulicOilFilterChange.value,
      hyraulicOilNew: hydraulicOilNew.value,
      oilLevelCorrect: engineOilSystemPrimed.value,
      oilDrainedIsolation: oilDrainIsolationValvesShutIn.value,
      tankFilter: dayTankFiltersInstalledNew.value,
      tankValuesOpen: dayTankValvesOpen.value,

      //Page4
      oilPressureEngineGood: oilPressureEngineAndGood.value,
      engineOilLevel: engineOilLevel.value,
      jacketWaterCoolantLevel: jacketWaterCoolantLevel.value,
      auxiliaryCoolantLevel: auxiliaryCoolantLevel2.value,
      temperaturePressureChecks:
          allTempsAndPressuresStableAndNormalRanges.value,
      nOiseVibrationDetected: noisesOrVibrationsDetected.value,
      engineExhaustGasAdjusted:
          engineExhaustGasCheckedAndAdjustedAtMaxLoad.value,
      documentFinalSetPoints:
          documentFinalSetPointExhaustGasOxygenOrCOLevels.text.trim(),
      documentFinalManifoldPressure:
          documentFinalManifoldPressureAndRPM.text.trim(),
      engineDeficienciesRepairedFuture: engineDeficienciesRadio.value,
      engineDeficienciesDescribed: engineDeficienciesTextfield.text.trim(),
      partRepairedOrder: partsOrderingStatus.value,
      // partsList: partsList,
    );
    //turboTemperatures
    List<TurboTemperature> turboTemperature = [
      TurboTemperature(
        lbInType: lbTurboIn.value,
        lbInValue: int.tryParse(lbTurboInTemp.text.trim()),
        isTurboIn: true,
        isTurboOut: false,
        rbInType: rbTurboIn.value,
        rbInValue: int.tryParse(rbTurboInTemp.text.trim()),
      ),
      TurboTemperature(
        lbInType: lbTurboOut.value,
        lbInValue: int.tryParse(lbTurboOutTemp.text.trim()),
        isTurboIn: false,
        isTurboOut: true,
        rbInType: rbTurboOut.value,
        rbInValue: int.tryParse(rbTurboOutTemp.text.trim()),
      ),
    ];
    //LeakageFound
    LeakageFound leakageFound = LeakageFound(
      hasOilLeakage: hasOilLeakage.value,
      oilDescription: oilDescription.text.trim(),
      hasCoolantLeakage: hasCoolantLeakage.value,
      coolantDescription: coolantDescription.text.trim(),
      hasGasLeakage: hasGasLeakage.value,
      gasDescription: gasDescription.text.trim(),
      hasExhaustGasLeakage: hasExhaustGasLeakage.value,
      exhaustGasDescription: exhaustDescription.text.trim(),
      hasAirLeakage: hasAirLeakage.value,
      airDescription: airDescription.text.trim(),
    );
    //Parts
    List<Part> parts = partsList;

    try {
      debugPrint('Update Generator Task Called');
      if (taskName.text.trim() == '') {
        ToastMessage.showToastMessage(
            message: 'Please Enter Task Name', backgroundColor: Colors.red);
      } else {
        print(newTask.name);
        isLoading.value = true;
        bool taskUpdated = await taskService.updateTaskById(
          taskId: taskId,
          token: storage.read('token'),
          geolocation: geolocation,
          task: newTask,
          turboTemperature: turboTemperature,
          cylinderExhaustPyrometer: cylinderExhaustPyrometer,
          hotCompression: hotCompression,
          burnCompression: burnCompression,
          leakageFound: leakageFound,
          parts: parts,
        );
        print(
            'CylinderTemperaturesAfterUpdate: ${cylinderExhaustPyrometer.map((e) => e.temperature).toList()}');
        print(
            'HotTemperaturesAfterUpdate: ${hotCompression.map((e) => e.temperature).toList()}');
        print(
            'BurnTemperaturesAfterUpdate: ${burnCompression.map((e) => e.temperature).toList()}');

        if (taskUpdated) {
          ToastMessage.showToastMessage(
              message: 'Task Updated Successfully',
              backgroundColor: AppColors.blueTextColor);
          controller.getAllGeneratorTasks();
          Get.back();
          Get.delete<GeneratorTaskController>();
          Get.delete<MapController>();
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

  void updateControllers(Payload payload) {
    //CylinderExhaustPyrometer
    for (int i = 0; i < 16; i++) {
      cylinderExhaustPyrometerTemperatureCtrl[i].text =
          payload.cylinderExhaustPyrometer?[i].temperature.toString() ?? 0;
      debugPrint(
          'cylinderExhaustPyrometerTemperatureWhenUpdating: ${payload.cylinderExhaustPyrometer?[i].temperature.toString()}');
    }
    //BurnTemperatures
    for (int i = 0; i < 16; i++) {
      burnTemperatureCtrl[i].text =
          payload.burnCompression?[i].temperature.toString() ?? 0;
      debugPrint(
          'BurnTemperatureWhenUpdating: ${payload.burnCompression?[i].temperature.toString()}');
    }
    //HotCompressionTemperature
    for (int i = 0; i < 16; i++) {
      hotCompressionTemperatureCtrl[i].text =
          payload.hotCompression?[i].temperature.toString() ?? 0;
      debugPrint(
          'hotTemperatureWhenUpdating: ${payload.hotCompression?[i].temperature.toString()}');
    }

    //Page1
    taskName.text = payload.task?.name ?? '';
    clientEmail.text = payload.task?.customerEmail ?? '';
    selectedAddress.text = payload.geolocation?.address ?? '';
    setUnits.text = payload.task?.unit.toString() ?? '';
    unitHours.text = payload.task?.unitHours.toString() ?? '';
    taskSelectedDate.value = payload.task?.date ?? '';
    taskSelectedTime.value = payload.task?.time ?? '';
    engineBrandId.value = payload.task?.engineBrandId ?? '';
    nameOfJourneyMan.text = payload.task?.nameJourneyMan ?? '';
    jobScope.text = payload.task?.jobScope ?? '';
    operationalProblems.text = payload.task?.problems ?? '';
    modelNumber.text = payload.task?.modelNumber.toString() ?? '';
    serialNumber.text = payload.task?.serialNumber.toString() ?? '';
    arrangementNumber.text = payload.task?.arrangementNumber.toString() ?? '';
    oilSamplesTaken.value = payload.task?.isOilSampleTaken ?? '';
    //Page2
    engineLoad.text = payload.task?.engineLoad.toString() ?? '';
    engineRPM.text = payload.task?.engineRpm.toString() ?? '';
    ignitionTiming.text = payload.task?.btdc.toString() ?? '';
    exhaustGasSampleFound.value = (payload.task?.gasSampleAsFound)!
        .map((item) => item.toString())
        .toList();
    leftBankFound.text = payload.task?.lbBankAsGasFound.toString() ?? '';
    rightBankFound.text = payload.task?.rbBankAsGasFound.toString() ?? '';
    exhaustGasSampleAdjusted.value = (payload.task?.gasSampleAsAdjusted)!
        .map((item) => item.toString())
        .toList();
    leftBankAdjusted.text = payload.task?.lbBankAsGasAdjusted.toString() ?? '';
    rightBankAdjusted.text = payload.task?.rbBankAsGasAdjusted.toString() ?? '';

    btuValue.text = payload.task?.btdcValue.toString() ?? '';
    selectedBtuValue.value = payload.task?.btuType ?? 'C';
    //IN
    lbTurboIn.value = payload.turboTemperature?[0].lbInType ?? '';
    lbTurboInTemp.text =
        payload.turboTemperature?[0].lbInValue.toString() ?? '';
    rbTurboIn.value = payload.turboTemperature?[0].rbInType ?? '';
    rbTurboInTemp.text =
        payload.turboTemperature?[0].rbInValue.toString() ?? '';
    //OUT
    lbTurboOut.value = payload.turboTemperature?[1].lbInType ?? '';
    lbTurboOutTemp.text =
        payload.turboTemperature?[1].lbInValue.toString() ?? '';
    rbTurboOut.value = payload.turboTemperature?[1].rbInType ?? '';
    rbTurboOutTemp.text =
        payload.turboTemperature?[1].rbInValue.toString() ?? '';
    missFireDetected.value = payload.task?.isMisfiresDetected ?? 'NO';
    throttleActuatorPosition.text =
        payload.task?.throttleActuatorPosition.toString() ?? '';
    fuelValue.text = payload.task?.throttleActuatorFuelValue.toString() ?? '';
    engineOilPressure.text =
        payload.task?.engineOilPressurePsi.toString() ?? '';
    oilPressureDifferential.value =
        payload.task?.engineOilPressureDifferentialFilterNa ?? 'NA';
    oilPressureDifferentialTextField.text =
        payload.task?.oilPressureDifferentialFilter.toString() ?? '';
    oilTemperatureIn.text = payload.task?.oilTemperatureIn.toString() ?? '';
    oilTemperatureOut.text = payload.task?.oilTemperatureOut.toString() ?? '';
    oilLevelEngine.value = payload.task?.oilEngineLevel.toString() ?? 'LOW';
    engineCoolantPressure.text =
        payload.task?.engineCoolantValue.toString() ?? '';
    engineCoolantPressureRadioValue.value =
        payload.task?.engineCoolantType ?? 'PSI';
    jacketWaterLevel.value = payload.task?.jacketWaterLevel.toString() ?? 'LOW';
    auxiliaryCoolantlevel1.value = payload.task?.auxiliaryCoolant ?? 'LOW';
    jacketWaterTemperaturesIn.text =
        payload.task?.jacketWaterTemperatureIn.toString() ?? '';
    jacketWaterTemperaturesOut.text =
        payload.task?.jacketWaterTemperatureOut.toString() ?? '';
    auxCoolantTemperaturesIn.text =
        payload.task?.coolantTemperatureIn.toString() ?? '';
    auxCoolantTemperaturesOut.text =
        payload.task?.coolantTemperatureOut.toString() ?? '';
    inletAirTemp.text = payload.task?.inletAirTemperatureValue.toString() ?? '';
    inletAirTempRadio.value =
        payload.task?.inletAirTemperatureType.toString() ?? 'C';
    inletAirPressure.text =
        payload.task?.inletAirPressureValue.toString() ?? '';
    inletAirPressureRadio.value =
        payload.task?.inletAirPressureType.toString() ?? 'PSI';
    primaryFuelPressure.text =
        payload.task?.cranKCaseFuelRatio.toString() ?? '';
    actualAirToFuelRatio.text =
        payload.task?.cranKCaseFuelRatio.toString() ?? '';
    crankcasePressure.text =
        payload.task?.vaccumCrankCasePressure.toString() ?? '';
    airFilterRestriction.text =
        payload.task?.airfilterRestrictionValue.toString() ?? '';
    airFilterRestrictionRadio.value =
        payload.task?.airfilterRestrictionType ?? 'RB';
    hydraulicOil.value =
        payload.task?.cranKCaseHydraulicOilCondition.toString() ?? 'LOW';
    isLeakageFound.value = payload.task?.isLeakageFound.toString() ?? 'NO';

    ///LeakageFound
    hasOilLeakage.value = payload.leakageFound!.hasOilLeakage ?? false;
    hasCoolantLeakage.value = payload.leakageFound!.hasCoolantLeakage ?? false;
    hasGasLeakage.value = payload.leakageFound!.hasGasLeakage ?? false;
    hasExhaustGasLeakage.value =
        payload.leakageFound!.hasExhaustGasLeakage ?? false;
    hasAirLeakage.value = payload.leakageFound!.hasAirLeakage ?? false;
    oilDescription.text = payload.leakageFound!.oilDescription ?? '';
    coolantDescription.text = payload.leakageFound!.coolantDescription ?? '';
    gasDescription.text = payload.leakageFound!.gasDescription ?? '';
    exhaustDescription.text = payload.leakageFound!.exhaustGasDescription ?? '';
    airDescription.text = payload.leakageFound!.airDescription ?? '';
    //Page2
    excessiveVibrationAndOddNoises.value =
        payload.task?.isExcessiveVibration ?? 'NO';
    excessiveVibrationAndOddNoisesDescription.text =
        payload.task?.excessiveVibrationDescription ?? '';
    problemsWithDriver.value = payload.task?.isInDrivingProblem ?? 'NO';
    problemsWithDriverDescription.text =
        payload.task?.drivingProblemDescription ?? '';
    //Page3
    intakeValueSet.text = payload.task?.intakeValue.toString() ?? '';
    intakeValueSetRadioValue.value = payload.task?.intakeType ?? 'HYDRAULIC';
    exhaustValueSet.text = payload.task?.exhaustValue.toString() ?? '';
    exhaustValueSetRadioValue.value = payload.task?.exhaustType ?? 'HYDRAULIC';
    majorValueRecessionDetected.value =
        payload.task?.majorValueDetected ?? 'NO';
    boroscopeRecommended.value = payload.task?.boroscopeRecommended ?? 'NO';
    boroscopeInspectionCompleted.value =
        payload.task?.boroscopeInspectionCompleted ?? 'NO';
    // Sparkplugs
    installNewSparkplugs.value = payload.task?.installNewSparkPlug ?? 'NO';
    sparkplugGap.text = payload.task?.sparkplugGap?.toString() ?? '';
    sparkplugExtensionInstalled.value =
        payload.task?.extensionInstalled ?? 'NO';
    newExtensionInstalled.value = payload.task?.anyNewExtension ?? 'NA';
    listOfNewExtensionInstalled.text = payload.task?.replaceExtensionList ?? '';
    sparkplugWireCondition.value = payload.task?.sparkWireCondition ?? 'POOR';
    listOfSparkplugWireCondition.text =
        payload.task?.sparkWireConditionValue ?? '';

// Connections
    cannonPlugConnectorsTight.value = payload.task?.canNOnPlugTight ?? 'NO';
    listOfTransformerCoilsReplaced.text =
        payload.task?.replacedListTransformerCoils ?? '';

// Crankcase
    crankcaseBreatherInspection.value =
        payload.task?.crankcaseInspection ?? 'NA';
    newBreatherElementInstalled.value =
        payload.task?.newBreatherElementInstalled ?? 'NA';

// Belts and Coolers
    checkAllCanonFan.value = payload.task?.beltsCoolers ?? 'NA';
    listOfCheckAllCoolerFan.text = payload.task?.listOfBeltCoolers ?? '';

// Coolant System Check
    coolantSystemCheck.value = payload.task?.coolantSystemLeakageChecks ?? 'NA';

// Lubrication System Check
    lubricationSystemCheck.value = payload.task?.lubricantSystemCheck ?? 'NO';

// Cooling System Check
    coolingSystemCheck.value =
        payload.task?.coolantSystemLeakageGreasers ?? 'NO';

// Fuel System Inspection
    checkFuelGasFilter.value = payload.task?.fuelGasFilter ?? 'YES';
    fuelGasFilterFound.value = payload.task?.fuelGasFilterFound ?? 'DRY';

// Air Filter Inspection
    airFilterInspection.value = payload.task?.airFilterInspection ?? 'YES';

// Turbocharger Inspection
    turboChargerInspection.value =
        payload.task?.turboChargesInspection ?? 'YES';

// Carburetor and Fuel Injection Inspection
    carburetorInternalCleaningInspection.value =
        payload.task?.carburetorInspection ?? 'YES';

// Engine Oil Maintenance
    engineOilFilterChange.value = payload.task?.engineOilFilterAsk ?? 'YES';
    engineOilFilterChange2.value =
        payload.task?.engineOilFilterValue ?? 'CLEAN';
    oilCoolerDrained.value = payload.task?.oilCoolerDrained ?? 'YES';

// Hydraulic System Check
    hydraulicOilFilterChange.value = payload.task?.hyraulicOilFilter ?? 'YES';
    hydraulicOilNew.value = payload.task?.hyraulicOilNew ?? 'YES';

// Miscellaneous Checks
    engineOilSystemPrimed.value = payload.task?.oilLevelCorrect ?? 'YES';
    oilDrainIsolationValvesShutIn.value =
        payload.task?.oilDrainedIsolation ?? 'YES';
    dayTankFiltersInstalledNew.value = payload.task?.tankFilter ?? 'YES';
    dayTankValvesOpen.value = payload.task?.tankValuesOpen ?? 'YES';
    //Parts

    //Part4
    // Oil Pressure and Level Check
    oilPressureEngineAndGood.value =
        payload.task?.oilPressureEngineGood ?? 'YES';
    engineOilLevel.value = payload.task?.engineOilLevel ?? 'LOW';

// Coolant System Check
    jacketWaterCoolantLevel.value =
        payload.task?.jacketWaterCoolantLevel ?? 'LOW';
    auxiliaryCoolantLevel2.value = payload.task?.auxiliaryCoolantLevel ?? 'LOW';

// Temperature and Pressure Check
    allTempsAndPressuresStableAndNormalRanges.value =
        payload.task?.temperaturePressureChecks ?? 'YES';

// Noise and Vibration Check
    noisesOrVibrationsDetected.value =
        payload.task?.nOiseVibrationDetected ?? 'YES';

// Exhaust Gas and Manifold Pressure
    engineExhaustGasCheckedAndAdjustedAtMaxLoad.value =
        payload.task?.engineExhaustGasAdjusted ?? 'YES';
    documentFinalSetPointExhaustGasOxygenOrCOLevels.text =
        payload.task?.documentFinalSetPoints ?? '';
    documentFinalManifoldPressureAndRPM.text =
        payload.task?.documentFinalManifoldPressure ?? '';

// Engine Deficiencies for Future Repairs
    engineDeficienciesRadio.value =
        payload.task?.engineDeficienciesRepairedFuture ?? 'NO';
    engineDeficienciesTextfield.text =
        payload.task?.engineDeficienciesDescribed ?? '';

// Parts Ordering Status
    partsOrderingStatus.value = payload.task?.partRepairedOrder ?? 'NO';
    payload.parts?.forEach((element) {
      partsList.add(element);
    });
    // partName.text = payload.parts?[0].name ?? '';
    // partDescription.text = payload.parts?[0].description ?? '';
    // partQuantity.text = payload.parts?[0].quantity.toString() ?? '0';
    // partVendor.text = payload.parts?[0].vendor ?? '';
  }

  //-----------------------------------------------------------------------//
  void setActivePage(int index) {
    activePageIndex.value = index;
  }

  // void toggleCheckbox(String value, RxList<String> list) {
  //   if (list.contains(value)) {
  //     list.remove(value);
  //   } else {
  //     list.add(value);
  //   }
  //   update();
  // }

  void nextPage() {
    if (activePageIndex.value < 3) {
      activePageIndex.value++;
    }
  }

  void previousPage() {
    if (activePageIndex.value > 0) {
      activePageIndex.value--;
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
      confirmText: 'Select Date',
      // keyboardType: TextInputType.numberWithOptions(),
      lastDate: DateTime(2101),
      helpText: 'Select the Date',
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      taskSelectedDate.value = formattedDate;
      // print(formattedDate); // Output: 2024-05-06
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      orientation: Orientation.portrait,
      initialTime: TimeOfDay.now(),
      confirmText: 'Select Time',
      helpText: 'Select the Time',
    );
    if (pickedTime != null) {
      String formattedTime =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      taskSelectedTime.value =
          formattedTime; // Assign the formatted time to Rx variable
    }
  }

  void scrollDown() {
    if (scrollController.hasClients) {
      scrollController.animateTo(0x7fffffff,
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  //Page1
  TextEditingController taskName = TextEditingController();
  TextEditingController clientEmail = TextEditingController();
  TextEditingController selectedAddress = TextEditingController();
  RxString selectedAddressLatitude = ''.obs;
  RxString selectedAddressLongitude = ''.obs;
  TextEditingController setUnits = TextEditingController();
  TextEditingController unitHours = TextEditingController();
  late Rx<String> taskSelectedDate;
  late Rx<String> taskSelectedTime;
  RxString engineBrandId = ''.obs;
  RxString engineBrandName = ''.obs;
  TextEditingController nameOfJourneyMan = TextEditingController();
  RxString unitOnlineOnArrival = 'NO'.obs;
  TextEditingController jobScope = TextEditingController();
  TextEditingController operationalProblems = TextEditingController();
  TextEditingController modelNumber = TextEditingController();
  TextEditingController serialNumber = TextEditingController();
  TextEditingController arrangementNumber = TextEditingController();
  RxString oilSamplesTaken = 'NO'.obs;

  //-----------------------------------------------------------------------//

  //Page2
  //Engine Load Factor
  TextEditingController engineLoad = TextEditingController();
  TextEditingController engineRPM = TextEditingController();
  TextEditingController ignitionTiming = TextEditingController();

  //Exhaust Gas Sample
  var exhaustGasSampleFound = <String>[].obs; //Checkbox
  TextEditingController leftBankFound = TextEditingController();
  TextEditingController rightBankFound = TextEditingController();
  var exhaustGasSampleAdjusted = <String>[].obs; //Checkbox
  TextEditingController leftBankAdjusted = TextEditingController();
  TextEditingController rightBankAdjusted = TextEditingController();

  //Fuel Quality
  TextEditingController btuValue = TextEditingController();
  RxString selectedBtuValue = 'C'.obs; //RadioButton
  //Cylinder Exhaust Pyrometer
  final List cylinderExhaustPyrometerTemperatureCtrl =
      <TextEditingController>[];

  // TextEditingController cylinderExhaustPyrometerTemperature1 =
  //     TextEditingController();
  // TextEditingController cylinderExhaustPyrometerTemperature2 =
  //     TextEditingController();
  // TextEditingController cylinderExhaustPyrometerTemperature3 =
  //     TextEditingController();
  // TextEditingController cylinderExhaustPyrometerTemperature4 =
  //     TextEditingController();
  // TextEditingController cylinderExhaustPyrometerTemperature5 =
  //     TextEditingController();
  // TextEditingController cylinderExhaustPyrometerTemperature6 =
  //     TextEditingController();
  // TextEditingController cylinderExhaustPyrometerTemperature7 =
  //     TextEditingController();
  // TextEditingController cylinderExhaustPyrometerTemperature8 =
  //     TextEditingController();
  // TextEditingController cylinderExhaustPyrometerTemperature9 =
  //     TextEditingController();
  // TextEditingController cylinderExhaustPyrometerTemperature10 =
  //     TextEditingController();
  // TextEditingController cylinderExhaustPyrometerTemperature11 =
  //     TextEditingController();
  // TextEditingController cylinderExhaustPyrometerTemperature12 =
  //     TextEditingController();
  // TextEditingController cylinderExhaustPyrometerTemperature13 =
  //     TextEditingController();
  // TextEditingController cylinderExhaustPyrometerTemperature14 =
  //     TextEditingController();
  // TextEditingController cylinderExhaustPyrometerTemperature15 =
  //     TextEditingController();
  // TextEditingController cylinderExhaustPyrometerTemperature16 =
  //     TextEditingController();

  //Turbo Temperatures
  RxString lbTurboIn = 'C'.obs; //RadioButton
  TextEditingController lbTurboInTemp = TextEditingController();
  RxString rbTurboIn = 'C'.obs; //RadioButton
  TextEditingController rbTurboInTemp = TextEditingController();

  //
  RxString lbTurboOut = 'C'.obs; //RadioButton
  TextEditingController lbTurboOutTemp = TextEditingController();
  RxString rbTurboOut = 'C'.obs; //RadioButton
  TextEditingController rbTurboOutTemp = TextEditingController();

  //MissFireDetected
  RxString missFireDetected = 'NO'.obs; //RadioButton

  //BurnTimes
  final List burnTemperatureCtrl = <TextEditingController>[];

  // TextEditingController burnTemperature1 = TextEditingController();
  // TextEditingController burnTemperature2 = TextEditingController();
  // TextEditingController burnTemperature3 = TextEditingController();
  // TextEditingController burnTemperature4 = TextEditingController();
  // TextEditingController burnTemperature5 = TextEditingController();
  // TextEditingController burnTemperature6 = TextEditingController();
  // TextEditingController burnTemperature7 = TextEditingController();
  // TextEditingController burnTemperature8 = TextEditingController();
  // TextEditingController burnTemperature9 = TextEditingController();
  // TextEditingController burnTemperature10 = TextEditingController();
  // TextEditingController burnTemperature11 = TextEditingController();
  // TextEditingController burnTemperature12 = TextEditingController();
  // TextEditingController burnTemperature13 = TextEditingController();
  // TextEditingController burnTemperature14 = TextEditingController();
  // TextEditingController burnTemperature15 = TextEditingController();
  // TextEditingController burnTemperature16 = TextEditingController();

  //Throttle  & Fuel Value Position
  TextEditingController throttleActuatorPosition = TextEditingController();
  TextEditingController fuelValue = TextEditingController();

  //Engine Oil
  TextEditingController engineOilPressure = TextEditingController();
  RxString oilPressureDifferential = 'NA'.obs; //RadioButton
  TextEditingController oilPressureDifferentialTextField =
      TextEditingController();
  TextEditingController oilTemperatureIn = TextEditingController();
  TextEditingController oilTemperatureOut = TextEditingController();
  RxString oilLevelEngine = 'LOW'.obs; //RadioButton

  //Engine Coolent
  TextEditingController engineCoolantPressure = TextEditingController();
  RxString engineCoolantPressureRadioValue = 'PSI'.obs; //RadioButton
  RxString jacketWaterLevel = 'LOW'.obs; //RadioButton

  //Auxiliary Coolant
  RxString auxiliaryCoolantlevel1 = 'LOW'.obs; //RadioButton

  //JacketWaterTemperatures
  TextEditingController jacketWaterTemperaturesIn = TextEditingController();
  TextEditingController jacketWaterTemperaturesOut = TextEditingController();
  TextEditingController auxCoolantTemperaturesIn = TextEditingController();
  TextEditingController auxCoolantTemperaturesOut = TextEditingController();

  //Air Intakes
  TextEditingController inletAirTemp = TextEditingController();
  RxString inletAirTempRadio = 'C'.obs; //RadioButton
  TextEditingController inletAirPressure = TextEditingController();
  RxString inletAirPressureRadio = 'PSI'.obs; //RadioButton
  TextEditingController primaryFuelPressure = TextEditingController();

  //Air/Fuel Ratio & Crankcase Pressure
  TextEditingController actualAirToFuelRatio = TextEditingController();
  TextEditingController crankcasePressure = TextEditingController();
  TextEditingController airFilterRestriction = TextEditingController();
  RxString airFilterRestrictionRadio = 'RB'.obs; //RadioButton
  RxString hydraulicOil = 'LOW'.obs; //RadioButton

  //Leaks Found
  RxString isLeakageFound = 'NO'.obs; //RadioButton
  RxBool hasOilLeakage = false.obs;
  TextEditingController oilDescription = TextEditingController();
  RxBool hasCoolantLeakage = false.obs;
  TextEditingController coolantDescription = TextEditingController();
  RxBool hasGasLeakage = false.obs;
  TextEditingController gasDescription = TextEditingController();
  RxBool hasExhaustGasLeakage = false.obs;
  TextEditingController exhaustDescription = TextEditingController();
  RxBool hasAirLeakage = false.obs;
  TextEditingController airDescription = TextEditingController();

  //Excessive vibration & odd noises
  RxString excessiveVibrationAndOddNoises = 'NO'.obs; //RadioButton
  TextEditingController excessiveVibrationAndOddNoisesDescription =
      TextEditingController();

  //Problems with Driver
  RxString problemsWithDriver = 'NO'.obs; //RadioButton
  TextEditingController problemsWithDriverDescription = TextEditingController();

  //-----------------------------------------------------------------------//

  //Page3

  // Hot Compression Test
  final List hotCompressionTemperatureCtrl = <TextEditingController>[];

  // TextEditingController hotCompressionTemperature1 = TextEditingController();
  // TextEditingController hotCompressionTemperature2 = TextEditingController();
  // TextEditingController hotCompressionTemperature3 = TextEditingController();
  // TextEditingController hotCompressionTemperature4 = TextEditingController();
  // TextEditingController hotCompressionTemperature5 = TextEditingController();
  // TextEditingController hotCompressionTemperature6 = TextEditingController();
  // TextEditingController hotCompressionTemperature7 = TextEditingController();
  // TextEditingController hotCompressionTemperature8 = TextEditingController();
  // TextEditingController hotCompressionTemperature9 = TextEditingController();
  // TextEditingController hotCompressionTemperature10 = TextEditingController();
  // TextEditingController hotCompressionTemperature11 = TextEditingController();
  // TextEditingController hotCompressionTemperature12 = TextEditingController();
  // TextEditingController hotCompressionTemperature13 = TextEditingController();
  // TextEditingController hotCompressionTemperature14 = TextEditingController();
  // TextEditingController hotCompressionTemperature15 = TextEditingController();
  // TextEditingController hotCompressionTemperature16 = TextEditingController();

  //Value Set
  TextEditingController intakeValueSet = TextEditingController();
  RxString intakeValueSetRadioValue = 'HYDRAULIC'.obs; //RadioButton
  TextEditingController exhaustValueSet = TextEditingController();
  RxString exhaustValueSetRadioValue = 'HYDRAULIC'.obs; //RadioButton
  RxString majorValueRecessionDetected = 'NO'.obs; //RadioButton
  RxString boroscopeRecommended = 'NO'.obs; //RadioButton
  RxString boroscopeInspectionCompleted = 'NO'.obs; //RadioButton

  //Sparkplugs
  RxString installNewSparkplugs = 'NO'.obs; //RadioButton
  TextEditingController sparkplugGap = TextEditingController();
  RxString sparkplugExtensionInstalled = 'NO'.obs; //RadioButton
  RxString newExtensionInstalled = 'NA'.obs; //RadioButton
  TextEditingController listOfNewExtensionInstalled = TextEditingController();
  RxString sparkplugWireCondition = 'POOR'.obs; //RadioButton
  TextEditingController listOfSparkplugWireCondition = TextEditingController();

  //Connections
  RxString cannonPlugConnectorsTight = 'NO'.obs; //RadioButton
  TextEditingController listOfTransformerCoilsReplaced =
      TextEditingController();

  //Crankcase
  RxString crankcaseBreatherInspection = 'NA'.obs; //RadioButton
  RxString newBreatherElementInstalled = 'NA'.obs; //RadioButton

  // Belts and Coolers
  RxString checkAllCanonFan = 'NA'.obs; //RadioButton
  TextEditingController listOfCheckAllCoolerFan = TextEditingController();

  // Coolant System Check
  RxString coolantSystemCheck = 'NA'.obs; //RadioButton

  // Lubrication System Check
  RxString lubricationSystemCheck = 'NO'.obs; //RadioButton

  //Cooling System Check
  RxString coolingSystemCheck = 'NO'.obs; //RadioButton

  //Fuel System Inspection
  RxString checkFuelGasFilter = 'YES'.obs; //RadioButton
  RxString fuelGasFilterFound = 'DRY'.obs; //RadioButton

  //Air Filter Inspection
  RxString airFilterInspection = 'YES'.obs; //RadioButton

  //Turbocharger Inspection
  RxString turboChargerInspection = 'YES'.obs; //RadioButton

  //Carburetor and Fuel Injection Inspection
  RxString carburetorInternalCleaningInspection = 'YES'.obs; //RadioButton

  //Engine Oil Maintenance
  RxString engineOilFilterChange = 'YES'.obs; //RadioButton
  RxString engineOilFilterChange2 = 'CLEAN'.obs; //RadioButton
  RxString oilCoolerDrained = 'YES'.obs; //RadioButton

  //Hydraulic System Check
  RxString hydraulicOilFilterChange = 'YES'.obs; //RadioButton
  RxString hydraulicOilNew = 'YES'.obs; //RadioButton

  //Miscellaneous Checks
  RxString engineOilSystemPrimed = 'YES'.obs; //RadioButton
  RxString oilDrainIsolationValvesShutIn = 'YES'.obs; //RadioButton
  RxString dayTankFiltersInstalledNew = 'YES'.obs; //RadioButton
  RxString dayTankValvesOpen = 'YES'.obs; //RadioButton

//-----------------------------------------------------------------------//

  //Page4

  //   Oil Pressure and Level Check
  RxString oilPressureEngineAndGood = 'YES'.obs; //RadioButton
  RxString engineOilLevel = 'LOW'.obs; //RadioButton

  //   Coolant System Check
  RxString jacketWaterCoolantLevel = 'LOW'.obs; //RadioButton
  RxString auxiliaryCoolantLevel2 = 'LOW'.obs; //RadioButton

  //   Temperature and Pressure Check
  RxString allTempsAndPressuresStableAndNormalRanges = 'YES'.obs; //RadioButton

  //   Noise and Vibration Check
  RxString noisesOrVibrationsDetected = 'YES'.obs; //RadioButton

  //   Exhaust Gas and Manifold Pressure
  RxString engineExhaustGasCheckedAndAdjustedAtMaxLoad =
      'YES'.obs; //RadioButton
  TextEditingController documentFinalSetPointExhaustGasOxygenOrCOLevels =
      TextEditingController();
  TextEditingController documentFinalManifoldPressureAndRPM =
      TextEditingController();

  //   Engine Deficiencies for Future Repairs
  RxString engineDeficienciesRadio = 'NO'.obs; //RadioButton
  TextEditingController engineDeficienciesTextfield = TextEditingController();

  //   Parts Ordering Status
  RxString partsOrderingStatus = 'NO'.obs; //RadioButton

  //   Add Parts in Table
  TextEditingController partName = TextEditingController();
  TextEditingController partDescription = TextEditingController();
  TextEditingController partQuantity = TextEditingController();
  TextEditingController partVendor = TextEditingController();

// @override
// void onClose() {
//   debugPrint('AddTaskControllerDisposeCalled');
//   scrollController.dispose();
//   mapController.dispose();
//   //Page1
//   selectedAddress.dispose();
//   setUnits.dispose();
//   unitHours.dispose();
//   nameOfJourneyMan.dispose();
//   unitOnlineOnArrival.value = '';
//   jobScope.dispose();
//   operationalProblems.dispose();
//   modelNumber.dispose();
//   serialNumber.dispose();
//   arrangementNumber.dispose();
//   oilSamplesTaken.value = '';
//   //Page2
//   engineLoad.dispose();
//   engineRPM.dispose();
//   ignitionTiming.dispose();
//   exhaustGasSampleFound.value = [];
//   leftBankFound.dispose();
//   rightBankFound.dispose();
//   exhaustGasSampleAdjusted.value = [];
//   leftBankAdjusted.dispose();
//   rightBankAdjusted.dispose();
//   btuValue.dispose();
//   selectedBtuValue.value = '';
//   cylinderExhaustPyrometerTemperature1.dispose();
//   cylinderExhaustPyrometerTemperature2.dispose();
//   cylinderExhaustPyrometerTemperature3.dispose();
//   cylinderExhaustPyrometerTemperature4.dispose();
//   cylinderExhaustPyrometerTemperature5.dispose();
//   cylinderExhaustPyrometerTemperature6.dispose();
//   cylinderExhaustPyrometerTemperature7.dispose();
//   cylinderExhaustPyrometerTemperature8.dispose();
//   cylinderExhaustPyrometerTemperature9.dispose();
//   cylinderExhaustPyrometerTemperature10.dispose();
//   cylinderExhaustPyrometerTemperature11.dispose();
//   cylinderExhaustPyrometerTemperature12.dispose();
//   cylinderExhaustPyrometerTemperature13.dispose();
//   cylinderExhaustPyrometerTemperature14.dispose();
//   cylinderExhaustPyrometerTemperature15.dispose();
//   cylinderExhaustPyrometerTemperature16.dispose();
//   lbTurboIn.value = '';
//   rbTurboIn.value = '';
//   lbTurboOut.value = '';
//   rbTurboOut.value = '';
//   lbTurboInTemp.dispose();
//   rbTurboInTemp.dispose();
//   lbTurboOutTemp.dispose();
//   rbTurboOutTemp.dispose();
//   missFireDetected.value = '';
//   burnTemperature1.dispose();
//   burnTemperature2.dispose();
//   burnTemperature3.dispose();
//   burnTemperature4.dispose();
//   burnTemperature5.dispose();
//   burnTemperature6.dispose();
//   burnTemperature7.dispose();
//   burnTemperature8.dispose();
//   burnTemperature9.dispose();
//   burnTemperature10.dispose();
//   burnTemperature11.dispose();
//   burnTemperature12.dispose();
//   burnTemperature13.dispose();
//   burnTemperature14.dispose();
//   burnTemperature15.dispose();
//   burnTemperature16.dispose();
//   throttleActuatorPosition.dispose();
//   fuelValue.dispose();
//   engineOilPressure.dispose();
//   oilPressureDifferential.value = '';
//   oilPressureDifferentialTextField.dispose();
//   oilTemperatureIn.dispose();
//   oilTemperatureOut.dispose();
//   oilLevelEngine.value = '';
//   engineCoolantPressure.dispose();
//   engineCoolantPressureRadioValue.value = '';
//   jacketWaterLevel.value = '';
//   auxiliaryCoolantlevel1.value = '';
//   jacketWaterTemperaturesIn.dispose();
//   jacketWaterTemperaturesOut.dispose();
//   auxCoolantTemperaturesIn.dispose();
//   auxCoolantTemperaturesOut.dispose();
//   inletAirTemp.dispose();
//   inletAirTempRadio.value = '';
//   inletAirPressure.dispose();
//   inletAirPressureRadio.value = '';
//   primaryFuelPressure.dispose();
//   actualAirToFuelRatio.dispose();
//   crankcasePressure.dispose();
//   airFilterRestriction.dispose();
//   airFilterRestrictionRadio.value = '';
//   hydraulicOil.value = '';
//   leaksFound.value = '';
//   hasOilLeakage.value = false;
//   oilDescription.dispose();
//   hasCoolantLeakage.value = false;
//   coolantDescription.dispose();
//   hasGasLeakage.value = false;
//   gasDescription.dispose();
//   hasExhaustGasLeakage.value = false;
//   exhaustDescription.dispose();
//   hasAirLeakage.value = false;
//   airDescription.dispose();
//   excessiveVibrationAndOddNoises.value = 'no';
//   excessiveVibrationAndOddNoisesDescription.dispose();
//   problemsWithDriver.value = 'no';
//   problemsWithDriverDescription.dispose();
//   //Page3
//   hotCompressionTemperature1.dispose();
//   hotCompressionTemperature2.dispose();
//   hotCompressionTemperature3.dispose();
//   hotCompressionTemperature4.dispose();
//   hotCompressionTemperature5.dispose();
//   hotCompressionTemperature6.dispose();
//   hotCompressionTemperature7.dispose();
//   hotCompressionTemperature8.dispose();
//   hotCompressionTemperature9.dispose();
//   hotCompressionTemperature10.dispose();
//   hotCompressionTemperature11.dispose();
//   hotCompressionTemperature12.dispose();
//   hotCompressionTemperature13.dispose();
//   hotCompressionTemperature14.dispose();
//   hotCompressionTemperature15.dispose();
//   hotCompressionTemperature16.dispose();
//   intakeValueSet.dispose();
//   intakeValueSetRadioValue.value = '';
//   exhaustValueSet.dispose();
//   exhaustValueSetRadioValue.value = '';
//   majorValueRecessionDetected.value = '';
//   boroscopeRecommended.value = '';
//   boroscopeInspectionCompleted.value = '';
//   installNewSparkplugs.value = '';
//   sparkplugGap.dispose();
//   sparkplugExtensionInstalled.value = '';
//   newExtensionInstalled.value = '';
//   listOfNewExtensionInstalled.dispose();
//   sparkplugWireCondition.value = '';
//   listOfSparkplugWireCondition.dispose();
//   cannonPlugConnectorsTight.value = '';
//   listOfTransformerCoilsReplaced.dispose();
//   //------------------------
//   crankcaseBreatherInspection.value = '';
//   newBreatherElementInstalled.value = '';
//   checkAllCanonFan.value = '';
//   listOfCheckAllCoolerFan.dispose();
//   coolantSystemCheck.value = '';
//   lubricationSystemCheck.value = '';
//   coolingSystemCheck.value = '';
//   checkFuelGasFilter.value = '';
//   fuelGasFilterFound.value = '';
//   airFilterInspection.value = '';
//   turboChargerInspection.value = '';
//   carburetorInternalCleaningInspection.value = '';
//   engineOilFilterChange.value = '';
//   engineOilFilterChange2.value = '';
//   oilCoolerDrained.value = '';
//   hydraulicOilFilterChange.value = '';
//   hydraulicOilNew.value = '';
//   engineOilSystemPrimed.value = '';
//   oilDrainIsolationValvesShutIn.value = '';
//   dayTankFiltersInstalledNew.value = '';
//   dayTankValvesOpen.value = '';
//   //Page4
//   oilPressureEngineAndGood.value = '';
//   engineOilLevel.value = '';
//   jacketWaterCoolantLevel.value = '';
//   auxiliaryCoolantLevel2.value = '';
//   allTempsAndPressuresStableAndNormalRanges.value = '';
//   noisesOrVibrationsDetected.value = '';
//   engineExhaustGasCheckedAndAdjustedAtMaxLoad.value = '';
//   documentFinalSetPointExhaustGasOxygenOrCOLevels.dispose();
//   documentFinalManifoldPressureAndRPM.dispose();
//   engineDeficienciesRadio.value = 'no';
//   engineDeficienciesTextfield.dispose();
//   partsOrderingStatus.value = '';
//   partName.dispose();
//   partDescription.dispose();
//   partQuantity.dispose();
//   partVendor.dispose();
//   super.onClose();
// }
}

//double _previousScrollPosition = 0.0;

// to change the color of appbar icons and title when scroll down.
// void onInit() {
//   super.onInit();
//   scrollController.addListener(() {
//     double currentScrollPosition = scrollController.position.pixels;
//     if (currentScrollPosition > _previousScrollPosition) {
//       // Scrolling down
//       isScrolledUp.value = false;
//     } else {
//       // Scrolling up
//       isScrolledUp.value = true;
//     }
//     _previousScrollPosition = currentScrollPosition;
//   });
// }
