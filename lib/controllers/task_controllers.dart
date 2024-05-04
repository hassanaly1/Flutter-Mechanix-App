import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/googlemap_controller.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/models/payload.dart';
import 'package:mechanix/models/task_model.dart';

class AddTaskController extends GetxController {
  List<Part> partsList = <Part>[].obs; //List of Parts
  var activePageIndex = 0.obs;
  final ScrollController scrollController = ScrollController();

  final UniversalController controller = Get.find();
  final MapController mapController = Get.put(MapController());

  @override
  void onInit() {
    selectedAddress.text = mapController.selectedAddress.value;
    selectedAddressLatitude = mapController.selectedAddressLatitude;
    selectedAddressLongitude = mapController.selectedAddressLongitude;
    taskSelectedDate = DateTime.now().obs;
    taskSelectedTime = TimeOfDay.now().obs;
    super.onInit();
  }

  void addTask() {
    //Geolocation
    Geolocation geolocation = Geolocation(
      address: selectedAddress.text,
      geolat: selectedAddressLatitude.toString(),
      geolong: selectedAddressLongitude.toString(),
    );
    //Task
    TaskModel newTask = TaskModel(
      //Page1
      //: todo: Add Name , Email textfields
      unit: double.tryParse(setUnits.text.trim()),
      unitHours: double.tryParse(unitHours.text.trim()),
      date: taskSelectedDate.value,
      time: taskSelectedTime.value,
      nameJourneyMan: nameOfJourneyMan.text.trim(),
      unitOnlineArrival: unitOnlineOnArrival.value,
      jobScope: jobScope.text.trim(),
      problems: operationalProblems.text.trim(),
      engineBrand: engineBrand.value,
      modelNumber: double.tryParse(modelNumber.text.trim()),
      serialNumber: double.tryParse(serialNumber.text.trim()),
      arrangementNumber: double.tryParse(arrangementNumber.text.trim()),
      isOilSampleTaken: oilSamplesTaken.value,

      //Page2
      engineLoad: double.tryParse(engineLoad.text.trim()),
      engineRpm: double.tryParse(engineRPM.text.trim()),
      btdc: double.tryParse(ignitionTiming.text.trim()),
      // gasSampleAsFound: exhaustGasSampleFound,
      lbBankAsGasFound: double.tryParse(leftBankFound.text.trim()),
      rbBankAsGasFound: double.tryParse(rightBankFound.text.trim()),
      // gasSampleAsAdjusted: exhaustGasSampleAdjusted,
      lbBankAsGasAdjusted: double.tryParse(leftBankAdjusted.text.trim()),
      rbBankAsGasAdjusted: double.tryParse(rightBankAdjusted.text.trim()),
      btdcValue: double.tryParse(btuValue.text.trim()),
      btuType: selectedBtuValue.value,
      isMisfiresDetected: missFireDetected.value,
      throttleActuatorPosition:
          double.tryParse(throttleActuatorPosition.text.trim()),
      throttleActuatorFuelValue: double.tryParse(fuelValue.text.trim()),
      engineOilPressurePsi: double.tryParse(engineOilPressure.text.trim()),
      oilPressureDifferentialFilter:
          double.tryParse(oilPressureDifferential.value),
      engineOilPressureDifferentialFilterNa:
          oilPressureDifferentialTextField.text.trim(),
      oilTemperatureIn: double.tryParse(oilTemperatureIn.text.trim()),
      oilTemperatureOut: double.tryParse(oilTemperatureOut.text.trim()),
      oilEngineLevel: oilLevelEngine.value,
      engineCoolantValue: double.tryParse(engineCoolantPressure.text.trim()),
      engineCoolantType: engineCoolantPressureRadioValue.value,
      jacketWaterLevel: jacketWaterLevel.value,
      auxiliaryCoolant: auxiliaryCoolantlevel1.value,
      jacketWaterTemperatureIn:
          double.tryParse(jacketWaterTemperaturesIn.text.trim()),
      jacketWaterTemperatureOut:
          double.tryParse(jacketWaterTemperaturesOut.text.trim()),
      coolantTemperatureIn:
          double.tryParse(auxCoolantTemperaturesIn.text.trim()),
      coolantTemperatureOut:
          double.tryParse(auxCoolantTemperaturesOut.text.trim()),
      inletAirTemperatureValue: double.tryParse(inletAirTemp.text.trim()),
      inletAirTemperatureType: inletAirTempRadio.value,
      inletAirPressureValue: double.tryParse(inletAirPressure.text.trim()),
      inletAirPressureType: inletAirPressureRadio.value,
      primaryFuelPressurePsi: double.tryParse(primaryFuelPressure.text.trim()),
      cranKCaseFuelRatio: double.tryParse(actualAirToFuelRatio.text.trim()),
      vaccumCrankCasePressure: double.tryParse(crankcasePressure.text.trim()),
      airfilterRestrictionValue:
          double.tryParse(airFilterRestriction.text.trim()),
      airfilterRestrictionType: airFilterRestrictionRadio.value,
      cranKCaseHydraulicOilCondition: hydraulicOil.value,
      isLeakageFound: leaksFound.value,
      isExcessiveVibration: excessiveVibrationAndOddNoises.value,
      excessiveVibrationDescription:
          excessiveVibrationAndOddNoisesDescription.text.trim(),
      isInDrivingProblem: problemsWithDriver.value,
      drivingProblemDescription: problemsWithDriverDescription.text.trim(),

      //Page3
      intakeValue: double.tryParse(intakeValueSet.text.trim()),
      intakeType: intakeValueSetRadioValue.value,
      exhaustValue: double.tryParse(exhaustValueSet.text.trim()),
      exhaustType: exhaustValueSetRadioValue.value,
      majorValueDetected: majorValueRecessionDetected.value,
      boroscopeRecommended: boroscopeRecommended.value,
      boroscopeInspectionCompleted: boroscopeInspectionCompleted.value,
      installNewSparkPlug: installNewSparkplugs.value,
      sparkplugGap: double.tryParse(sparkplugGap.text.trim()),
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
        lbInValue: double.tryParse(lbTurboInTemp.text.trim()),
        isTurboIn: true,
        isTurboOut: false,
        rbInType: rbTurboIn.value,
        rbInValue: double.tryParse(rbTurboInTemp.text.trim()),
      ),
      TurboTemperature(
        lbInType: lbTurboOut.value,
        lbInValue: double.tryParse(lbTurboOutTemp.text.trim()),
        isTurboIn: false,
        isTurboOut: true,
        rbInType: rbTurboOut.value,
        rbInValue: double.tryParse(rbTurboOutTemp.text.trim()),
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
    List<Part> parts = [
      Part(
        name: partName.text.trim(),
        description: partDescription.text.trim(),
        quantity: double.tryParse(partQuantity.text.trim()),
        vendor: partVendor.text.trim(),
      )
    ];
    //HotCompression
    List<TextEditingController> hotCompressionTemperatures = [
      hotCompressionTemperature1,
      hotCompressionTemperature2,
      hotCompressionTemperature3,
      hotCompressionTemperature4,
      hotCompressionTemperature5,
      hotCompressionTemperature6,
      hotCompressionTemperature7,
      hotCompressionTemperature8,
      hotCompressionTemperature9,
      hotCompressionTemperature10,
      hotCompressionTemperature11,
      hotCompressionTemperature12,
      hotCompressionTemperature13,
      hotCompressionTemperature14,
      hotCompressionTemperature15,
      hotCompressionTemperature16,
    ];
    //CylinderExhaustPyrometer
    List<TextEditingController> cylinderExhaustPyrometerTemperatures = [
      cylinderExhaustPyrometerTemperature1,
      cylinderExhaustPyrometerTemperature2,
      cylinderExhaustPyrometerTemperature3,
      cylinderExhaustPyrometerTemperature4,
      cylinderExhaustPyrometerTemperature5,
      cylinderExhaustPyrometerTemperature6,
      cylinderExhaustPyrometerTemperature7,
      cylinderExhaustPyrometerTemperature8,
      cylinderExhaustPyrometerTemperature9,
      cylinderExhaustPyrometerTemperature10,
      cylinderExhaustPyrometerTemperature11,
      cylinderExhaustPyrometerTemperature12,
      cylinderExhaustPyrometerTemperature13,
      cylinderExhaustPyrometerTemperature14,
      cylinderExhaustPyrometerTemperature15,
      cylinderExhaustPyrometerTemperature16,
    ];
    //BurnCompression
    List<TextEditingController> burnTemperatures = [
      burnTemperature1,
      burnTemperature2,
      burnTemperature3,
      burnTemperature4,
      burnTemperature5,
      burnTemperature6,
      burnTemperature7,
      burnTemperature8,
      burnTemperature9,
      burnTemperature10,
      burnTemperature11,
      burnTemperature12,
      burnTemperature13,
      burnTemperature14,
      burnTemperature15,
      burnTemperature16,
    ];
    List<Temperatures> cylinderExhaustPyrometer = [];
    List<Temperatures> burnTemperature = [];
    List<Temperatures> hotCompression = [];
    for (int i = 0; i < cylinderExhaustPyrometerTemperatures.length; i++) {
      cylinderExhaustPyrometer.add(
        Temperatures(
            temperatureNumber: i + 1,
            forCylinder: true,
            forBurnTemperature: false,
            forHotCompression: false,
            temperature: double.tryParse(
                cylinderExhaustPyrometerTemperatures[i].text.trim())),
      );
    }
    for (int i = 0; i < burnTemperatures.length; i++) {
      burnTemperature.add(Temperatures(
          temperatureNumber: i + 1,
          forCylinder: false,
          forBurnTemperature: true,
          forHotCompression: false,
          temperature: double.tryParse(burnTemperatures[i].text.trim())));
    }
    for (int i = 0; i < hotCompressionTemperatures.length; i++) {
      hotCompression.add(
        Temperatures(
            temperatureNumber: i + 1,
            forCylinder: false,
            forBurnTemperature: false,
            forHotCompression: true,
            temperature:
                double.tryParse(hotCompressionTemperatures[i].text.trim())),
      );
    }

    Payload payload = Payload(
      geolocation: geolocation,
      task: newTask,
      leakageFound: leakageFound,
      parts: parts,
      turboTemperature: turboTemperature,
      cylinderExhaustPyrometer: cylinderExhaustPyrometer,
      burnCompression: burnTemperature,
      hotCompression: hotCompression,
    );
  }

  //-----------------------------------------------------------------------//

  //Page1
  TextEditingController selectedAddress = TextEditingController();
  RxString selectedAddressLatitude = ''.obs;
  RxString selectedAddressLongitude = ''.obs;
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
  //
  RxString lbTurboOut = ''.obs; //RadioButton
  TextEditingController lbTurboOutTemp = TextEditingController();
  RxString rbTurboOut = ''.obs; //RadioButton
  TextEditingController rbTurboOutTemp = TextEditingController();

  //MissFireDetected
  RxString missFireDetected = ''.obs; //RadioButton

  //BurnTimes
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
  RxString excessiveVibrationAndOddNoises = 'no'.obs; //RadioButton
  TextEditingController excessiveVibrationAndOddNoisesDescription =
      TextEditingController();

  //Problems with Driver
  RxString problemsWithDriver = 'no'.obs; //RadioButton
  TextEditingController problemsWithDriverDescription = TextEditingController();

  //-----------------------------------------------------------------------//

  //Page3

  // Hot Compression Test
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
  RxString installNewSparkplugs = ''.obs; //RadioButton
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
  TextEditingController listOfCheckAllCoolerFan = TextEditingController();

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

  @override
  void onClose() {
    debugPrint('AddTaskControllerDisposeCalled');
    scrollController.dispose();
    mapController.dispose();
    //Page1
    selectedAddress.dispose();
    setUnits.dispose();
    unitHours.dispose();
    nameOfJourneyMan.dispose();
    unitOnlineOnArrival.value = '';
    jobScope.dispose();
    operationalProblems.dispose();
    modelNumber.dispose();
    serialNumber.dispose();
    arrangementNumber.dispose();
    oilSamplesTaken.value = '';
    //Page2
    engineLoad.dispose();
    engineRPM.dispose();
    ignitionTiming.dispose();
    exhaustGasSampleFound.value = [];
    leftBankFound.dispose();
    rightBankFound.dispose();
    exhaustGasSampleAdjusted.value = [];
    leftBankAdjusted.dispose();
    rightBankAdjusted.dispose();
    btuValue.dispose();
    selectedBtuValue.value = '';
    cylinderExhaustPyrometerTemperature1.dispose();
    cylinderExhaustPyrometerTemperature2.dispose();
    cylinderExhaustPyrometerTemperature3.dispose();
    cylinderExhaustPyrometerTemperature4.dispose();
    cylinderExhaustPyrometerTemperature5.dispose();
    cylinderExhaustPyrometerTemperature6.dispose();
    cylinderExhaustPyrometerTemperature7.dispose();
    cylinderExhaustPyrometerTemperature8.dispose();
    cylinderExhaustPyrometerTemperature9.dispose();
    cylinderExhaustPyrometerTemperature10.dispose();
    cylinderExhaustPyrometerTemperature11.dispose();
    cylinderExhaustPyrometerTemperature12.dispose();
    cylinderExhaustPyrometerTemperature13.dispose();
    cylinderExhaustPyrometerTemperature14.dispose();
    cylinderExhaustPyrometerTemperature15.dispose();
    cylinderExhaustPyrometerTemperature16.dispose();
    lbTurboIn.value = '';
    rbTurboIn.value = '';
    lbTurboOut.value = '';
    rbTurboOut.value = '';
    lbTurboInTemp.dispose();
    rbTurboInTemp.dispose();
    lbTurboOutTemp.dispose();
    rbTurboOutTemp.dispose();
    missFireDetected.value = '';
    burnTemperature1.dispose();
    burnTemperature2.dispose();
    burnTemperature3.dispose();
    burnTemperature4.dispose();
    burnTemperature5.dispose();
    burnTemperature6.dispose();
    burnTemperature7.dispose();
    burnTemperature8.dispose();
    burnTemperature9.dispose();
    burnTemperature10.dispose();
    burnTemperature11.dispose();
    burnTemperature12.dispose();
    burnTemperature13.dispose();
    burnTemperature14.dispose();
    burnTemperature15.dispose();
    burnTemperature16.dispose();
    throttleActuatorPosition.dispose();
    fuelValue.dispose();
    engineOilPressure.dispose();
    oilPressureDifferential.value = '';
    oilPressureDifferentialTextField.dispose();
    oilTemperatureIn.dispose();
    oilTemperatureOut.dispose();
    oilLevelEngine.value = '';
    engineCoolantPressure.dispose();
    engineCoolantPressureRadioValue.value = '';
    jacketWaterLevel.value = '';
    auxiliaryCoolantlevel1.value = '';
    jacketWaterTemperaturesIn.dispose();
    jacketWaterTemperaturesOut.dispose();
    auxCoolantTemperaturesIn.dispose();
    auxCoolantTemperaturesOut.dispose();
    inletAirTemp.dispose();
    inletAirTempRadio.value = '';
    inletAirPressure.dispose();
    inletAirPressureRadio.value = '';
    primaryFuelPressure.dispose();
    actualAirToFuelRatio.dispose();
    crankcasePressure.dispose();
    airFilterRestriction.dispose();
    airFilterRestrictionRadio.value = '';
    hydraulicOil.value = '';
    leaksFound.value = '';
    hasOilLeakage.value = false;
    oilDescription.dispose();
    hasCoolantLeakage.value = false;
    coolantDescription.dispose();
    hasGasLeakage.value = false;
    gasDescription.dispose();
    hasExhaustGasLeakage.value = false;
    exhaustDescription.dispose();
    hasAirLeakage.value = false;
    airDescription.dispose();
    excessiveVibrationAndOddNoises.value = 'no';
    excessiveVibrationAndOddNoisesDescription.dispose();
    problemsWithDriver.value = 'no';
    problemsWithDriverDescription.dispose();
    //Page3
    hotCompressionTemperature1.dispose();
    hotCompressionTemperature2.dispose();
    hotCompressionTemperature3.dispose();
    hotCompressionTemperature4.dispose();
    hotCompressionTemperature5.dispose();
    hotCompressionTemperature6.dispose();
    hotCompressionTemperature7.dispose();
    hotCompressionTemperature8.dispose();
    hotCompressionTemperature9.dispose();
    hotCompressionTemperature10.dispose();
    hotCompressionTemperature11.dispose();
    hotCompressionTemperature12.dispose();
    hotCompressionTemperature13.dispose();
    hotCompressionTemperature14.dispose();
    hotCompressionTemperature15.dispose();
    hotCompressionTemperature16.dispose();
    intakeValueSet.dispose();
    intakeValueSetRadioValue.value = '';
    exhaustValueSet.dispose();
    exhaustValueSetRadioValue.value = '';
    majorValueRecessionDetected.value = '';
    boroscopeRecommended.value = '';
    boroscopeInspectionCompleted.value = '';
    installNewSparkplugs.value = '';
    sparkplugGap.dispose();
    sparkplugExtensionInstalled.value = '';
    newExtensionInstalled.value = '';
    listOfNewExtensionInstalled.dispose();
    sparkplugWireCondition.value = '';
    listOfSparkplugWireCondition.dispose();
    cannonPlugConnectorsTight.value = '';
    listOfTransformerCoilsReplaced.dispose();
    //------------------------
    crankcaseBreatherInspection.value = '';
    newBreatherElementInstalled.value = '';
    checkAllCanonFan.value = '';
    listOfCheckAllCoolerFan.dispose();
    coolantSystemCheck.value = '';
    lubricationSystemCheck.value = '';
    coolingSystemCheck.value = '';
    checkFuelGasFilter.value = '';
    fuelGasFilterFound.value = '';
    airFilterInspection.value = '';
    turboChargerInspection.value = '';
    carburetorInternalCleaningInspection.value = '';
    engineOilFilterChange.value = '';
    engineOilFilterChange2.value = '';
    oilCoolerDrained.value = '';
    hydraulicOilFilterChange.value = '';
    hydraulicOilNew.value = '';
    engineOilSystemPrimed.value = '';
    oilDrainIsolationValvesShutIn.value = '';
    dayTankFiltersInstalledNew.value = '';
    dayTankValvesOpen.value = '';
    //Page4
    oilPressureEngineAndGood.value = '';
    engineOilLevel.value = '';
    jacketWaterCoolantLevel.value = '';
    auxiliaryCoolantLevel2.value = '';
    allTempsAndPressuresStableAndNormalRanges.value = '';
    noisesOrVibrationsDetected.value = '';
    engineExhaustGasCheckedAndAdjustedAtMaxLoad.value = '';
    documentFinalSetPointExhaustGasOxygenOrCOLevels.dispose();
    documentFinalManifoldPressureAndRPM.dispose();
    engineDeficienciesRadio.value = 'no';
    engineDeficienciesTextfield.dispose();
    partsOrderingStatus.value = '';
    partName.dispose();
    partDescription.dispose();
    partQuantity.dispose();
    partVendor.dispose();
    super.onClose();
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
