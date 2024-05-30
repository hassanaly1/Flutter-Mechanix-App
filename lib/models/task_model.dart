class TaskModel {
  //Page1
  String? name;
  String? userId;
  String? taskId;
  String? customerEmail;
  int? unit;
  int? unitHours;
  String? date;
  String? time;
  String? engineBrandId;
  String? nameJourneyMan;
  String? unitOnlineArrival;
  String? jobScope;
  String? problems;
  int? modelNumber;
  int? serialNumber;
  int? arrangementNumber;
  String? isOilSampleTaken;

  //Page2
  int? engineLoad;
  int? engineRpm;
  int? btdc;
  List<String>? gasSampleAsFound;
  int? lbBankAsGasFound;
  int? rbBankAsGasFound;
  List<String>? gasSampleAsAdjusted;
  int? lbBankAsGasAdjusted;
  int? rbBankAsGasAdjusted;
  int? btdcValue;
  String? btuType;
  String? isMisfiresDetected;
  int? throttleActuatorPosition;
  int? throttleActuatorFuelValue;
  int? engineOilPressurePsi;
  int? oilPressureDifferentialFilter;
  String? engineOilPressureDifferentialFilterNa;
  int? oilTemperatureIn;
  int? oilTemperatureOut;
  String? oilEngineLevel;
  int? engineCoolantValue;
  String? engineCoolantType;
  String? jacketWaterLevel;
  String? auxiliaryCoolant;
  int? jacketWaterTemperatureIn;
  int? jacketWaterTemperatureOut;
  int? coolantTemperatureIn;
  int? coolantTemperatureOut;
  String? inletAirTemperatureType;
  int? inletAirTemperatureValue;
  String? inletAirPressureType;
  int? inletAirPressureValue;
  int? primaryFuelPressurePsi;
  int? cranKCaseFuelRatio;
  int? vaccumCrankCasePressure;
  int? airfilterRestrictionValue;
  String? airfilterRestrictionType;
  String? cranKCaseHydraulicOilCondition;
  String? isLeakageFound;
  String? isExcessiveVibration;
  String? excessiveVibrationDescription;
  String? isInDrivingProblem;
  String? drivingProblemDescription;

  //Page3
  int? intakeValue;
  String? intakeType;
  int? exhaustValue;
  String? exhaustType;
  String? majorValueDetected;
  String? boroscopeRecommended;
  String? boroscopeInspectionCompleted;
  String? installNewSparkPlug;
  int? sparkplugGap;
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

  //Page4
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
    this.userId,
    this.taskId,
    this.customerEmail,
    this.unit,
    this.unitHours,
    this.date,
    this.time,
    this.engineBrandId,
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
        userId: json["user"],
        taskId: json["_id"],
        customerEmail: json["customer_email"],
        unit: json["unit"],
        unitHours: json["unit_hours"],
        date: json["date"],
        time: json["time"],
        engineBrandId: json["engine_brand"],
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
        gasSampleAsFound: json['gas_sample_as_found'] != null
            ? List<String>.from(json['gas_sample_as_found'])
            : [],
        lbBankAsGasFound: json["lb_bank_as_gas_found"],
        rbBankAsGasFound: json["rb_bank_as_gas_found"],
        gasSampleAsAdjusted: json['gas_sample_as_adjusted'] != null
            ? List<String>.from(json['gas_sample_as_adjusted'])
            : [],
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
        "user": userId ?? "",
        "customer_email": customerEmail ?? "",
        "unit": unit ?? 0,
        "unit_hours": unitHours ?? 0,
        "date": date ?? "",
        "time": time ?? "",
        "engine_brand": engineBrandId ?? "",
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
        'gas_sample_as_found': gasSampleAsFound ?? [],
        "lb_bank_as_gas_found": lbBankAsGasFound ?? 0,
        "rb_bank_as_gas_found": rbBankAsGasFound ?? 0,
        'gas_sample_as_adjusted': gasSampleAsAdjusted ?? [],
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
            engineOilPressureDifferentialFilterNa ?? "NA",
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
