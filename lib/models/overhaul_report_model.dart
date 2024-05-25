// To parse this JSON data, do
// final overHaulReport = overHaulReportFromJson(jsonString);

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverHaulReport {
  CustomerEngineInfo? customerEngineInfo;
  EngineAssembly? engineAssembly;
  EngineAssemblyReportCont? engineAssemblyReportCont;
  GearTrain? gearTrain;
  EngineAssemblyPartsExchangeCatalog? engineAssemblyPartsExchangeCatalog;
  String? type;

  OverHaulReport({
    this.customerEngineInfo,
    this.engineAssembly,
    this.engineAssemblyReportCont,
    this.gearTrain,
    this.engineAssemblyPartsExchangeCatalog,
    this.type,
  });
}

class CustomerEngineInfo {
  final customer = TextEditingController(),
      workorder = TextEditingController(),
      location = TextEditingController(),
      lsd = TextEditingController(),
      unit = TextEditingController(),
      unitHours = TextEditingController(),
      engineMake = TextEditingController(),
      engineModel = TextEditingController(),
      engineSerial = TextEditingController(),
      engineArrangement = TextEditingController(),
      customerContact = TextEditingController(),
      mechanic1 = TextEditingController(),
      mechanic2 = TextEditingController();
  DateTime? date;

  void fromJson(Map<String, dynamic> json) {
    customer.text = json["customer"].toString();
    workorder.text = json["workorder"].toString();
    location.text = json["location"].toString();
    lsd.text = json["lsd"].toString();
    unit.text = json["unit"].toString();
    unitHours.text = json["unitHours"].toString();
    // json["date"] == null ? null : DateTime.parse(json["date"]);
    engineMake.text = json["engineMake"];
    engineModel.text = json["engineModel"];
    engineSerial.text = json["engineSerial"];
    engineArrangement.text = json["engineArrangement"];
    customerContact.text = json["customerContact"];
    mechanic1.text = json["mechanic1"];
    mechanic2.text = json["mechanic2"];
    // List<String>.from(json["mechanic"]!.map((x) => x))
  }

  Map<String, dynamic> toMap() => {
        "customer": customer.text.trim(),
        "workorder": workorder.text.trim(),
        "location": location.text.trim(),
        "lsd": lsd.text.trim(),
        "unit": unit.text.trim(),
        "unit_hours": unitHours.text.trim(),
        // "date":
        //     "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "engine_make": engineMake.text.trim(),
        "engine_model": engineModel.text.trim(),
        "engine_serial": engineSerial.text.trim(),
        "engine_arrangement": engineArrangement.text.trim(),
        "customer_contact": customerContact.text.trim(),
        "mechanic1": mechanic1.text.trim(),
        "mechanic2": mechanic2.text.trim(),
        // "mechanic":
        //     mechanic == null ? [] : List<dynamic>.from(mechanic!.map((x) => x)),
      };
}

class EngineAssembly {
  final int count;

  EngineAssembly({required this.count}) {
    for (int i = 0; i < count; i++) {
      engineAssemblyReportIndicateWhichOne.add(TextEditingController());
      engineReportIndicateWhichOne.add(TextEditingController());
    }
  }

  final engineBlocks = Rx<String?>(null),
      lineBorePerformed = Rx<String?>(null),
      magCheckedForCracks = Rx<String?>(null),
      linerFitsRepaired = Rx<String?>(null),
      engineCrankshaft = Rx<String?>(null);
  final lineBorePerformedCompany = TextEditingController(),
      magCheckedCompany = TextEditingController(),
      linerFitsRepairedCompany = TextEditingController(),
      plastiGuageReadingsOneMainBearingSpec = TextEditingController(),
      plastiGuageReadingsOneMainBearingActual = TextEditingController(),
      endPlaySpec = TextEditingController(),
      endPlayActual = TextEditingController();
  final List<TextEditingController> engineAssemblyReportIndicateWhichOne = [],
      engineReportIndicateWhichOne = [];

  Map<String, dynamic> toMap() => {
        "engine_blocks": engineBlocks.value,
        "line_bore_performed": lineBorePerformed.value,
        "line_bore_performed_company": lineBorePerformedCompany.text.trim(),
        "mag_checked_company": magCheckedCompany.text.trim(),
        "linear_fits_repaired_company": linerFitsRepairedCompany.text.trim(),
        "mag_checked_for_cracks": magCheckedForCracks.value,
        "liner_fits_repaired": linerFitsRepaired.value,
        "engine_assembly_report_indicate_which_one": List<String>.from(
            engineAssemblyReportIndicateWhichOne.map((x) => x.text.trim())),
        "engine_crankshaft": engineCrankshaft.value,
        "plasti_guage_readings_one_main_bearing_spec":
            plastiGuageReadingsOneMainBearingSpec.text.trim(),
        "plasti_guage_readings_one_main_bearing_actual":
            plastiGuageReadingsOneMainBearingActual.text.trim(),
        "engine_report_indicate_which_one": List<dynamic>.from(
            engineReportIndicateWhichOne.map((x) => x.text.trim())),
        "end_play_spec": endPlaySpec.text.trim(),
        "end_play_actual": endPlayActual.text.trim(),
      };

// factory EngineAssembly.fromJson(Map<String, dynamic> json) => EngineAssembly(
//       engineBlocks: json["engine_blocks"],
//       lineBorePerformed: json["line_bore_performed"],
//       company: json["company"],
//       magCheckedForCracks: json["mag_checked_for_cracks"],
//       linerFitsRepaired: json["liner_fits_repaired"],
//       engineAssemblyReportIndicateWhichOne:
//           json["engine_assembly_report_indicate_which_one"] == null
//               ? []
//               : List<String>.from(
//                   json["engine_assembly_report_indicate_which_one"]!
//                       .map((x) => x)),
//       engineCrankshaft: json["engine_crankshaft"],
//       plastiGuageReadingsOneMainBearingSpec:
//           json["plasti_guage_readings_one_main_bearing_spec"],
//       plastiGuageReadingsOneMainBearingActual:
//           json["plasti_guage_readings_one_main_bearing_actual"],
//       engineReportIndicateWhichOne:
//           json["engine_report_indicate_which_one"] == null
//               ? []
//               : List<String>.from(
//                   json["engine_report_indicate_which_one"]!.map((x) => x)),
//       endPlaySpec: json["end_play_spec"],
//       endPlayActual: json["end_play_actual"],
//     );
}

class EngineAssemblyReportCont {
  final int count;

  EngineAssemblyReportCont({required this.count}) {
    print('--------------------------object-------------------');
    for (int i = 0; i < count; i++) {
      connectingRodsIndicateWhichOne.add(TextEditingController());
      actualReading.add(TextEditingController());
      indicateNewPins.add(TextEditingController());
      indicateNewPistons.add(TextEditingController());
      ringClearancesInLiners
          .add(List.generate(4, (_) => TextEditingController()));
      ringClearancesInPistons
          .add(List.generate(4, (_) => TextEditingController()));
      indicateNewLiners.add(TextEditingController());
      indicateCylinderHeads.add(TextEditingController());
      rockerShaftAssembliesIndicateWhichOne.add(TextEditingController());
      injectorTrimCodes.add(TextEditingController());
    }
  }

  ///String
  final reasonIfMainBearingsNotReplaced = TextEditingController(),
      numbersOfUpperShell = TextEditingController(),
      numbersOfLowerShell = TextEditingController(),
      mainBearingTorquedSpec = TextEditingController(),
      crossTiesTorquedSpec = TextEditingController(),
      counterWeightsTorquedSpec = TextEditingController(),
      vibrationDampenerReplacedTorquedSpec = TextEditingController(),
      frontAndRearSealsReplacedDescFront = TextEditingController(),
      frontAndRearSealsReplacedDescRear = TextEditingController(),
      reasonIfNotConnectingRodBearingsReplaced = TextEditingController(),
      rodBearingCapsTorquedSpec = TextEditingController(),
      connectingRodSideClearanceCheckedSpec = TextEditingController(),
      cylinderHeadSpec = TextEditingController(),
      rockerShaftAssembliesSpec = TextEditingController(),
      camshaftBearingTorquedSpec = TextEditingController(),
      camshaftEndPlayCheckedSpec = TextEditingController(),
      camshaftEndPlayCheckActual = TextEditingController(),
      bridgesSettings = TextEditingController(),
      valveIntake = TextEditingController(),
      valveExhaust = TextEditingController(),
      valveInjector = TextEditingController();

  ///Bool
  final mainBearingsReplaced = Rx<String?>(null),
      mainBearingTorqued = Rx<String?>(null),
      thrustBearingsReplaced = Rx<String?>(null),
      crossTiesTorqued = Rx<String?>(null),
      counterWeightsTorqued = Rx<String?>(null),
      vibrationDampenerReplacedTorqued = Rx<String?>(null),
      frontAndRearSealsReplaced = Rx<String?>(null),
      connectingRods = Rx<String?>(null),
      connectingRodBearingsReplaced = Rx<String?>(null),
      rodBearingCapsTorqued = Rx<String?>(null),
      connectingRodSideClearanceChecked = Rx<String?>(null),
      pistonPins = Rx<String?>(null),
      pistons = Rx<String?>(null),
      linerPacks = Rx<String?>(null),
      cylinderLiners = Rx<String?>(null),
      linerORingsReplaced = Rx<String?>(null),
      cylinderHeads = Rx<String?>(null),
      cylinderHeadsBool = Rx<String?>(null),
      rockerShaftAssemblies = Rx<String?>(null),
      rockerShaftAssembliesBool = Rx<String?>(null),
      pushRods = Rx<String?>(null),
      camshaft = Rx<String?>(null),
      camshaftBearingReplaced = Rx<String?>(null),
      camshaftBearingTorqued = Rx<String?>(null),
      camshaftEndPlayChecked = Rx<String?>(null),
      camFollowers = Rx<String?>(null),
      bridges = Rx<String?>(null);
  final List<TextEditingController> connectingRodsIndicateWhichOne = [],
      actualReading = [],
      indicateNewPins = [],
      indicateNewPistons = [],
      indicateNewLiners = [],
      indicateCylinderHeads = [],
      rockerShaftAssembliesIndicateWhichOne = [],
      injectorTrimCodes = [];
  final List<List<TextEditingController>> ringClearancesInLiners = [],
      ringClearancesInPistons = [];

  Map<String, dynamic> toMap() => {
        "main_bearings_replaced": mainBearingsReplaced.value,
        "reason_if_main_bearings_not_replaced":
            reasonIfMainBearingsNotReplaced.text.trim(),
        "numbers_of_upper_shell": numbersOfUpperShell.text.trim(),
        "numbers_of_lower_shell": numbersOfLowerShell.text.trim(),
        "main_bearing_torqued": mainBearingTorqued.value,
        "main_bearing_torqued_spec": mainBearingTorquedSpec.text.trim(),
        "thrust_bearings_replaced": thrustBearingsReplaced.value,
        "cross_ties_torqued": crossTiesTorqued.value,
        "cross_ties_torqued_spec": crossTiesTorquedSpec.text.trim(),
        "counter_weights_torqued": counterWeightsTorqued.value,
        "counter_weights_torqued_spec": counterWeightsTorquedSpec.text.trim(),
        "vibration_dampener_replaced_torqued":
            vibrationDampenerReplacedTorqued.value,
        "vibration_dampener_replaced_torqued_spec":
            vibrationDampenerReplacedTorquedSpec.text.trim(),
        "front_and_rear_seals_replaced": frontAndRearSealsReplaced.value,
        "front_and_rear_seals_replaced_desc_front":
            frontAndRearSealsReplacedDescFront.text.trim(),
        "front_and_rear_seals_replaced_desc_rear":
            frontAndRearSealsReplacedDescRear.text.trim(),
        "connecting_rods": connectingRods.value,
        "connecting_rods_indicate_which_one": List<String>.from(
            connectingRodsIndicateWhichOne.map((x) => x.text.trim())),
        "connecting_rod_bearings_replaced": connectingRodBearingsReplaced.value,
        "reason_if_not_connecting_rod_bearings_replaced":
            reasonIfNotConnectingRodBearingsReplaced.text.trim(),
        "rod_bearing_caps_torqued": rodBearingCapsTorqued.value,
        "rod_bearing_caps_torqued_spec": rodBearingCapsTorquedSpec.text.trim(),
        "connecting_rod_side_clearance_checked":
            connectingRodSideClearanceChecked.value,
        "connecting_rod_side_clearance_checked_spec":
            connectingRodSideClearanceCheckedSpec.text.trim(),
        "actual_reading":
            List<String>.from(actualReading.map((x) => x.text.trim())),
        "piston_pins": pistonPins.value,
        "indicate_new_pins":
            List<String>.from(indicateNewPins.map((x) => x.text.trim())),
        "pistons": pistons.value,
        "indicate_new_pistons":
            List<String>.from(indicateNewPistons.map((x) => x.text.trim())),
        "liner_packs": linerPacks.value,
        "ring_clearances_in_liners": List<List<String>>.from(
            ringClearancesInLiners
                .map((x) => x.map((e) => e.text.trim()).toList())),
        "ring_clearances_in_pistons": List<List<String>>.from(
            ringClearancesInPistons
                .map((x) => x.map((e) => e.text.trim()).toList())),
        "cylinder_liners": cylinderLiners.value,
        "indicate_new_liners":
            List<String>.from(indicateNewLiners.map((x) => x.text.trim())),
        "liner_o_rings_replaced": linerORingsReplaced.value,
        "cylinder_heads": cylinderHeads.value,
        "cylinder_heads_bool": cylinderHeadsBool.value,
        "indicate_cylinder_heads":
            List<String>.from(indicateCylinderHeads.map((x) => x.text.trim())),
        "cylinder_head_spec": cylinderHeadSpec.text.trim(),
        "rocker_shaft_assemblies": rockerShaftAssemblies.value,
        "rocker_shaft_assemblies_indicate_which_one": List<String>.from(
            rockerShaftAssembliesIndicateWhichOne.map((x) => x.text.trim())),
        "rocker_shaft_assemblies_bool": rockerShaftAssembliesBool.value,
        "rocker_shaft_assemblies_spec": rockerShaftAssembliesSpec.text.trim(),
        "push_rods": pushRods.value,
        "camshaft": camshaft.value,
        "camshaft_bearing_replaced": camshaftBearingReplaced.value,
        "camshaft_bearing_torqued": camshaftBearingTorqued.value,
        "camshaft_bearing_torqued_spec": camshaftBearingTorquedSpec.text.trim(),
        "camshaft_end_play_checked": camshaftEndPlayChecked.value,
        "camshaft_end_play_checked_spec":
            camshaftEndPlayCheckedSpec.text.trim(),
        "camshaft_end_play_check_actual":
            camshaftEndPlayCheckActual.text.trim(),
        "cam_followers": camFollowers.value,
        "bridges": bridges.value,
        "bridges_settings": bridgesSettings.text.trim(),
        "valve_intake": valveIntake.text.trim(),
        "valve_exhaust": valveExhaust.text.trim(),
        "valve_injector": valveInjector.text.trim(),
        "injector_trim_codes":
            List<String>.from(injectorTrimCodes.map((x) => x.text.trim())),
      };

  void fromJson(Map<String, dynamic> json) {
    mainBearingsReplaced.value = json["main_bearings_replaced"];
    reasonIfMainBearingsNotReplaced.text =
        json["reason_if_main_bearings_not_replaced"];
    numbersOfUpperShell.text = json["numbers_of_upper_shell"];
    numbersOfLowerShell.text = json["numbers_of_lower_shell"];
    mainBearingTorqued.value = json["main_bearing_torqued"];
    mainBearingTorquedSpec.text = json["main_bearing_torqued_spec"];
    thrustBearingsReplaced.value = json["thrust_bearings_replaced"];
    crossTiesTorqued.value = json["cross_ties_torqued"];
    crossTiesTorquedSpec.text = json["cross_ties_torqued_spec"];
    counterWeightsTorqued.value = json["counter_weights_torqued"];
    counterWeightsTorquedSpec.text = json["counter_weights_torqued_spec"];
    vibrationDampenerReplacedTorqued.value =
        json["vibration_dampener_replaced_torqued"];
    frontAndRearSealsReplaced.value = json["front_and_rear_seals_replaced"];
    frontAndRearSealsReplacedDescFront.text =
        json["front_and_rear_seals_replaced_desc_front"];
    frontAndRearSealsReplacedDescRear.text =
        json["front_and_rear_seals_replaced_desc_rear"];
    connectingRods.value = json["connecting_rods"];
    // connectionRodsIndicateWhichOne.addAll(
    //     json["connecting_rods_indicate_which_one"] == null
    //         ? []
    //         : List<TextEditingController>.from(
    //             json["connecting_rods_indicate_which_one"]!
    //                 .map((x) => TextEditingController())));
    connectingRodBearingsReplaced.value =
        json["connecting_rod_bearings_replaced"];
    reasonIfNotConnectingRodBearingsReplaced.text =
        json["reason_if_not_connecting_rod_bearings_replaced"];
    rodBearingCapsTorqued.value = json["rod_bearing_caps_torqued"];
    rodBearingCapsTorquedSpec.text = json["rod_bearing_caps_torqued_spec"];
    connectingRodSideClearanceChecked.value =
        json["connecting_rod_side_clearance_checked"];
    connectingRodSideClearanceCheckedSpec.text =
        json["connecting_rod_side_clearance_checked_spec"];
    // actualReading: json["actual_reading"] == null
    // ? []
    //     : List<String>.from(json["actual_reading"]!.map((x) => x)),
    pistonPins.value = json["piston_pins"];
    // indicateNewPistons: json["indicate_new_pistons"] == null
    // ? []
    //     : List<String>.from(json["indicate_new_pistons"]!.map((x) => x)),
    pistons.value = json["pistons"];
    // indicateNewPins: json["indicate_new_pins"] == null
    // ? []
    //     : List<String>.from(json["indicate_new_pins"]!.map((x) => x)),
    linerPacks.value = json["liner_packs"];
    // ringClearancesLinear: json["ring_clearances_in_liners"] == null
    // ? []
    //     : List<RingClearances>.from(json["ring_clearances_in_liners"]!
    //     .map((x) => RingClearances.fromJson(x))),
    // ringClearancesPistons: json["ring_clearances_in_pistons"] == null
    // ? []
    //     : List<RingClearances>.from(json["ring_clearances_in_pistons"]!
    //     .map((x) => RingClearances.fromJson(x))),
    cylinderLiners.value = json["cylinder_liners"];
    // indicateNewLiners: json["indicate_new_liners"] == null
    // ? []
    //     : List<String>.from(json["indicate_new_liners"]!.map((x) => x)),
    linerORingsReplaced.value = json["liner_o_rings_replaced"];
    cylinderHeads.value = json["cylinder_heads"];
    cylinderHeadsBool.value = json["cylinder_heads_bool"];
    // indicateCylinderHeads: json["indicate_cylinder_heads"] == null
    // ? []
    //     : List<String>.from(json["indicate_cylinder_heads"]!.map((x) => x)),
    cylinderHeadSpec.text = json["cylinder_head_spec"];
    rockerShaftAssemblies.value = json["rocker_shaft_assemblies"];
    // rockerShaftAssembliesIndicateWhichOne:
    // json["rocker_shaft_assemblies_indicate_which_one"] == null
    // ? []
    //     : List<String>.from(
    // json["rocker_shaft_assemblies_indicate_which_one"]!
    //     .map((x) => x)),
    rockerShaftAssembliesBool.value = json["rocker_shaft_assemblies_bool"];
    rockerShaftAssembliesSpec.text = json["rocker_shaft_assemblies_spec"];
    pushRods.value = json["push_rods"];
    camshaft.value = json["camshaft"];
    camshaftBearingReplaced.value = json["camshaft_bearing_replaced"];
    camshaftBearingTorqued.value = json["camshaft_bearing_torqued"];
    camshaftBearingTorquedSpec.text = json["camshaft_bearing_torqued_spec"];
    camshaftEndPlayChecked.value = json["camshaft_end_play_checked"];
    camshaftEndPlayCheckedSpec.text = json["camshaft_end_play_checked_spec"];
    camshaftEndPlayCheckActual.text = json["camshaft_end_play_check_actual"];
    camFollowers.value = json["cam_followers"];
    bridges.value = json["bridges"];
    bridgesSettings.text = json["bridges_settings"];
    valveIntake.text = json["valve_intake"];
    valveExhaust.text = json["valve_exhaust"];
    valveInjector.text = json["valve_injector"];
    // injectorTrimCodes: json["injector_trim_codes"] == null
    // ? []
    //     : List<String>.from(json["injector_trim_codes"]!.map((x) => x)),
  }
}

class GearTrain {
  Rx<String?> gear = Rx<String?>(null);
  Rx<String?> camGear = Rx<String?>(null);
  Rx<String?> accessoryGear = Rx<String?>(null);
  Rx<String?> idlerGear = Rx<String?>(null);
  Rx<String?> indicateBacklash = Rx<String?>(null);
  Rx<String?> betweenEachMatingGears = Rx<String?>(null);
  Rx<String?> spindleTorque = Rx<String?>(null);
  final gearBacklash = TextEditingController();
  final camGearBacklash = TextEditingController();
  final accessoryGearBacklash = TextEditingController();
  final idlerGearBacklash = TextEditingController();
  final indicateBacklashBacklash = TextEditingController();
  final betweenEachMatingGearsBacklash = TextEditingController();
  final spindleTorqueBacklash = TextEditingController();

  Map<String, dynamic> toMap() => {
        "gear": gear.value,
        "cam_gear": camGear.value,
        "accessory_gear": accessoryGear.value,
        "ideal_gear": idlerGear.value,
        "indicate_backlash": indicateBacklash.value,
        "between_each_mating_gears": betweenEachMatingGears.value,
        "spindle_torque": spindleTorque.value,
        "gear_backlash": gearBacklash.text,
        "cam_gear_backlash": camGearBacklash.text,
        "accessory_gear_backlash": accessoryGearBacklash.text,
        "ideal_gear_backlash": idlerGearBacklash.text,
        "indicate_backlash_backlash": indicateBacklashBacklash.text,
        "between_each_mating_gears_backlash":
            betweenEachMatingGearsBacklash.text,
        "spindle_torque_backlash": spindleTorqueBacklash.text
      };

  void fromJson(Map<String, dynamic> json) {
    gear.value = json["gear"];
    camGear.value = json["cam_gear"];
    accessoryGear.value = json["accessory_gear"];
    idlerGear.value = json["ideal_gear"];
    indicateBacklash.value = json["indicate_backlash"];
    betweenEachMatingGears.value = json["between_each_mating_gears"];
    spindleTorque.value = json["spindle_torque"];
    gearBacklash.text = json["gear_backlash"];
    camGearBacklash.text = json["cam_gear_backlash"];
    accessoryGearBacklash.text = json["accessory_gear_backlash"];
    idlerGearBacklash.text = json["ideal_gear_backlash"];
    indicateBacklashBacklash.text = json["indicate_backlash_backlash"];
    betweenEachMatingGearsBacklash.text =
        json["between_each_mating_gears_backlash"];
    spindleTorqueBacklash.text = json["spindle_torque_backlash"];
  }
}

class EngineAssemblyPartsExchangeCatalog {
  final oilPump = Rx<String?>(null),
      oilWaterPump = Rx<String?>(null),
      auxWaterPump = Rx<String?>(null),
      starter = Rx<String?>(null),
      waterGate = Rx<String?>(null),
      trubo = Rx<String?>(null),
      oilFilters = Rx<String?>(null),
      airFilters = Rx<String?>(null),
      airBelts = Rx<String?>(null),
      accessoryDrive = Rx<String?>(null),
      interCooler = Rx<String?>(null),
      fuelInjectors = Rx<String?>(null),
      bridges = Rx<String?>(null),
      scavengePump = Rx<String?>(null),
      fuelFilters = Rx<String?>(null),
      fuelPump = Rx<String?>(null),
      preLubePump = Rx<String?>(null),
      preLubeMotor = Rx<String?>(null),
      carburetors = Rx<String?>(null),
      fuelRegulators = Rx<String?>(null),
      preChamber = Rx<String?>(null),
      regulators = Rx<String?>(null),
      governor = Rx<String?>(null),
      governorLinkages = Rx<String?>(null),
      preChamberCup = Rx<String?>(null),
      sparkPlugs = Rx<String?>(null),
      sparkPlugCarriers = Rx<String?>(null),
      magneto = Rx<String?>(null),
      coils = Rx<String?>(null),
      extension = Rx<String?>(null),
      ignitionHarness = Rx<String?>(null);

  final mechanic1MainBearingCap = TextEditingController(),
      mechanic2MainBearingCap = TextEditingController(),
      mechanic1ConnectingRodTorqued = TextEditingController(),
      mechanic2ConnectingRodTorqued = TextEditingController(),
      mechanic1ConnectingRodSide = TextEditingController(),
      mechanic2ConnectingRodSide = TextEditingController(),
      mechanic1AllInternalPlugs = TextEditingController(),
      mechanic2AllInternalPlugs = TextEditingController(),
      mechanic1CrankShaftEndPlay = TextEditingController(),
      mechanic2CrankShaftEndPlay = TextEditingController(),
      comments = TextEditingController();

  Map<String, dynamic> toMap() => {
        'oil_pump': oilPump.value,
        'oil_water_pump': oilWaterPump.value,
        'aux_water_pump': auxWaterPump.value,
        'starter': starter.value,
        'water_gate': waterGate.value,
        'trubo': trubo.value,
        'oil_filters': oilFilters.value,
        'air_filters': airFilters.value,
        'air_belts': airBelts.value,
        'accessory_drive': accessoryDrive.value,
        'inter_cooler': interCooler.value,
        'fuel_injectors': fuelInjectors.value,
        'bridges': bridges.value,
        'scavenge_pump': scavengePump.value,
        'fuel_filters': fuelFilters.value,
        'fuel_pump': fuelPump.value,
        'pre_lube_pump': preLubePump.value,
        'pre_lube_motor': preLubeMotor.value,
        'carburetors': carburetors.value,
        'fuel_regulators': fuelRegulators.value,
        'pre_chamber': preChamber.value,
        'regulators': regulators.value,
        'governor': governor.value,
        'governor_linkages': governorLinkages.value,
        'pre_chamber_cup': preChamberCup.value,
        'spark_plugs': sparkPlugs.value,
        'spark_plug_carriers': sparkPlugCarriers.value,
        'magneto': magneto.value,
        'coils': coils.value,
        'extension': extension.value,
        'ignition_harness': ignitionHarness.value,
        'mechanic1_main_bearing_cap': mechanic1MainBearingCap.text.trim(),
        'mechanic2_main_bearing_cap': mechanic2MainBearingCap.text.trim(),
        'mechanic1_connecting_rod_torqued':
            mechanic1ConnectingRodTorqued.text.trim(),
        'mechanic2_connecting_rod_torqued':
            mechanic2ConnectingRodTorqued.text.trim(),
        'mechanic1_connecting_rod_side': mechanic1ConnectingRodSide.text.trim(),
        'mechanic2_connecting_rod_side': mechanic2ConnectingRodSide.text.trim(),
        'mechanic1_all_internal_plugs': mechanic1AllInternalPlugs.text.trim(),
        'mechanic2_all_internal_plugs': mechanic2AllInternalPlugs.text.trim(),
        'mechanic1_crank_shaft_end_play':
            mechanic1CrankShaftEndPlay.text.trim(),
        'mechanic2_crank_shaft_end_play':
            mechanic2CrankShaftEndPlay.text.trim(),
        'comments': comments.text.trim(),
      };

  void fromJson(Map<String, dynamic> json) {
    oilPump.value = json['oil_pump'] as String?;
    oilWaterPump.value = json['oil_water_pump'] as String?;
    auxWaterPump.value = json['aux_water_pump'] as String?;
    starter.value = json['starter'] as String?;
    waterGate.value = json['water_gate'] as String?;
    trubo.value = json['trubo'] as String?;
    oilFilters.value = json['oil_filters'] as String?;
    airFilters.value = json['air_filters'] as String?;
    airBelts.value = json['air_belts'] as String?;
    accessoryDrive.value = json['accessory_drive'] as String?;
    interCooler.value = json['inter_cooler'] as String?;
    fuelInjectors.value = json['fuel_injectors'] as String?;
    bridges.value = json['bridges'] as String?;
    scavengePump.value = json['scavenge_pump'] as String?;
    fuelFilters.value = json['fuel_filters'] as String?;
    fuelPump.value = json['fuel_pump'] as String?;
    preLubePump.value = json['pre_lube_pump'] as String?;
    preLubeMotor.value = json['pre_lube_motor'] as String?;
    carburetors.value = json['carburetors'] as String?;
    fuelRegulators.value = json['fuel_regulators'] as String?;
    preChamber.value = json['pre_chamber'] as String?;
    regulators.value = json['regulators'] as String?;
    governor.value = json['governor'] as String?;
    governorLinkages.value = json['governor_linkages'] as String?;
    preChamberCup.value = json['pre_chamber_cup'] as String?;
    sparkPlugs.value = json['spark_plugs'] as String?;
    sparkPlugCarriers.value = json['spark_plug_carriers'] as String?;
    magneto.value = json['magneto'] as String?;
    coils.value = json['coils'] as String?;
    extension.value = json['extension'] as String?;
    ignitionHarness.value = json['ignition_harness'] as String?;
    mechanic1MainBearingCap.text =
        json['mechanic1_main_bearing_cap'] as String? ?? '';
    mechanic2MainBearingCap.text =
        json['mechanic2_main_bearing_cap'] as String? ?? '';
    mechanic1ConnectingRodTorqued.text =
        json['mechanic1_connecting_rod_torqued'] as String? ?? '';
    mechanic2ConnectingRodTorqued.text =
        json['mechanic2_connecting_rod_torqued'] as String? ?? '';
    mechanic1ConnectingRodSide.text =
        json['mechanic1_connecting_rod_side'] as String? ?? '';
    mechanic2ConnectingRodSide.text =
        json['mechanic2_connecting_rod_side'] as String? ?? '';
    mechanic1AllInternalPlugs.text =
        json['mechanic1_all_internal_plugs'] as String? ?? '';
    mechanic2AllInternalPlugs.text =
        json['mechanic2_all_internal_plugs'] as String? ?? '';
    mechanic1CrankShaftEndPlay.text =
        json['mechanic1_crank_shaft_end_play'] as String? ?? '';
    mechanic2CrankShaftEndPlay.text =
        json['mechanic2_crank_shaft_end_play'] as String? ?? '';
    comments.text = json['comments'] as String? ?? '';
  }
}
