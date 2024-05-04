import 'package:flutter/material.dart';
import 'package:mechanix/models/payload.dart';

class TaskModel {
  String? name;
  String? user;
  String? customerEmail;
  double? unit;
  double? unitHours;
  DateTime? date;
  TimeOfDay? time;
  String? engineBrand;
  String? nameJourneyMan;
  String? unitOnlineArrival;
  String? jobScope;
  String? problems;
  double? modelNumber;
  double? serialNumber;
  double? arrangementNumber;
  String? isOilSampleTaken;
  double? engineLoad;
  double? engineRpm;
  double? btdc;
  List<GasSampleAs>? gasSampleAsFound; // MissingInControllers
  double? lbBankAsGasFound;
  double? rbBankAsGasFound;
  List<GasSampleAs>? gasSampleAsAdjusted;
  double? lbBankAsGasAdjusted;
  double? rbBankAsGasAdjusted;
  double? btdcValue;
  String? btuType;
  String? isMisfiresDetected;
  double? throttleActuatorPosition;
  double? throttleActuatorFuelValue;
  double? engineOilPressurePsi;
  double? oilPressureDifferentialFilter;
  String? engineOilPressureDifferentialFilterNa;
  double? oilTemperatureIn;
  double? oilTemperatureOut;
  String? oilEngineLevel;
  double? engineCoolantValue;
  String? engineCoolantType;
  String? jacketWaterLevel;
  String? auxiliaryCoolant;
  double? jacketWaterTemperatureIn;
  double? jacketWaterTemperatureOut;
  double? coolantTemperatureIn;
  double? coolantTemperatureOut;
  String? inletAirTemperatureType;
  double? inletAirTemperatureValue;
  String? inletAirPressureType;
  double? inletAirPressureValue;
  double? primaryFuelPressurePsi;
  double? cranKCaseFuelRatio;
  double? vaccumCrankCasePressure;
  double? airfilterRestrictionValue;
  String? airfilterRestrictionType;
  String? cranKCaseHydraulicOilCondition;
  String? isLeakageFound;
  String? isExcessiveVibration;
  String? excessiveVibrationDescription;
  String? isInDrivingProblem;
  String? drivingProblemDescription;
  double? intakeValue;
  String? intakeType;
  double? exhaustValue;
  String? exhaustType;
  String? majorValueDetected;
  String? boroscopeRecommended;
  String? boroscopeInspectionCompleted;
  String? installNewSparkPlug;
  double? sparkplugGap; //
  String? extensionInstalled;
  String? anyNewExtension;
  String? replaceExtensionList;
  String? sparkWireCondition;
  String? sparkWireConditionValue;
  String? canNOnPlugTight;
  String? replacedListTransformerCoils;
  String? crankcaseInspection;
  String? newBreatherElementInstalled;
  String? beltsCoolers;
  String? listOfBeltCoolers;
  String? coolantSystemLeakageChecks;
  String? lubricantSystemCheck;
  String? coolantSystemLeakageGreasers;
  String? fuelGasFilter;
  String? fuelGasFilterFound;
  String? airFilterInspection;
  String? turboChargesInspection;
  String? carburetorInspection;
  String? engineOilFilterAsk;
  String? engineOilFilterValue;
  String? oilCoolerDrained;
  String? hyraulicOilFilter;
  String? hyraulicOilNew;
  String? oilLevelCorrect;
  String? oilDrainedIsolation;
  String? tankFilter;
  String? tankValuesOpen;
  String? oilPressureEngineGood;
  String? engineOilLevel;
  String? jacketWaterCoolantLevel;
  String? auxiliaryCoolantLevel;
  String? temperaturePressureChecks;
  String? nOiseVibrationDetected;
  String? engineExhaustGasAdjusted;
  String? documentFinalSetPoints;
  String? documentFinalManifoldPressure;
  String? engineDeficienciesRepairedFuture;
  String? engineDeficienciesDescribed;
  String? partRepairedOrder;

  TaskModel({
    this.name,
    this.user,
    this.customerEmail,
    this.unit,
    this.unitHours,
    this.date,
    this.time,
    this.engineBrand,
    this.nameJourneyMan,
    this.unitOnlineArrival,
    this.jobScope,
    this.problems,
    this.modelNumber,
    this.serialNumber,
    this.arrangementNumber,
    this.isOilSampleTaken,
    this.engineLoad,
    this.engineRpm,
    this.btdc,
    this.gasSampleAsFound,
    this.lbBankAsGasFound,
    this.rbBankAsGasFound,
    this.gasSampleAsAdjusted,
    this.lbBankAsGasAdjusted,
    this.rbBankAsGasAdjusted,
    this.btdcValue,
    this.btuType,
    this.isMisfiresDetected,
    this.throttleActuatorPosition,
    this.throttleActuatorFuelValue,
    this.engineOilPressurePsi,
    this.oilPressureDifferentialFilter,
    this.engineOilPressureDifferentialFilterNa,
    this.oilTemperatureIn,
    this.oilTemperatureOut,
    this.oilEngineLevel,
    this.engineCoolantValue,
    this.engineCoolantType,
    this.jacketWaterLevel,
    this.auxiliaryCoolant,
    this.jacketWaterTemperatureIn,
    this.jacketWaterTemperatureOut,
    this.coolantTemperatureIn,
    this.coolantTemperatureOut,
    this.inletAirTemperatureType,
    this.inletAirTemperatureValue,
    this.inletAirPressureType,
    this.inletAirPressureValue,
    this.primaryFuelPressurePsi,
    this.cranKCaseFuelRatio,
    this.vaccumCrankCasePressure,
    this.airfilterRestrictionValue,
    this.airfilterRestrictionType,
    this.cranKCaseHydraulicOilCondition,
    this.isLeakageFound,
    this.isExcessiveVibration,
    this.excessiveVibrationDescription,
    this.isInDrivingProblem,
    this.drivingProblemDescription,
    this.intakeValue,
    this.intakeType,
    this.exhaustValue,
    this.exhaustType,
    this.majorValueDetected,
    this.boroscopeRecommended,
    this.boroscopeInspectionCompleted,
    this.installNewSparkPlug,
    this.sparkplugGap,
    this.extensionInstalled,
    this.anyNewExtension,
    this.replaceExtensionList,
    this.sparkWireCondition,
    this.sparkWireConditionValue,
    this.canNOnPlugTight,
    this.replacedListTransformerCoils,
    this.crankcaseInspection,
    this.newBreatherElementInstalled,
    this.beltsCoolers,
    this.listOfBeltCoolers,
    this.coolantSystemLeakageChecks,
    this.lubricantSystemCheck,
    this.coolantSystemLeakageGreasers,
    this.fuelGasFilter,
    this.fuelGasFilterFound,
    this.airFilterInspection,
    this.turboChargesInspection,
    this.carburetorInspection,
    this.engineOilFilterAsk,
    this.engineOilFilterValue,
    this.oilCoolerDrained,
    this.hyraulicOilFilter,
    this.hyraulicOilNew,
    this.oilLevelCorrect,
    this.oilDrainedIsolation,
    this.tankFilter,
    this.tankValuesOpen,
    //Page4
    this.oilPressureEngineGood,
    this.engineOilLevel,
    this.jacketWaterCoolantLevel,
    this.auxiliaryCoolantLevel,
    this.temperaturePressureChecks,
    this.nOiseVibrationDetected,
    this.engineExhaustGasAdjusted,
    this.documentFinalSetPoints,
    this.documentFinalManifoldPressure,
    this.engineDeficienciesRepairedFuture,
    this.engineDeficienciesDescribed,
    this.partRepairedOrder,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        name: json["name"],
        user: json["user"],
        customerEmail: json["customer_email"],
        unit: json["unit"],
        unitHours: json["unit_hours"],
        date: json["date"],
        time: json["time"],
        engineBrand: json["engine_brand"],
        nameJourneyMan: json["name_journey_man"],
        unitOnlineArrival: json["unit_online_arrival"],
        jobScope: json["job_scope"],
        problems: json["problems"],
        modelNumber: json["model_number"],
        serialNumber: json["serial_number"],
        arrangementNumber: json["arrangement_number"],
        isOilSampleTaken: json["is_oil_sample_taken"],
        engineLoad: json["engine_load"],
        engineRpm: json["engine_rpm"],
        btdc: json["btdc"],
        gasSampleAsFound: json["gas_sample_as_found"] == null
            ? []
            : List<GasSampleAs>.from(json["gas_sample_as_found"]!
                .map((x) => GasSampleAs.fromJson(x))),
        lbBankAsGasFound: json["lb_bank_as_gas_found"],
        rbBankAsGasFound: json["rb_bank_as_gas_found"],
        gasSampleAsAdjusted: json["gas_sample_as_adjusted"] == null
            ? []
            : List<GasSampleAs>.from(json["gas_sample_as_adjusted"]!
                .map((x) => GasSampleAs.fromJson(x))),
        lbBankAsGasAdjusted: json["lb_bank_as_gas_adjusted"],
        rbBankAsGasAdjusted: json["rb_bank_as_gas_adjusted"],
        btdcValue: json["btdc_value"],
        btuType: json["btu_type"],
        isMisfiresDetected: json["is_misfires_detected"],
        throttleActuatorPosition: json["throttle_actuator_position"],
        throttleActuatorFuelValue: json["throttle_actuator_fuel_value"],
        engineOilPressurePsi: json["engine_oil_pressure_psi"],
        oilPressureDifferentialFilter: json["oil_pressure_differential_filter"],
        engineOilPressureDifferentialFilterNa:
            json["engine_oil_pressure_differential_filter_na"],
        oilTemperatureIn: json["oil_temperature_in"],
        oilTemperatureOut: json["oil_temperature_out"],
        oilEngineLevel: json["oil_engine_level"],
        engineCoolantValue: json["engine_coolant_value"],
        engineCoolantType: json["engine_coolant_type"],
        jacketWaterLevel: json["jacket_water_level"],
        auxiliaryCoolant: json["auxiliary_coolant"],
        jacketWaterTemperatureIn: json["jacket_water_temperature_in"],
        jacketWaterTemperatureOut: json["jacket_water_temperature_out"],
        coolantTemperatureIn: json["coolant_temperature_in"],
        coolantTemperatureOut: json["coolant_temperature_out"],
        inletAirTemperatureType: json["inlet_air_temperature_type"],
        inletAirTemperatureValue: json["inlet_air_temperature_value"],
        inletAirPressureType: json["inlet_air_pressure_type"],
        inletAirPressureValue: json["inlet_air_pressure_value"],
        primaryFuelPressurePsi: json["primary_fuel_pressure_psi"],
        cranKCaseFuelRatio: json["cranK_case_fuel_ratio"],
        vaccumCrankCasePressure: json["vaccum_crank_case_pressure"],
        airfilterRestrictionValue: json["airfilter_restriction_value"],
        airfilterRestrictionType: json["airfilter_restriction_type"],
        cranKCaseHydraulicOilCondition:
            json["cranK_case_hydraulic_oil_condition"],
        isLeakageFound: json["is_leakage_found"],
        isExcessiveVibration: json["is_excessive_vibration"],
        excessiveVibrationDescription: json["excessive_vibration_description"],
        isInDrivingProblem: json["is_in_driving_problem"],
        drivingProblemDescription: json["driving_problem_description"],
        intakeValue: json["intake_value"],
        intakeType: json["intake_type"],
        exhaustValue: json["exhaust_value"],
        exhaustType: json["exhaust_type"],
        majorValueDetected: json["major_value_detected"],
        boroscopeRecommended: json["boroscope_recommended"],
        boroscopeInspectionCompleted: json["boroscope_inspection_completed"],
        installNewSparkPlug: json["install_new_spark_plug"],
        sparkplugGap: json["sparkplug_gap"],
        extensionInstalled: json["extension_installed"],
        anyNewExtension: json["any_new_extension"],
        replaceExtensionList: json["replace_extension_list"],
        sparkWireCondition: json["spark_wire_condition"],
        sparkWireConditionValue: json["spark_wire_condition_value"],
        canNOnPlugTight: json["canNOn_plug_tight"],
        replacedListTransformerCoils: json["replaced_list_transformer_coils"],
        crankcaseInspection: json["crankcase_inspection"],
        newBreatherElementInstalled: json["new_breather_element_installed"],
        beltsCoolers: json["belts_coolers"],
        listOfBeltCoolers: json["list_of_belt_coolers"],
        coolantSystemLeakageChecks: json["coolant_system_leakage_checks"],
        lubricantSystemCheck: json["lubricant_system_check"],
        coolantSystemLeakageGreasers: json["coolant_system_leakage_greasers"],
        fuelGasFilter: json["fuel_gas_filter"],
        fuelGasFilterFound: json["fuel_gas_filter_found"],
        airFilterInspection: json["air_filter_inspection"],
        turboChargesInspection: json["turbo_charges_inspection"],
        carburetorInspection: json["carburetor_inspection"],
        engineOilFilterAsk: json["engine_oil_filter_ask"],
        engineOilFilterValue: json["engine_oil_filter_value"],
        oilCoolerDrained: json["oil_cooler_drained"],
        hyraulicOilFilter: json["hyraulic_oil_filter"],
        hyraulicOilNew: json["hyraulic_oil_new"],
        oilLevelCorrect: json["oil_level_correct"],
        oilDrainedIsolation: json["oil_drained_isolation"],
        tankFilter: json["tank_filter"],
        tankValuesOpen: json["tank_values_open"],
        oilPressureEngineGood: json["oil_pressure_engine_good"],
        engineOilLevel: json["engine_oil_level"],
        jacketWaterCoolantLevel: json["jacket_water_coolant_level"],
        auxiliaryCoolantLevel: json["auxiliary_coolant_level"],
        temperaturePressureChecks: json["temperature_pressure_checks"],
        nOiseVibrationDetected: json["NOise_vibration_detected"],
        engineExhaustGasAdjusted: json["engine_exhaust_gas_adjusted"],
        documentFinalSetPoints: json["document_final_set_points"],
        documentFinalManifoldPressure: json["document_final_manifold_pressure"],
        engineDeficienciesRepairedFuture:
            json["engine_deficiencies_repaired_future"],
        engineDeficienciesDescribed: json["engine_deficiencies_described"],
        partRepairedOrder: json["part_repaired_order"],
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? "",
        "user": user ?? "",
        "customer_email": customerEmail ?? "",
        "unit": unit ?? 0,
        "unit_hours": unitHours ?? 0,
        "date": date ?? "",
        "time": time ?? "",
        "engine_brand": engineBrand ?? "",
        "name_journey_man": nameJourneyMan ?? "",
        "unit_online_arrival": unitOnlineArrival ?? "",
        "job_scope": jobScope ?? "",
        "problems": problems ?? "",
        "model_number": modelNumber ?? 0,
        "serial_number": serialNumber ?? 0,
        "arrangement_number": arrangementNumber ?? 0,
        "is_oil_sample_taken": isOilSampleTaken ?? "",
        "engine_load": engineLoad ?? 0,
        "engine_rpm": engineRpm ?? 0,
        "btdc": btdc ?? 0,
        "gas_sample_as_found": gasSampleAsFound == null
            ? []
            : List<dynamic>.from(gasSampleAsFound!.map((x) => x.toJson())),
        "lb_bank_as_gas_found": lbBankAsGasFound ?? 0,
        "rb_bank_as_gas_found": rbBankAsGasFound ?? 0,
        "gas_sample_as_adjusted": gasSampleAsAdjusted == null
            ? []
            : List<dynamic>.from(gasSampleAsAdjusted!.map((x) => x.toJson())),
        "lb_bank_as_gas_adjusted": lbBankAsGasAdjusted ?? 0,
        "rb_bank_as_gas_adjusted": rbBankAsGasAdjusted ?? 0,
        "btdc_value": btdcValue ?? 0,
        "btu_type": btuType ?? "",
        "is_misfires_detected": isMisfiresDetected ?? "",
        "throttle_actuator_position": throttleActuatorPosition ?? 0,
        "throttle_actuator_fuel_value": throttleActuatorFuelValue ?? 0,
        "engine_oil_pressure_psi": engineOilPressurePsi ?? 0,
        "oil_pressure_differential_filter": oilPressureDifferentialFilter ?? 0,
        "engine_oil_pressure_differential_filter_na":
            engineOilPressureDifferentialFilterNa ?? "",
        "oil_temperature_in": oilTemperatureIn ?? 0,
        "oil_temperature_out": oilTemperatureOut ?? 0,
        "oil_engine_level": oilEngineLevel ?? "",
        "engine_coolant_value": engineCoolantValue ?? 0,
        "engine_coolant_type": engineCoolantType ?? "",
        "jacket_water_level": jacketWaterLevel ?? "",
        "auxiliary_coolant": auxiliaryCoolant ?? "",
        "jacket_water_temperature_in": jacketWaterTemperatureIn ?? 0,
        "jacket_water_temperature_out": jacketWaterTemperatureOut ?? 0,
        "coolant_temperature_in": coolantTemperatureIn ?? 0,
        "coolant_temperature_out": coolantTemperatureOut ?? 0,
        "inlet_air_temperature_type": inletAirTemperatureType ?? "",
        "inlet_air_temperature_value": inletAirTemperatureValue ?? 0,
        "inlet_air_pressure_type": inletAirPressureType ?? "",
        "inlet_air_pressure_value": inletAirPressureValue ?? 0,
        "primary_fuel_pressure_psi": primaryFuelPressurePsi ?? 0,
        "cranK_case_fuel_ratio": cranKCaseFuelRatio ?? 0,
        "vaccum_crank_case_pressure": vaccumCrankCasePressure ?? 0,
        "airfilter_restriction_value": airfilterRestrictionValue ?? 0,
        "airfilter_restriction_type": airfilterRestrictionType ?? "",
        "cranK_case_hydraulic_oil_condition":
            cranKCaseHydraulicOilCondition ?? "",
        "is_leakage_found": isLeakageFound ?? "",
        "is_excessive_vibration": isExcessiveVibration ?? "",
        "excessive_vibration_description": excessiveVibrationDescription ?? "",
        "is_in_driving_problem": isInDrivingProblem ?? "",
        "driving_problem_description": drivingProblemDescription ?? "",
        "intake_value": intakeValue ?? 0,
        "intake_type": intakeType ?? "",
        "exhaust_value": exhaustValue ?? 0,
        "exhaust_type": exhaustType ?? "",
        "major_value_detected": majorValueDetected ?? "",
        "boroscope_recommended": boroscopeRecommended ?? "",
        "boroscope_inspection_completed": boroscopeInspectionCompleted ?? "",
        "install_new_spark_plug": installNewSparkPlug ?? "",
        "sparkplug_gap": sparkplugGap ?? 0,
        "extension_installed": extensionInstalled ?? "",
        "any_new_extension": anyNewExtension ?? "",
        "replace_extension_list": replaceExtensionList ?? "",
        "spark_wire_condition": sparkWireCondition ?? "",
        "spark_wire_condition_value": sparkWireConditionValue ?? "",
        "canNOn_plug_tight": canNOnPlugTight ?? "",
        "replaced_list_transformer_coils": replacedListTransformerCoils ?? "",
        "crankcase_inspection": crankcaseInspection ?? "",
        "new_breather_element_installed": newBreatherElementInstalled ?? "",
        "belts_coolers": beltsCoolers ?? "",
        "list_of_belt_coolers": listOfBeltCoolers ?? "",
        "coolant_system_leakage_checks": coolantSystemLeakageChecks ?? "",
        "lubricant_system_check": lubricantSystemCheck ?? "",
        "coolant_system_leakage_greasers": coolantSystemLeakageGreasers ?? "",
        "fuel_gas_filter": fuelGasFilter ?? "",
        "fuel_gas_filter_found": fuelGasFilterFound ?? "",
        "air_filter_inspection": airFilterInspection ?? "",
        "turbo_charges_inspection": turboChargesInspection ?? "",
        "carburetor_inspection": carburetorInspection ?? "",
        "engine_oil_filter_ask": engineOilFilterAsk ?? "",
        "engine_oil_filter_value": engineOilFilterValue ?? "",
        "oil_cooler_drained": oilCoolerDrained ?? "",
        "hyraulic_oil_filter": hyraulicOilFilter ?? "",
        "hyraulic_oil_new": hyraulicOilNew ?? "",
        "oil_level_correct": oilLevelCorrect ?? "",
        "oil_drained_isolation": oilDrainedIsolation ?? "",
        "tank_filter": tankFilter ?? "",
        "tank_values_open": tankValuesOpen ?? "",
        "oil_pressure_engine_good": oilPressureEngineGood ?? "",
        "engine_oil_level": engineOilLevel ?? "",
        "jacket_water_coolant_level": jacketWaterCoolantLevel ?? "",
        "auxiliary_coolant_level": auxiliaryCoolantLevel ?? "",
        "temperature_pressure_checks": temperaturePressureChecks ?? "",
        "NOise_vibration_detected": nOiseVibrationDetected ?? "",
        "engine_exhaust_gas_adjusted": engineExhaustGasAdjusted ?? "",
        "document_final_set_points": documentFinalSetPoints ?? "",
        "document_final_manifold_pressure": documentFinalManifoldPressure ?? "",
        "engine_deficiencies_repaired_future":
            engineDeficienciesRepairedFuture ?? "",
        "engine_deficiencies_described": engineDeficienciesDescribed ?? "",
        "part_repaired_order": partRepairedOrder ?? "",
      };
}

// PREVIOUS
/////////////////
// import 'package:flutter/material.dart';
// import 'package:mechanix/models/payload_model.dart';
//
// class TaskModel {
//   //Page1 -> 14 fields.
//   double? userId;
//   String? name;
//   String? customerEmail;
//   double? setUnits;
//   double? unitHours;
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;
//   String? engineBrand; //id
//   String? nameOfJourneyMan;
//   String? unitOnlineOnArrival;
//   String? jobScope;
//   String? operationalProblems;
//   double? modelNumber;
//   double? serialNumber;
//   double? arrangementNumber;
//   String? oilSamplesTaken;
//
//   //Page2 -> 56 fields
//   double? engineLoad;
//   double? engineRPM;
//   double? ignitionTiming;
//   List<GasSample>? exhaustGasSampleFound; // ?
//   double? leftBankFound;
//   double? rightBankFound;
//   List<GasSample>? exhaustGasSampleAdjusted; // ?
//   double? leftBankAdjusted;
//   double? rightBankAdjusted;
//   double? btuValue;
//   String? selectedBtuValue; //C or F
//   String? lbTurboIn;
//   double? lbTurboInTemp;
//   String? rbTurboIn;
//   double? rbTurboInTemp;
//   String? lbTurboOut;
//   double? lbTurboOutTemp;
//   String? rbTurboOut;
//   double? rbTurboOutTemp;
//   String? missFireDetected;
//   double? throttleActuatorPosition;
//   double? fuelValue;
//   double? engineOilPressure;
//   double? oilPressureDifferential;
//   String? oilPressureDifferentialTextField;
//   double? oilTemperatureIn;
//   double? oilTemperatureOut;
//   String? oilLevelEngine; // 'GOOD'
//   double? engineCoolantPressure;
//   String? engineCoolantPressureRadioValue;
//   String? jacketWaterLevel; // 'GOOD'
//   String? auxiliaryCoolantLevel1;
//   double? jacketWaterTemperaturesIn;
//   double? jacketWaterTemperaturesOut;
//   double? auxCoolantTemperaturesIn;
//   double? auxCoolantTemperaturesOut;
//   double? inletAirTemp;
//   String? inletAirTempRadio;
//   double? inletAirPressure;
//   String? inletAirPressureRadio;
//   double? primaryFuelPressure;
//   double? actualAirToFuelRatio;
//   double? crankcasePressure;
//   double? airFilterRestriction;
//   String? airFilterRestrictionRadio;
//   String? hydraulicOil;
//   String? anyLeaksFound;
//   String? excessiveVibrationAndOddNoises;
//   String? excessiveVibrationAndOddNoisesDescription;
//   String? problemsWithDriver;
//   String? problemsWithDriverDescription;
//
//   //Page3 -> 38 fields
//   double? intakeValueSet;
//   String? intakeValueSetRadioValue;
//   double? exhaustValueSet;
//   String? exhaustValueSetRadioValue;
//   String? majorValueRecessionDetected;
//   String? boroscopeRecommended;
//   String? boroscopeInspectionCompleted;
//   String? installNewSparkplugs;
//   double? sparkplugGap;
//   String? sparkplugExtensionInstalled;
//   String? newExtensionInstalled;
//   String? listOfNewExtensionInstalled;
//   String? sparkplugWireCondition;
//   String? listOfSparkplugWireCondition;
//   String? cannonPlugConnectorsTight;
//   String? listOfTransformerCoilsReplaced;
//   String? crankcaseBreatherInspection;
//   String? newBreatherElementInstalled;
//   String? checkAllCanonFan;
//   String? listOfCheckAllCanonFan;
//   String? coolantSystemCheck;
//   String? lubricationSystemCheck;
//   String? coolingSystemCheck;
//   String? checkFuelGasFilter;
//   String? fuelGasFilterFound;
//   String? airFilterInspection;
//   String? turboChargerInspection;
//   String? carburetorInternalCleaningInspection;
//   String? engineOilFilterChange;
//   String? engineOilFilterChange2;
//   String? oilCoolerDrained;
//   String? hydraulicOilFilterChange;
//   String? hydraulicOilNew;
//   String? engineOilSystemPrimed;
//   String? oilDrainIsolationValvesShutIn;
//   String? dayTankFiltersInstalledNew;
//   String? dayTankValvesOpen;
//
//   //Page4 -> 13 fields
//   String? oilPressureEngineAndGood;
//   String? engineOilLevel;
//   String? jacketWaterCoolantLevel;
//   String? auxiliaryCoolantLevel2;
//   String? temperatureAndPressureCheck;
//   String? noisesOrVibrationsDetected;
//   String? engineExhaustGasCheckedAndAdjustedAtMaxLoad;
//   String? documentFinalSetPointExhaustGasOxygenOrCOLevels;
//   String? documentFinalManifoldPressureAndRPM;
//   String? engineDeficienciesRadio;
//   String? engineDeficienciesTextfield;
//   String? partsOrderingStatus;
//
//   // Constructor
//   TaskModel({
//     //Page1 -> 14 fields.
//     this.userId,
//     this.name,
//     this.customerEmail,
//     this.setUnits,
//     this.unitHours,
//     this.selectedDate,
//     this.selectedTime,
//     this.nameOfJourneyMan,
//     this.unitOnlineOnArrival,
//     this.jobScope,
//     this.operationalProblems,
//     this.engineBrand,
//     this.modelNumber,
//     this.serialNumber,
//     this.arrangementNumber,
//     this.oilSamplesTaken,
//
//     //Page2 -> 56 fields
//     this.engineLoad,
//     this.engineRPM,
//     this.ignitionTiming,
//     this.exhaustGasSampleFound,
//     this.leftBankFound,
//     this.rightBankFound,
//     this.exhaustGasSampleAdjusted,
//     this.leftBankAdjusted,
//     this.rightBankAdjusted,
//     this.btuValue,
//     this.selectedBtuValue,
//     this.lbTurboIn,
//     this.lbTurboInTemp,
//     this.rbTurboIn,
//     this.rbTurboInTemp,
//     this.lbTurboOut,
//     this.lbTurboOutTemp,
//     this.rbTurboOut,
//     this.rbTurboOutTemp,
//     this.missFireDetected,
//     this.throttleActuatorPosition,
//     this.fuelValue,
//     this.engineOilPressure,
//     this.oilPressureDifferential,
//     this.oilPressureDifferentialTextField,
//     this.oilTemperatureIn,
//     this.oilTemperatureOut,
//     this.oilLevelEngine,
//     this.engineCoolantPressure,
//     this.engineCoolantPressureRadioValue,
//     this.jacketWaterLevel,
//     this.auxiliaryCoolantLevel1,
//     this.jacketWaterTemperaturesIn,
//     this.jacketWaterTemperaturesOut,
//     this.auxCoolantTemperaturesIn,
//     this.auxCoolantTemperaturesOut,
//     this.inletAirTemp,
//     this.inletAirTempRadio,
//     this.inletAirPressure,
//     this.inletAirPressureRadio,
//     this.primaryFuelPressure,
//     this.actualAirToFuelRatio,
//     this.crankcasePressure,
//     this.airFilterRestriction,
//     this.airFilterRestrictionRadio,
//     this.hydraulicOil,
//     this.anyLeaksFound,
//     this.excessiveVibrationAndOddNoises,
//     this.excessiveVibrationAndOddNoisesDescription,
//     this.problemsWithDriver,
//     this.problemsWithDriverDescription,
//
//     //Page3 -> 38 fields
//     this.intakeValueSet,
//     this.intakeValueSetRadioValue,
//     this.exhaustValueSet,
//     this.exhaustValueSetRadioValue,
//     this.majorValueRecessionDetected,
//     this.boroscopeRecommended,
//     this.boroscopeInspectionCompleted,
//     this.installNewSparkplugs,
//     this.sparkplugGap,
//     this.sparkplugExtensionInstalled,
//     this.newExtensionInstalled,
//     this.listOfNewExtensionInstalled,
//     this.sparkplugWireCondition,
//     this.listOfSparkplugWireCondition,
//     this.cannonPlugConnectorsTight,
//     this.listOfTransformerCoilsReplaced,
//     this.crankcaseBreatherInspection,
//     this.newBreatherElementInstalled,
//     this.checkAllCanonFan,
//     this.listOfCheckAllCanonFan,
//     this.coolantSystemCheck,
//     this.lubricationSystemCheck,
//     this.coolingSystemCheck,
//     this.checkFuelGasFilter,
//     this.fuelGasFilterFound,
//     this.airFilterInspection,
//     this.turboChargerInspection,
//     this.carburetorInternalCleaningInspection,
//     this.engineOilFilterChange,
//     this.engineOilFilterChange2,
//     this.oilCoolerDrained,
//     this.hydraulicOilFilterChange,
//     this.hydraulicOilNew,
//     this.engineOilSystemPrimed,
//     this.oilDrainIsolationValvesShutIn,
//     this.dayTankFiltersInstalledNew,
//     this.dayTankValvesOpen,
//
//     //Page4 -> 12 fields
//     this.oilPressureEngineAndGood,
//     this.engineOilLevel,
//     this.jacketWaterCoolantLevel,
//     this.auxiliaryCoolantLevel2,
//     this.temperatureAndPressureCheck,
//     this.noisesOrVibrationsDetected,
//     this.engineExhaustGasCheckedAndAdjustedAtMaxLoad,
//     this.documentFinalSetPointExhaustGasOxygenOrCOLevels,
//     this.documentFinalManifoldPressureAndRPM,
//     this.engineDeficienciesRadio,
//     this.engineDeficienciesTextfield,
//     this.partsOrderingStatus,
//   });
//
//   factory TaskModel.fromJson(Map<String, dynamic> json) {
//     return TaskModel(
//       //Page1
//       userId: json['user'],
//       name: json['name'],
//       customerEmail: json['customer_email'],
//       setUnits: json['unit'],
//       unitHours: json['unit_hours'],
//       selectedDate: json['date'],
//       selectedTime: json['time'],
//       engineBrand: json['engine_brand'],
//       nameOfJourneyMan: json['name_journey_man'],
//       unitOnlineOnArrival: json['unit_online_arrival'],
//       jobScope: json['job_scope'],
//       operationalProblems: json['problems'],
//       modelNumber: json['model_number'],
//       serialNumber: json['serial_number'],
//       arrangementNumber: json['arrangement_number'],
//       oilSamplesTaken: json['is_oil_sample_taken'],
//       //Page2
//       engineLoad: json['engine_load'],
//       engineRPM: json['engine_rpm'],
//       ignitionTiming: json['btdc'],
//       exhaustGasSampleFound: json['gas_sample_as_found'],
//       leftBankFound: json['lb_bank_as_gas_found'],
//       rightBankFound: json['rb_bank_as_gas_found'],
//       exhaustGasSampleAdjusted: json['gas_sample_as_adjusted'],
//       leftBankAdjusted: json['lb_bank_as_gas_adjusted'],
//       rightBankAdjusted: json['rb_bank_as_gas_adjusted'],
//       btuValue: json['btdc_value'],
//       selectedBtuValue: json['btu_type'],
//       missFireDetected: json['is_misfires_detected'],
//       throttleActuatorPosition: json['throttle_actuator_position'],
//       fuelValue: json['throttle_actuator_fuel_value'],
//       engineOilPressure: json['engine_oil_pressure_psi'],
//       oilPressureDifferential:
//           json['engine_oil_pressure_differential_filter_na'],
//       oilPressureDifferentialTextField:
//           json['oil_pressure_differential_filter'],
//       oilTemperatureIn: json['oil_temperature_in'],
//       oilTemperatureOut: json['oil_temperature_out'],
//       oilLevelEngine: json['oil_engine_level'],
//       engineCoolantPressure: json['engine_coolant_value'],
//       engineCoolantPressureRadioValue: json['engine_coolant_type'],
//       jacketWaterLevel: json['jacket_water_level'],
//       auxiliaryCoolantLevel1: json['auxiliary_coolant'],
//       jacketWaterTemperaturesIn: json['jacket_water_temperature_in'],
//       jacketWaterTemperaturesOut: json['jacket_water_temperature_out'],
//       auxCoolantTemperaturesIn: json['coolant_temperature_in'],
//       auxCoolantTemperaturesOut: json['coolant_temperature_out'],
//
//       inletAirTemp: json['inlet_air_temperature_value'],
//       inletAirTempRadio: json['inlet_air_temperature_type'],
//       inletAirPressure: json['inlet_air_pressure_value'],
//       inletAirPressureRadio: json['inlet_air_pressure_type'],
//       primaryFuelPressure: json['primary_fuel_pressure_psi'],
//       actualAirToFuelRatio: json['cranK_case_fuel_ratio'],
//       crankcasePressure: json['vaccum_crank_case_pressure'],
//       airFilterRestriction: json['airfilter_restriction_value'],
//       airFilterRestrictionRadio: json['airfilter_restriction_type'],
//       hydraulicOil: json['cranK_case_HYDRAULIC_oil_condition'],
//       anyLeaksFound: json['is_leakage_found'],
//       excessiveVibrationAndOddNoises: json['is_excessive_vibration'],
//       excessiveVibrationAndOddNoisesDescription:
//           json['excessive_vibration_description'],
//       problemsWithDriver: json['is_in_driving_problem'],
//       problemsWithDriverDescription: json['driving_problem_description'],
//       //Page3
//       intakeValueSet: json['intake_value'],
//       intakeValueSetRadioValue: json['intake_type'],
//       exhaustValueSet: json['exhaust_value'],
//       exhaustValueSetRadioValue: json['exhaust_type'],
//       majorValueRecessionDetected: json['major_value_detected'],
//       boroscopeRecommended: json['boroscope_recommended'],
//       boroscopeInspectionCompleted: json['boroscope_inspection_completed'],
//       installNewSparkplugs: json['install_new_spark_plug'],
//       sparkplugGap: json['sparkplug_gap'],
//       sparkplugExtensionInstalled: json['extension_installed'],
//       newExtensionInstalled: json['any_new_extension'],
//       listOfNewExtensionInstalled: json['replace_extension_list'],
//       sparkplugWireCondition: json['spark_wire_condition'],
//       listOfSparkplugWireCondition: json['spark_wire_condition_value'], //??
//       cannonPlugConnectorsTight: json['canNOn_plug_tight'],
//       listOfTransformerCoilsReplaced: json['replaced_list_transformer_coils'],
//       crankcaseBreatherInspection: json['crankcase_inspection'],
//       newBreatherElementInstalled: json['new_breather_element_installed'],
//       //
//       checkAllCanonFan: json['belts_coolers'],
//       listOfCheckAllCanonFan: json[''],
//       coolantSystemCheck: json[''],
//       lubricationSystemCheck: json[''],
//       //
//       coolingSystemCheck: json['coolant_system_leakage_greasers'],
//       checkFuelGasFilter: json['fuel_gas_filter'],
//       fuelGasFilterFound: json['fuel_gas_filter_found'],
//       airFilterInspection: json['air_filter_inspection'],
//       turboChargerInspection: json['turbo_charges_inspection'],
//       carburetorInternalCleaningInspection: json['carburetor_inspection'],
//       engineOilFilterChange: json['engine_oil_filter_ask'],
//       engineOilFilterChange2: json['engine_oil_filter_value'],
//       oilCoolerDrained: json['oil_cooler_drained'],
//       hydraulicOilFilterChange: json['hyraulic_oil_filter'],
//       hydraulicOilNew: json['hyraulic_oil_new'],
//       engineOilSystemPrimed: json['oil_level_correct'],
//       oilDrainIsolationValvesShutIn: json['oil_drained_isolation'],
//       dayTankFiltersInstalledNew: json['tank_filter'],
//       dayTankValvesOpen: json['tank_values_open'],
//       //Page4
//       oilPressureEngineAndGood: json['oil_pressure_engine_good'],
//       engineOilLevel: json['engine_oil_level'],
//       jacketWaterCoolantLevel: json['jacket_water_coolant_level'],
//       auxiliaryCoolantLevel2: json['auxiliary_coolant_level'],
//       temperatureAndPressureCheck: json['temperature_pressure_checks'],
//       noisesOrVibrationsDetected: json['NOise_vibration_detected'],
//       engineExhaustGasCheckedAndAdjustedAtMaxLoad:
//           json['engine_exhaust_gas_adjusted'],
//       documentFinalSetPointExhaustGasOxygenOrCOLevels:
//           json['document_final_set_points'],
//       documentFinalManifoldPressureAndRPM:
//           json['document_final_manifold_pressure'],
//       engineDeficienciesRadio: json['engine_deficiencies_repaired_future'],
//       engineDeficienciesTextfield: json[''], //Missing
//       partsOrderingStatus: json['part_repaired_order'],
//     );
//   }
// }
