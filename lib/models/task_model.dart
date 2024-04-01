import 'package:flutter/material.dart';
import 'package:mechanix/models/single_part_model.dart';

class TaskModel {
  //Page1 -> 14 fields.
  String? selectedAddress;
  double? setUnits;
  double? unitHours;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? nameOfJourneyMan;
  String? unitOnlineOnArrival;
  String? jobScope;
  String? operationalProblems;
  String? engineBrand;
  double? modelNumber;
  double? serialNumber;
  double? arrangementNumber;
  String? oilSamplesTaken;

  //Page2 -> 56 fields
  double? engineLoad;
  double? engineRPM;
  double? ignitionTiming;
  List<String>? exhaustGasSampleFound;
  double? leftBankFound;
  double? rightBankFound;
  List<String>? exhaustGasSampleAdjusted;
  double? leftBankAdjusted;
  double? rightBankAdjusted;
  double? btuValue;
  String? selectedBtuValue;
  List<double>? cylinderExhaustPyrometerTemperatures;
  String? lbTurboIn;
  double? lbTurboInTemp;
  String? rbTurboIn;
  double? rbTurboInTemp;
  String? lbTurboOut;
  double? lbTurboOutTemp;
  String? rbTurboOut;
  double? rbTurboOutTemp;
  String? missFireDetected;
  List<double>? burnTemperatures;
  double? throttleActuatorPosition;
  double? fuelValue;
  double? engineOilPressure;
  double? oilPressureDifferential;
  String? oilPressureDifferentialTextField;
  double? oilTemperatureIn;
  double? oilTemperatureOut;
  String? oilLevelEngine;
  double? engineCoolantPressure;
  String? engineCoolantPressureRadioValue;
  String? jacketWaterLevel;
  String? auxiliaryCoolantLevel1;
  double? jacketWaterTemperaturesIn;
  double? jacketWaterTemperaturesOut;
  double? auxCoolantTemperaturesIn;
  double? auxCoolantTemperaturesOut;
  double? inletAirTemp;
  String? inletAirTempRadio;
  double? inletAirPressure;
  String? inletAirPressureRadio;
  double? primaryFuelPressure;
  double? actualAirToFuelRatio;
  double? crankcasePressure;
  double? airFilterRestriction;
  String? airFilterRestrictionRadio;
  String? hydraulicOil;
  String? leaksFound;
  bool? isOilSelected;
  String? oilDescription;
  bool? isCoolantSelected;
  String? coolantDescription;
  bool? isGasSelected;
  String? gasDescription;
  bool? isExhaustSelected;
  String? exhaustDescription;
  bool? isAirSelected;
  String? airDescription;
  String? excessiveVibrationAndOddNoises;
  String? excessiveVibrationAndOddNoisesDescription;
  String? problemsWithDriver;
  String? problemsWithDriverDescription;

  //Page3 -> 38 fields
  List<double>? hotCompressionTemperatures;
  double? intakeValueSet;
  String? intakeValueSetRadioValue;
  double? exhaustValueSet;
  String? exhaustValueSetRadioValue;
  String? majorValueRecessionDetected;
  String? boroscopeRecommended;
  String? boroscopeInspectionCompleted;
  String? installNewWires;
  double? sparkplugGap;
  String? sparkplugExtensionInstalled;
  String? newExtensionInstalled;
  String? listOfNewExtensionInstalled;
  String? sparkplugWireCondition;
  String? listOfSparkplugWireCondition;
  String? cannonPlugConnectorsTight;
  String? listOfTransformerCoilsReplaced;
  String? crankcaseBreatherInspection;
  String? newBreatherElementInstalled;
  String? checkAllCanonFan;
  String? listOfCheckAllCanonFan;
  String? coolantSystemCheck;
  String? lubricationSystemCheck;
  String? coolingSystemCheck;
  String? checkFuelGasFilter;
  String? fuelGasFilterFound;
  String? airFilterInspection;
  String? turboChargerInspection;
  String? carburetorInternalCleaningInspection;
  String? engineOilFilterChange;
  String? engineOilFilterChange2;
  String? oilCoolerDrained;
  String? hydraulicOilFilterChange;
  String? hydraulicOilNew;
  String? engineOilSystemPrimed;
  String? oilDrainIsolationValvesShutIn;
  String? dayTankFiltersInstalledNew;
  String? dayTankValvesOpen;

  //Page4 -> 13 fields
  String? oilPressureEngineAndGood;
  String? engineOilLevel;
  String? jacketWaterCoolantLevel;
  String? auxiliaryCoolantLevel2;
  String? allTempsAndPressuresStableAndNormalRanges;
  String? noisesOrVibrationsDetected;
  String? engineExhaustGasCheckedAndAdjustedAtMaxLoad;
  String? documentFinalSetPointExhaustGasOxygenOrCOLevels;
  String? documentFinalManifoldPressureAndRPM;
  String? engineDeficienciesRadio;
  String? engineDeficienciesTextfield;
  String? partsOrderingStatus;
  List<SinglePartModel>? partsList;

  // Constructor
  TaskModel({
    //Page1 -> 14 fields.
    this.selectedAddress,
    this.setUnits,
    this.unitHours,
    this.selectedDate,
    this.selectedTime,
    this.nameOfJourneyMan,
    this.unitOnlineOnArrival,
    this.jobScope,
    this.operationalProblems,
    this.engineBrand,
    this.modelNumber,
    this.serialNumber,
    this.arrangementNumber,
    this.oilSamplesTaken,

    //Page2 -> 56 fields
    this.engineLoad,
    this.engineRPM,
    this.ignitionTiming,
    this.exhaustGasSampleFound,
    this.leftBankFound,
    this.rightBankFound,
    this.exhaustGasSampleAdjusted,
    this.leftBankAdjusted,
    this.rightBankAdjusted,
    this.btuValue,
    this.selectedBtuValue,
    this.cylinderExhaustPyrometerTemperatures,
    this.lbTurboIn,
    this.lbTurboInTemp,
    this.rbTurboIn,
    this.rbTurboInTemp,
    this.lbTurboOut,
    this.lbTurboOutTemp,
    this.rbTurboOut,
    this.rbTurboOutTemp,
    this.missFireDetected,
    this.burnTemperatures,
    this.throttleActuatorPosition,
    this.fuelValue,
    this.engineOilPressure,
    this.oilPressureDifferential,
    this.oilPressureDifferentialTextField,
    this.oilTemperatureIn,
    this.oilTemperatureOut,
    this.oilLevelEngine,
    this.engineCoolantPressure,
    this.engineCoolantPressureRadioValue,
    this.jacketWaterLevel,
    this.auxiliaryCoolantLevel1,
    this.jacketWaterTemperaturesIn,
    this.jacketWaterTemperaturesOut,
    this.auxCoolantTemperaturesIn,
    this.auxCoolantTemperaturesOut,
    this.inletAirTemp,
    this.inletAirTempRadio,
    this.inletAirPressure,
    this.inletAirPressureRadio,
    this.primaryFuelPressure,
    this.actualAirToFuelRatio,
    this.crankcasePressure,
    this.airFilterRestriction,
    this.airFilterRestrictionRadio,
    this.hydraulicOil,
    this.leaksFound,
    this.isOilSelected,
    this.oilDescription,
    this.isCoolantSelected,
    this.coolantDescription,
    this.isGasSelected,
    this.gasDescription,
    this.isExhaustSelected,
    this.exhaustDescription,
    this.isAirSelected,
    this.airDescription,
    this.excessiveVibrationAndOddNoises,
    this.excessiveVibrationAndOddNoisesDescription,
    this.problemsWithDriver,
    this.problemsWithDriverDescription,

    //Page3 -> 38 fields
    this.hotCompressionTemperatures,
    this.intakeValueSet,
    this.intakeValueSetRadioValue,
    this.exhaustValueSet,
    this.exhaustValueSetRadioValue,
    this.majorValueRecessionDetected,
    this.boroscopeRecommended,
    this.boroscopeInspectionCompleted,
    this.installNewWires,
    this.sparkplugGap,
    this.sparkplugExtensionInstalled,
    this.newExtensionInstalled,
    this.listOfNewExtensionInstalled,
    this.sparkplugWireCondition,
    this.listOfSparkplugWireCondition,
    this.cannonPlugConnectorsTight,
    this.listOfTransformerCoilsReplaced,
    this.crankcaseBreatherInspection,
    this.newBreatherElementInstalled,
    this.checkAllCanonFan,
    this.listOfCheckAllCanonFan,
    this.coolantSystemCheck,
    this.lubricationSystemCheck,
    this.coolingSystemCheck,
    this.checkFuelGasFilter,
    this.fuelGasFilterFound,
    this.airFilterInspection,
    this.turboChargerInspection,
    this.carburetorInternalCleaningInspection,
    this.engineOilFilterChange,
    this.engineOilFilterChange2,
    this.oilCoolerDrained,
    this.hydraulicOilFilterChange,
    this.hydraulicOilNew,
    this.engineOilSystemPrimed,
    this.oilDrainIsolationValvesShutIn,
    this.dayTankFiltersInstalledNew,
    this.dayTankValvesOpen,

    //Page4 -> 13 fields
    this.oilPressureEngineAndGood,
    this.engineOilLevel,
    this.jacketWaterCoolantLevel,
    this.auxiliaryCoolantLevel2,
    this.allTempsAndPressuresStableAndNormalRanges,
    this.noisesOrVibrationsDetected,
    this.engineExhaustGasCheckedAndAdjustedAtMaxLoad,
    this.documentFinalSetPointExhaustGasOxygenOrCOLevels,
    this.documentFinalManifoldPressureAndRPM,
    this.engineDeficienciesRadio,
    this.engineDeficienciesTextfield,
    this.partsOrderingStatus,
    this.partsList,
  });
}
