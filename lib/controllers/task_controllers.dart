import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/googlemap_controller.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/models/single_part_model.dart';
import 'package:mechanix/models/task_model.dart';

class AddTaskController extends GetxController {
  List<SinglePartModel> partsList = <SinglePartModel>[].obs; //List of Parts
  var activePageIndex = 0.obs;
  final ScrollController scrollController = ScrollController();

  final UniversalController controller = Get.find();
  final MapController mapController = Get.find();

  @override
  void onInit() {
    selectedAddress.text = mapController.selectedAddress.value;
    taskSelectedDate = DateTime.now().obs;
    taskSelectedTime = TimeOfDay.now().obs;
    // pyrometerTemperatureControllers.add(TextEditingController());
    // pyrometerTemperatureControllers.add(TextEditingController());
    // burnTemperatureControllers.add(TextEditingController());
    // burnTemperatureControllers.add(TextEditingController());
    // hotCompressionTemperatureControllers.add(TextEditingController());
    // hotCompressionTemperatureControllers.add(TextEditingController());
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void addTask() {
    TaskModel newTask = TaskModel(
      //Page1
      selectedAddress: selectedAddress.text,
      // location: selectedAddress.text.trim(),
      setUnits: double.tryParse(setUnits.text.trim()),
      unitHours: double.tryParse(unitHours.text.trim()),
      selectedDate: taskSelectedDate.value,
      selectedTime: taskSelectedTime.value,
      nameOfJourneyMan: nameOfJourneyMan.text.trim(),
      unitOnlineOnArrival: unitOnlineOnArrival.value,
      jobScope: jobScope.text.trim(),
      operationalProblems: operationalProblems.text.trim(),
      engineBrand: engineBrand.value,
      modelNumber: double.tryParse(modelNumber.text.trim()),
      serialNumber: double.tryParse(serialNumber.text.trim()),
      arrangementNumber: double.tryParse(arrangementNumber.text.trim()),
      oilSamplesTaken: oilSamplesTaken.value,

      //Page2
      engineLoad: double.tryParse(engineLoad.text.trim()),
      engineRPM: double.tryParse(engineRPM.text.trim()),
      ignitionTiming: double.tryParse(ignitionTiming.text.trim()),
      exhaustGasSampleFound: exhaustGasSampleFound,
      leftBankFound: double.tryParse(leftBankFound.text.trim()),
      rightBankFound: double.tryParse(rightBankFound.text.trim()),
      exhaustGasSampleAdjusted: exhaustGasSampleAdjusted,
      leftBankAdjusted: double.tryParse(leftBankAdjusted.text.trim()),
      rightBankAdjusted: double.tryParse(rightBankAdjusted.text.trim()),
      btuValue: double.tryParse(btuValue.text.trim()),
      selectedBtuValue: selectedBtuValue.value,
      // cylinderExhaustPyrometerTemperatures: pyrometerTemperatureControllers,
      lbTurboIn: lbTurboIn.value,
      lbTurboInTemp: double.tryParse(lbTurboInTemp.text.trim()),
      rbTurboIn: rbTurboIn.value,
      rbTurboInTemp: double.tryParse(rbTurboInTemp.text.trim()),
      lbTurboOut: lbTurboOut.value,
      lbTurboOutTemp: double.tryParse(lbTurboOutTemp.text.trim()),
      rbTurboOut: rbTurboOut.value,
      rbTurboOutTemp: double.tryParse(rbTurboOutTemp.text.trim()),
      missFireDetected: missFireDetected.value,
      // burnTemperatures:double.tryParse(btuValue.text.trim()),
      throttleActuatorPosition:
          double.tryParse(throttleActuatorPosition.text.trim()),
      fuelValue: double.tryParse(fuelValue.text.trim()),
      engineOilPressure: double.tryParse(engineOilPressure.text.trim()),
      oilPressureDifferential: double.tryParse(oilPressureDifferential.value),
      oilPressureDifferentialTextField:
          oilPressureDifferentialTextField.text.trim(),
      oilTemperatureIn: double.tryParse(oilTemperatureIn.text.trim()),
      oilTemperatureOut: double.tryParse(oilTemperatureOut.text.trim()),
      oilLevelEngine: oilLevelEngine.value,
      engineCoolantPressure: double.tryParse(engineCoolantPressure.text.trim()),
      engineCoolantPressureRadioValue: engineCoolantPressureRadioValue.value,
      jacketWaterLevel: jacketWaterLevel.value,
      auxiliaryCoolantLevel1: auxiliaryCoolantlevel1.value,
      jacketWaterTemperaturesIn:
          double.tryParse(jacketWaterTemperaturesIn.text.trim()),
      jacketWaterTemperaturesOut:
          double.tryParse(jacketWaterTemperaturesOut.text.trim()),
      auxCoolantTemperaturesIn:
          double.tryParse(auxCoolantTemperaturesIn.text.trim()),
      auxCoolantTemperaturesOut:
          double.tryParse(auxCoolantTemperaturesOut.text.trim()),
      inletAirTemp: double.tryParse(inletAirTemp.text.trim()),
      inletAirTempRadio: inletAirTempRadio.value,
      inletAirPressure: double.tryParse(inletAirPressure.text.trim()),
      inletAirPressureRadio: inletAirPressureRadio.value,
      primaryFuelPressure: double.tryParse(primaryFuelPressure.text.trim()),
      actualAirToFuelRatio: double.tryParse(actualAirToFuelRatio.text.trim()),
      crankcasePressure: double.tryParse(crankcasePressure.text.trim()),
      airFilterRestriction: double.tryParse(airFilterRestriction.text.trim()),
      airFilterRestrictionRadio: airFilterRestrictionRadio.value,
      hydraulicOil: hydraulicOil.value,
      leaksFound: leaksFound.value,
      isOilSelected: isOilSelected.value,
      oilDescription: oilDescription.text.trim(),
      isCoolantSelected: isCoolantSelected.value,
      coolantDescription: coolantDescription.text.trim(),
      isGasSelected: isGasSelected.value,
      gasDescription: gasDescription.text.trim(),
      isExhaustSelected: isExhaustSelected.value,
      exhaustDescription: exhaustDescription.text.trim(),
      isAirSelected: isAirSelected.value,
      airDescription: airDescription.text.trim(),
      excessiveVibrationAndOddNoises: excessiveVibrationAndOddNoises.value,
      excessiveVibrationAndOddNoisesDescription:
          excessiveVibrationAndOddNoisesDescription.text.trim(),
      problemsWithDriver: problemsWithDriver.value,
      problemsWithDriverDescription: problemsWithDriverDescription.text.trim(),

      //Page3
      //   List<double>? hotCompressionTemperatures:
      intakeValueSet: double.tryParse(intakeValueSet.text.trim()),
      intakeValueSetRadioValue: intakeValueSetRadioValue.value,
      exhaustValueSet: double.tryParse(exhaustValueSet.text.trim()),
      exhaustValueSetRadioValue: exhaustValueSetRadioValue.value,
      majorValueRecessionDetected: majorValueRecessionDetected.value,
      boroscopeRecommended: boroscopeRecommended.value,
      boroscopeInspectionCompleted: boroscopeInspectionCompleted.value,
      installNewWires: installNewWires.value,
      sparkplugGap: double.tryParse(sparkplugGap.text.trim()),
      sparkplugExtensionInstalled: sparkplugExtensionInstalled.value,
      newExtensionInstalled: newExtensionInstalled.value,
      listOfNewExtensionInstalled: listOfNewExtensionInstalled.text.trim(),
      sparkplugWireCondition: sparkplugWireCondition.value,
      listOfSparkplugWireCondition: listOfSparkplugWireCondition.text.trim(),
      cannonPlugConnectorsTight: cannonPlugConnectorsTight.value,
      listOfTransformerCoilsReplaced:
          listOfTransformerCoilsReplaced.text.trim(),
      crankcaseBreatherInspection: crankcaseBreatherInspection.value,
      newBreatherElementInstalled: newBreatherElementInstalled.value,
      checkAllCanonFan: checkAllCanonFan.value,
      listOfCheckAllCanonFan: listOfCheckAllCanonFan.text.trim(),
      coolantSystemCheck: coolantSystemCheck.value,
      lubricationSystemCheck: lubricationSystemCheck.value,
      coolingSystemCheck: coolingSystemCheck.value,
      checkFuelGasFilter: checkFuelGasFilter.value,
      fuelGasFilterFound: fuelGasFilterFound.value,
      airFilterInspection: airFilterInspection.value,
      turboChargerInspection: turboChargerInspection.value,
      carburetorInternalCleaningInspection:
          carburetorInternalCleaningInspection.value,
      engineOilFilterChange: engineOilFilterChange.value,
      engineOilFilterChange2: engineOilFilterChange2.value,
      oilCoolerDrained: oilCoolerDrained.value,
      hydraulicOilFilterChange: hydraulicOilFilterChange.value,
      hydraulicOilNew: hydraulicOilNew.value,
      engineOilSystemPrimed: engineOilSystemPrimed.value,
      oilDrainIsolationValvesShutIn: oilDrainIsolationValvesShutIn.value,
      dayTankFiltersInstalledNew: dayTankFiltersInstalledNew.value,
      dayTankValvesOpen: dayTankValvesOpen.value,

      //Page4
      oilPressureEngineAndGood: oilPressureEngineAndGood.value,
      engineOilLevel: engineOilLevel.value,
      jacketWaterCoolantLevel: jacketWaterCoolantLevel.value,
      auxiliaryCoolantLevel2: auxiliaryCoolantLevel2.value,
      allTempsAndPressuresStableAndNormalRanges:
          allTempsAndPressuresStableAndNormalRanges.value,
      noisesOrVibrationsDetected: noisesOrVibrationsDetected.value,
      engineExhaustGasCheckedAndAdjustedAtMaxLoad:
          engineExhaustGasCheckedAndAdjustedAtMaxLoad.value,
      documentFinalSetPointExhaustGasOxygenOrCOLevels:
          documentFinalSetPointExhaustGasOxygenOrCOLevels.text.trim(),
      documentFinalManifoldPressureAndRPM:
          documentFinalManifoldPressureAndRPM.text.trim(),
      engineDeficienciesRadio: engineDeficienciesRadio.value,
      engineDeficienciesTextfield: engineDeficienciesTextfield.text.trim(),
      partsOrderingStatus: partsOrderingStatus.value,
      partsList: partsList,
    );
    controller.tasks.add(newTask);
    debugPrint(controller.tasks.first.setUnits.toString());
    debugPrint(controller.tasks.first.unitHours.toString());
  }

  //-----------------------------------------------------------------------//

  //Page1

  // RxString? selectedAddress = RxString('');
  TextEditingController selectedAddress = TextEditingController();
  TextEditingController setUnits = TextEditingController();
  TextEditingController unitHours = TextEditingController();
  late Rx<DateTime> taskSelectedDate;
  late Rx<TimeOfDay> taskSelectedTime;
  RxString engineBrand = ''.obs;
  TextEditingController nameOfJourneyMan = TextEditingController();
  RxString unitOnlineOnArrival = ''.obs;
  TextEditingController jobScope = TextEditingController();
  TextEditingController operationalProblems = TextEditingController();

  TextEditingController modelNumber = TextEditingController();
  TextEditingController serialNumber = TextEditingController();
  TextEditingController arrangementNumber = TextEditingController();
  RxString oilSamplesTaken = ''.obs;
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
  RxString selectedBtuValue = ''.obs; //RadioButton

  //Cylinder Exhaust Pyrometer
  // List<TextEditingController> pyrometerTemperatureControllers =
  //     <TextEditingController>[].obs;

  TextEditingController cylinderExhaustPyrometerTemperature1 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature2 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature3 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature4 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature5 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature6 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature7 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature8 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature9 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature10 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature11 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature12 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature13 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature14 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature15 =
      TextEditingController();
  TextEditingController cylinderExhaustPyrometerTemperature16 =
      TextEditingController();

  //Turbo Temperatures
  RxString lbTurboIn = ''.obs; //RadioButton
  TextEditingController lbTurboInTemp = TextEditingController();
  RxString rbTurboIn = ''.obs; //RadioButton
  TextEditingController rbTurboInTemp = TextEditingController();
  RxString lbTurboOut = ''.obs; //RadioButton
  TextEditingController lbTurboOutTemp = TextEditingController();
  RxString rbTurboOut = ''.obs; //RadioButton
  TextEditingController rbTurboOutTemp = TextEditingController();

  //MissFireDetected
  RxString missFireDetected = ''.obs; //RadioButton

  //BurnTimes
  // List<TextEditingController> burnTemperatureControllers =
  //     <TextEditingController>[].obs;

  TextEditingController burnTemperature1 = TextEditingController();
  TextEditingController burnTemperature2 = TextEditingController();
  TextEditingController burnTemperature3 = TextEditingController();
  TextEditingController burnTemperature4 = TextEditingController();
  TextEditingController burnTemperature5 = TextEditingController();
  TextEditingController burnTemperature6 = TextEditingController();
  TextEditingController burnTemperature7 = TextEditingController();
  TextEditingController burnTemperature8 = TextEditingController();
  TextEditingController burnTemperature9 = TextEditingController();
  TextEditingController burnTemperature10 = TextEditingController();
  TextEditingController burnTemperature11 = TextEditingController();
  TextEditingController burnTemperature12 = TextEditingController();
  TextEditingController burnTemperature13 = TextEditingController();
  TextEditingController burnTemperature14 = TextEditingController();
  TextEditingController burnTemperature15 = TextEditingController();
  TextEditingController burnTemperature16 = TextEditingController();

  //Throttle  & Fuel Value Position
  TextEditingController throttleActuatorPosition = TextEditingController();
  TextEditingController fuelValue = TextEditingController();

  //Engine Oil
  TextEditingController engineOilPressure = TextEditingController();
  RxString oilPressureDifferential = ''.obs; //RadioButton
  TextEditingController oilPressureDifferentialTextField =
      TextEditingController();
  TextEditingController oilTemperatureIn = TextEditingController();
  TextEditingController oilTemperatureOut = TextEditingController();
  RxString oilLevelEngine = ''.obs; //RadioButton

  //Engine Coolent
  TextEditingController engineCoolantPressure = TextEditingController();
  RxString engineCoolantPressureRadioValue = ''.obs; //RadioButton
  RxString jacketWaterLevel = ''.obs; //RadioButton

  //Auxiliary Coolant
  RxString auxiliaryCoolantlevel1 = ''.obs; //RadioButton

  //JacketWaterTemperatures
  TextEditingController jacketWaterTemperaturesIn = TextEditingController();
  TextEditingController jacketWaterTemperaturesOut = TextEditingController();
  TextEditingController auxCoolantTemperaturesIn = TextEditingController();
  TextEditingController auxCoolantTemperaturesOut = TextEditingController();

  //Air Intakes
  TextEditingController inletAirTemp = TextEditingController();
  RxString inletAirTempRadio = ''.obs; //RadioButton
  TextEditingController inletAirPressure = TextEditingController();
  RxString inletAirPressureRadio = ''.obs; //RadioButton
  TextEditingController primaryFuelPressure = TextEditingController();

  //Air/Fuel Ratio & Crankcase Pressure
  TextEditingController actualAirToFuelRatio = TextEditingController();
  TextEditingController crankcasePressure = TextEditingController();
  TextEditingController airFilterRestriction = TextEditingController();
  RxString airFilterRestrictionRadio = ''.obs; //RadioButton
  RxString hydraulicOil = ''.obs; //RadioButton

  //Leaks Found
  RxString leaksFound = ''.obs; //RadioButton
  RxBool isOilSelected = false.obs;
  TextEditingController oilDescription = TextEditingController();
  RxBool isCoolantSelected = false.obs;
  TextEditingController coolantDescription = TextEditingController();
  RxBool isGasSelected = false.obs;
  TextEditingController gasDescription = TextEditingController();
  RxBool isExhaustSelected = false.obs;
  TextEditingController exhaustDescription = TextEditingController();
  RxBool isAirSelected = false.obs;
  TextEditingController airDescription = TextEditingController();

  //Excessive vibration & odd noises
  RxString excessiveVibrationAndOddNoises = 'no'.obs; //RadioButton
  TextEditingController excessiveVibrationAndOddNoisesDescription =
      TextEditingController();

  //Problems with Driver
  RxString problemsWithDriver = 'no'.obs; //RadioButton
  TextEditingController problemsWithDriverDescription = TextEditingController();

  //-----------------------------------------------------------------------//

  //Page3

  // Hot Compression Test
  // List<TextEditingController> hotCompressionTemperatureControllers =
  //     <TextEditingController>[].obs;

  TextEditingController hotCompressionTemperature1 = TextEditingController();
  TextEditingController hotCompressionTemperature2 = TextEditingController();
  TextEditingController hotCompressionTemperature3 = TextEditingController();
  TextEditingController hotCompressionTemperature4 = TextEditingController();
  TextEditingController hotCompressionTemperature5 = TextEditingController();
  TextEditingController hotCompressionTemperature6 = TextEditingController();
  TextEditingController hotCompressionTemperature7 = TextEditingController();
  TextEditingController hotCompressionTemperature8 = TextEditingController();
  TextEditingController hotCompressionTemperature9 = TextEditingController();
  TextEditingController hotCompressionTemperature10 = TextEditingController();
  TextEditingController hotCompressionTemperature11 = TextEditingController();
  TextEditingController hotCompressionTemperature12 = TextEditingController();
  TextEditingController hotCompressionTemperature13 = TextEditingController();
  TextEditingController hotCompressionTemperature14 = TextEditingController();
  TextEditingController hotCompressionTemperature15 = TextEditingController();
  TextEditingController hotCompressionTemperature16 = TextEditingController();

  //Value Set
  TextEditingController intakeValueSet = TextEditingController();
  RxString intakeValueSetRadioValue = ''.obs; //RadioButton
  TextEditingController exhaustValueSet = TextEditingController();
  RxString exhaustValueSetRadioValue = ''.obs; //RadioButton
  RxString majorValueRecessionDetected = ''.obs; //RadioButton
  RxString boroscopeRecommended = ''.obs; //RadioButton
  RxString boroscopeInspectionCompleted = ''.obs; //RadioButton

  //Sparkplugs
  RxString installNewWires = ''.obs; //RadioButton
  TextEditingController sparkplugGap = TextEditingController();
  RxString sparkplugExtensionInstalled = ''.obs; //RadioButton
  RxString newExtensionInstalled = ''.obs; //RadioButton
  TextEditingController listOfNewExtensionInstalled = TextEditingController();
  RxString sparkplugWireCondition = ''.obs; //RadioButton
  TextEditingController listOfSparkplugWireCondition = TextEditingController();

  //Connections
  RxString cannonPlugConnectorsTight = ''.obs; //RadioButton
  TextEditingController listOfTransformerCoilsReplaced =
      TextEditingController();

  //Crankcase
  RxString crankcaseBreatherInspection = ''.obs; //RadioButton
  RxString newBreatherElementInstalled = ''.obs; //RadioButton

  // Belts and Coolers
  RxString checkAllCanonFan = ''.obs; //RadioButton
  TextEditingController listOfCheckAllCanonFan = TextEditingController();

  // Coolant System Check
  RxString coolantSystemCheck = ''.obs; //RadioButton

  // Lubrication System Check
  RxString lubricationSystemCheck = ''.obs; //RadioButton

  //Cooling System Check
  RxString coolingSystemCheck = ''.obs; //RadioButton

  //Fuel System Inspection
  RxString checkFuelGasFilter = ''.obs; //RadioButton
  RxString fuelGasFilterFound = ''.obs; //RadioButton

  //Air Filter Inspection
  RxString airFilterInspection = ''.obs; //RadioButton

  //Turbocharger Inspection
  RxString turboChargerInspection = ''.obs; //RadioButton

  //Carburetor and Fuel Injection Inspection
  RxString carburetorInternalCleaningInspection = ''.obs; //RadioButton

  //Engine Oil Maintenance
  RxString engineOilFilterChange = ''.obs; //RadioButton
  RxString engineOilFilterChange2 = ''.obs; //RadioButton
  RxString oilCoolerDrained = ''.obs; //RadioButton

  //Hydraulic System Check
  RxString hydraulicOilFilterChange = ''.obs; //RadioButton
  RxString hydraulicOilNew = ''.obs; //RadioButton

  //Miscellaneous Checks
  RxString engineOilSystemPrimed = ''.obs; //RadioButton
  RxString oilDrainIsolationValvesShutIn = ''.obs; //RadioButton
  RxString dayTankFiltersInstalledNew = ''.obs; //RadioButton
  RxString dayTankValvesOpen = ''.obs; //RadioButton

//-----------------------------------------------------------------------//

  //Page4

  //   Oil Pressure and Level Check
  RxString oilPressureEngineAndGood = ''.obs; //RadioButton
  RxString engineOilLevel = ''.obs; //RadioButton

  //   Coolant System Check
  RxString jacketWaterCoolantLevel = ''.obs; //RadioButton
  RxString auxiliaryCoolantLevel2 = ''.obs; //RadioButton

  //   Temperature and Pressure Check
  RxString allTempsAndPressuresStableAndNormalRanges = ''.obs; //RadioButton

  //   Noise and Vibration Check
  RxString noisesOrVibrationsDetected = ''.obs; //RadioButton

  //   Exhaust Gas and Manifold Pressure
  RxString engineExhaustGasCheckedAndAdjustedAtMaxLoad = ''.obs; //RadioButton
  TextEditingController documentFinalSetPointExhaustGasOxygenOrCOLevels =
      TextEditingController();
  TextEditingController documentFinalManifoldPressureAndRPM =
      TextEditingController();

  //   Engine Deficiencies for Future Repairs
  RxString engineDeficienciesRadio = 'no'.obs; //RadioButton
  TextEditingController engineDeficienciesTextfield = TextEditingController();

  //   Parts Ordering Status
  RxString partsOrderingStatus = ''.obs; //RadioButton

  //   Add Parts in Table
  TextEditingController partName = TextEditingController();
  TextEditingController partDescription = TextEditingController();
  TextEditingController partQuantity = TextEditingController();
  TextEditingController partVendor = TextEditingController();

  void setActivePage(int index) {
    activePageIndex.value = index;
  }

  void toggleCheckbox(String value, RxList<String> list) {
    if (list.contains(value)) {
      list.remove(value);
    } else {
      list.add(value);
    }
    update();
  }

  void nextPage() {
    if (activePageIndex.value < 3) {
      activePageIndex.value++;
      debugPrint(activePageIndex.value.toString());
    }
  }

  void previousPage() {
    if (activePageIndex.value > 0) {
      activePageIndex.value--;
      debugPrint(activePageIndex.value.toString());
    }
  }

  // void nextPage() {
  //   if (activePageIndex.value < 3) {
  //     activePageIndex.value++;
  //     pageController.jumpToPage(activePageIndex.value);
  //     debugPrint(activePageIndex.value.toString());
  //   }
  // }
  //
  // void previousPage() {
  //   if (activePageIndex.value > 0) {
  //     activePageIndex.value--;
  //     pageController.jumpToPage(activePageIndex.value);
  //     debugPrint(activePageIndex.value.toString());
  //   }
  // }

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
    if (pickedDate != null && pickedDate != taskSelectedDate.value) {
      taskSelectedDate.value = pickedDate;
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
    if (pickedTime != null && pickedTime != taskSelectedTime.value) {
      taskSelectedTime.value = pickedTime;
    }
  }

  void scrollDown() {
    if (scrollController.hasClients) {
      scrollController.animateTo(0x7fffffff,
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }
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
