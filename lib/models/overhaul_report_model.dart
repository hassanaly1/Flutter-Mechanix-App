// To parse this JSON data, do
// final overHaulReport = overHaulReportFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OverHaulReportModel {
  final String type;
  late String? taskId;
  late CustomerEngineInfo customerEngineInfo;
  late EngineAssembly engineAssembly;
  late EngineAssemblyReportCont engineAssemblyReportCont;
  late GearTrain gearTrain;
  late EngineAssemblyPartsExchangeCatalog engineAssemblyPartsExchangeCatalog;

  OverHaulReportModel({required this.type}) {
    int count = type == 'V8'
        ? 8
        : type == 'V12'
            ? 12
            : type == 'V16'
                ? 16
                : type == 'L7042GL C-14871'
                    ? 18
                    : 8;
    count = (count == 18) ? 12 : count;
    customerEngineInfo = CustomerEngineInfo();
    engineAssembly = EngineAssembly(count: count);
    engineAssemblyReportCont = EngineAssemblyReportCont(count: count);
    taskId = engineAssemblyReportCont.id.value;
    gearTrain = GearTrain();
    engineAssemblyPartsExchangeCatalog = EngineAssemblyPartsExchangeCatalog();
  }

  String finalToJson() {
    return jsonEncode({
      'customer_engine_info': customerEngineInfo.toJson(),
      'engine_assembly': engineAssembly.toJson(),
      'engine_assembly_report_cont': engineAssemblyReportCont.toJson(),
      'engine_assembly_parts_exchange_catalog':
          engineAssemblyPartsExchangeCatalog.toJson(),
      "type": type,
      "gear_train": gearTrain.toJson()
    });
  }

  static List<OverHaulReportModel> fromJsonList(List<dynamic> jsonList) {
    List<OverHaulReportModel> list = [];
    for (var json in jsonList) {
      OverHaulReportModel overHaulReport = OverHaulReportModel(
          type: json['engine_assembly_report_cont']['type']);
      overHaulReport.customerEngineInfo.fromJson(
        json['customer_engine_info'] ?? {},
      );
      overHaulReport.engineAssembly.fromJson(
        json['engine_assembly'] ?? {},
      );
      overHaulReport.engineAssemblyReportCont.fromJson(
        json['engine_assembly_report_cont'] ?? {},
      );
      overHaulReport.gearTrain.fromJson(
        json['gear_train'] ?? {},
      );

      overHaulReport.engineAssemblyPartsExchangeCatalog.fromJson(
        json['engine_assembly_parts_exchange_catalog'] ?? {},
      );
      // overHaulReport.customerEngineInfo.fromJson(
      //   json['customer_engine_info'] ?? {},
      // );
      // overHaulReport.engineAssembly.fromJson(json['engine_assembly']);
      // overHaulReport.engineAssemblyReportCont
      //     .fromJson(json['engine_assembly_report_cont']);
      // overHaulReport.gearTrain.fromJson(json['gear_train'][0]);
      // overHaulReport.engineAssemblyPartsExchangeCatalog
      //     .fromJson(json['engine_assembly_parts_exchange_catalog']);
      list.add(overHaulReport);
    }
    return list;
  }
}

class CustomerEngineInfo {
  final id = Rx<String?>(null);
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
  final date = Rx<String?>(null);

  fromJson(Map<String, dynamic> json) {
    DateTime parsedDate = DateTime.parse(json['date']);
    String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
    id.value = json["_id"];
    customer.text = json["customer"] ?? '';
    workorder.text = json["workorder"] ?? '';
    location.text = json["location"] ?? '';
    lsd.text = json["lsd"];
    unit.text = json["unit"];
    unitHours.text = json["unit_hours"];
    date.value = formattedDate;
    // date.value = (json['date']);
    engineMake.text = json["engine_make"];
    engineModel.text = json["engine_model"];
    engineSerial.text = json["engine_serial"];
    engineArrangement.text = json["engine_arrangement"];
    customerContact.text = json["customer_contact"];
    mechanic1.text = json["mechanic1"];
    mechanic2.text = json["mechanic2"];
  }

  Map<String, dynamic> toJson() => {
        "customer": customer.text.trim(),
        "workorder": workorder.text.trim(),
        "location": location.text.trim(),
        "lsd": lsd.text.trim(),
        "unit": unit.text.trim(),
        "unit_hours": unitHours.text.trim(),
        // "date": date,
        'date': date.value,
        "engine_make": engineMake.text.trim(),
        "engine_model": engineModel.text.trim(),
        "engine_serial": engineSerial.text.trim(),
        "engine_arrangement": engineArrangement.text.trim(),
        "customer_contact": customerContact.text.trim(),
        "mechanic1": mechanic1.text.trim(),
        "mechanic2": mechanic2.text.trim(),
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

  final id = Rx<String?>(null),
      engineBlocks = Rx<String?>(null),
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

  fromJson(Map<String, dynamic> json) {
    id.value = json["_id"] ?? '';
    engineBlocks.value = json["engine_blocks"] ?? '';
    lineBorePerformed.value = json["line_bore_performed"] ?? '';
    magCheckedForCracks.value = json["mag_checked_for_cracks"] ?? '';
    linerFitsRepaired.value = json["liner_fits_repaired"] ?? '';
    lineBorePerformedCompany.text = json["line_bore_performed_company"] ?? '';
    engineCrankshaft.value = json["engine_crankshaft"] ?? '';
    magCheckedCompany.text = json["mag_checked_company"] ?? '';
    linerFitsRepairedCompany.text = json["liner_fits_repaired_company"] ?? '';
    plastiGuageReadingsOneMainBearingSpec.text =
        json["plasti_guage_readings_one_main_bearing_spec"] ?? '';
    plastiGuageReadingsOneMainBearingActual.text =
        json["plasti_guage_readings_one_main_bearing_actual"] ?? '';
    endPlaySpec.text = json["end_play_spec"] ?? '';
    endPlayActual.text = json["end_play_actual"] ?? '';

    engineAssemblyReportIndicateWhichOne.clear();
    for (var x in List<String>.from(
        json["engine_assembly_report_indicate_which_one"] ?? [])) {
      engineAssemblyReportIndicateWhichOne.add(TextEditingController(text: x));
    }

    engineReportIndicateWhichOne.clear();
    for (var x
        in List<String>.from(json["engine_report_indicate_which_one"] ?? [])) {
      engineReportIndicateWhichOne.add(TextEditingController(text: x));
    }
  }

  Map<String, dynamic> toJson() => {
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
}

class EngineAssemblyReportCont {
  final int count;

  EngineAssemblyReportCont({required this.count}) {
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
  final id = Rx<String?>(null),
      mainBearingsReplaced = Rx<String?>(null),
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

  Map<String, dynamic> toJson() => {
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
        "ring_clearances_pistons": List<List<String>>.from(
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

  fromJson(Map<String, dynamic> json) {
    id.value = json["_id"] ?? '';
    mainBearingsReplaced.value = json["main_bearings_replaced"] ?? '';
    reasonIfMainBearingsNotReplaced.text =
        json["reason_if_main_bearings_not_replaced"] ?? '';
    numbersOfUpperShell.text = json["numbers_of_upper_shell"] ?? '';
    numbersOfLowerShell.text = json["numbers_of_lower_shell"] ?? '';
    mainBearingTorqued.value = json["main_bearing_torqued"] ?? '';
    mainBearingTorquedSpec.text = json["main_bearing_torqued_spec"] ?? '';
    thrustBearingsReplaced.value = json["thrust_bearings_replaced"] ?? '';
    crossTiesTorqued.value = json["cross_ties_torqued"] ?? '';
    crossTiesTorquedSpec.text = json["cross_ties_torqued_spec"] ?? '';
    counterWeightsTorqued.value = json["counter_weights_torqued"] ?? '';
    counterWeightsTorquedSpec.text = json["counter_weights_torqued_spec"] ?? '';
    vibrationDampenerReplacedTorqued.value =
        json["vibration_dampener_replaced_torqued"] ?? '';
    frontAndRearSealsReplaced.value =
        json["front_and_rear_seals_replaced"] ?? '';
    frontAndRearSealsReplacedDescFront.text =
        json["front_and_rear_seals_replaced_desc_front"] ?? '';
    frontAndRearSealsReplacedDescRear.text =
        json["front_and_rear_seals_replaced_desc_rear"] ?? '';
    connectingRods.value = json["connecting_rods"] ?? '';
    //-------------------------
    connectingRodsIndicateWhichOne.clear();
    for (var x in List<String>.from(
        json["connecting_rods_indicate_which_one"] ?? [])) {
      connectingRodsIndicateWhichOne.add(TextEditingController(text: x));
    }
    // connectingRodsIndicateWhichOne.addAll(
    //     json["connecting_rods_indicate_which_one"] == null
    //         ? []
    //         : List<TextEditingController>.from(
    //             json["connecting_rods_indicate_which_one"]!
    //                 .map((x) => TextEditingController())));
    //-------------------------
    connectingRodBearingsReplaced.value =
        json["connecting_rod_bearings_replaced"] ?? '';
    reasonIfNotConnectingRodBearingsReplaced.text =
        json["reason_if_not_connecting_rod_bearings_replaced"] ?? '';
    rodBearingCapsTorqued.value = json["rod_bearing_caps_torqued"] ?? '';
    rodBearingCapsTorquedSpec.text =
        json["rod_bearing_caps_torqued_spec"] ?? '';
    connectingRodSideClearanceChecked.value =
        json["connecting_rod_side_clearance_checked"] ?? '';
    connectingRodSideClearanceCheckedSpec.text =
        json["connecting_rod_side_clearance_checked_spec"] ?? '';
    actualReading.clear();
    for (var x in List<String>.from(json["actual_reading"] ?? [])) {
      actualReading.add(TextEditingController(text: x));
    }
    // actualReading.addAll(json['actual_reading'] == null
    //     ? []
    //     : List<TextEditingController>.from(
    //         json['actual_reading']!.map((x) => TextEditingController())));
    pistonPins.value = json["piston_pins"] ?? '';
    indicateNewPistons.clear();
    for (var x in List<String>.from(json["indicate_new_pistons"] ?? [])) {
      indicateNewPistons.add(TextEditingController(text: x));
    }
    // indicateNewPistons.addAll(json['indicate_new_pistons'] == null
    //     ? []
    //     : List<TextEditingController>.from(
    //         json['indicate_new_pistons']!.map((x) => TextEditingController())));
    pistons.value = json["pistons"] ?? '';
    indicateNewPins.clear();
    for (var x in List<String>.from(json["indicate_new_pins"] ?? [])) {
      indicateNewPins.add(TextEditingController(text: x));
    }
    // indicateNewPins.addAll(json['indicate_new_pins'] == null
    //     ? []
    //     : List<TextEditingController>.from(
    //         json['indicate_new_pins']!.map((x) => TextEditingController())));
    linerPacks.value = json["liner_packs"] ?? '';
    // ringClearancesInLiners.clear();
    ringClearancesInLiners.assignAll(_test(json['ring_clearances_in_liners']));
    // ringClearancesInPistons.clear();
    ringClearancesInPistons.assignAll(_test(json['ring_clearances_pistons']));
    cylinderLiners.value = json["cylinder_liners"] ?? '';
    indicateNewLiners.clear();
    for (var x in List<String>.from(json["indicate_new_liners"] ?? [])) {
      indicateNewLiners.add(TextEditingController(text: x));
    }
    // indicateNewLiners.addAll(json['indicate_new_liners'] == null
    //     ? []
    //     : List<TextEditingController>.from(
    //         json['indicate_new_liners']!.map((x) => TextEditingController())));
    linerORingsReplaced.value = json["liner_o_rings_replaced"] ?? '';
    cylinderHeads.value = json["cylinder_heads"] ?? '';
    cylinderHeadsBool.value = json["cylinder_heads_bool"] ?? '';
    indicateCylinderHeads.clear();
    for (var x in List<String>.from(json["indicate_cylinder_heads"] ?? [])) {
      indicateCylinderHeads.add(TextEditingController(text: x));
    }
    // indicateCylinderHeads.addAll(json['indicate_cylinder_heads'] == null
    //     ? []
    //     : List<TextEditingController>.from(json['indicate_cylinder_heads']!
    //         .map((x) => TextEditingController())));
    cylinderHeadSpec.text = json["cylinder_head_spec"] ?? '';
    rockerShaftAssemblies.value = json["rocker_shaft_assemblies"] ?? '';
    rockerShaftAssembliesIndicateWhichOne.clear();
    for (var x in List<String>.from(
        json["rocker_shaft_assemblies_indicate_which_one"] ?? [])) {
      rockerShaftAssembliesIndicateWhichOne.add(TextEditingController(text: x));
    }
    // rockerShaftAssembliesIndicateWhichOne.addAll(
    //     json['rocker_shaft_assemblies_indicate_which_one'] == null
    //         ? []
    //         : List<TextEditingController>.from(
    //             json['rocker_shaft_assemblies_indicate_which_one']!
    //                 .map((x) => TextEditingController())));
    rockerShaftAssembliesBool.value =
        json["rocker_shaft_assemblies_bool"] ?? '';
    rockerShaftAssembliesSpec.text = json["rocker_shaft_assemblies_spec"] ?? '';
    pushRods.value = json["push_rods"] ?? '';
    camshaft.value = json["camshaft"] ?? '';
    camshaftBearingReplaced.value = json["camshaft_bearing_replaced"] ?? '';
    camshaftBearingTorqued.value = json["camshaft_bearing_torqued"] ?? '';
    camshaftBearingTorquedSpec.text =
        json["camshaft_bearing_torqued_spec"] ?? '';
    camshaftEndPlayChecked.value = json["camshaft_end_play_checked"] ?? '';
    camshaftEndPlayCheckedSpec.text =
        json["camshaft_end_play_checked_spec"] ?? '';
    camshaftEndPlayCheckActual.text =
        json["camshaft_end_play_check_actual"] ?? '';
    camFollowers.value = json["cam_followers"] ?? '';
    bridges.value = json["bridges"] ?? '';
    bridgesSettings.text = json["bridges_settings"] ?? '';
    valveIntake.text = json["valve_intake"] ?? '';
    valveExhaust.text = json["valve_exhaust"] ?? '';
    valveInjector.text = json["valve_injector"] ?? '';
    injectorTrimCodes.clear();
    for (var x in List<String>.from(json["injector_trim_codes"] ?? [])) {
      injectorTrimCodes.add(TextEditingController(text: x));
    }
    // injectorTrimCodes.addAll(json['injector_trim_codes'] == null
    //     ? []
    //     : List<TextEditingController>.from(
    //         json['injector_trim_codes']!.map((x) => TextEditingController())));
  }

  List<List<TextEditingController>> _test(dynamic data) {
    List<List<TextEditingController>> test = [];
    for (dynamic d in data) {
      List<String> temp = d.cast<String>();
      List<TextEditingController> temp2 = [];
      for (dynamic t in temp) {
        temp2.add(TextEditingController(text: t));
      }
      test.add(temp2);
    }
    return test;
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

  Map<String, dynamic> toJson() => {
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

  fromJson(Map<String, dynamic> json) {
    gear.value = json["gear"] ?? '';
    camGear.value = json["cam_gear"] ?? '';
    accessoryGear.value = json["accessory_gear"] ?? '';
    idlerGear.value = json["ideal_gear"] ?? '';
    indicateBacklash.value = json["indicate_backlash"] ?? '';
    betweenEachMatingGears.value = json["between_each_mating_gears"] ?? '';
    spindleTorque.value = json["spindle_torque"] ?? '';
    gearBacklash.text = json["gear_backlash"] ?? '';
    camGearBacklash.text = json["cam_gear_backlash"] ?? '';
    accessoryGearBacklash.text = json["accessory_gear_backlash"] ?? '';
    idlerGearBacklash.text = json["ideal_gear_backlash"] ?? '';
    indicateBacklashBacklash.text = json["indicate_backlash_backlash"] ?? '';
    betweenEachMatingGearsBacklash.text =
        json["between_each_mating_gears_backlash"] ?? '';
    spindleTorqueBacklash.text = json["spindle_torque_backlash"] ?? '';
  }
}

class EngineAssemblyPartsExchangeCatalog {
  final id = Rx<String?>(null),
      oilPump = Rx<String?>(null),
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

  Map<String, dynamic> toJson() => {
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

  fromJson(Map<String, dynamic> json) {
    id.value = json["_id"] ?? '';
    oilPump.value = json['oil_pump'] ?? '';
    oilWaterPump.value = json['oil_water_pump'] ?? '';
    auxWaterPump.value = json['aux_water_pump'] ?? '';
    starter.value = json['starter'] ?? '';
    waterGate.value = json['water_gate'] ?? '';
    trubo.value = json['trubo'] ?? '';
    oilFilters.value = json['oil_filters'] ?? '';
    airFilters.value = json['air_filters'] ?? '';
    airBelts.value = json['air_belts'] ?? '';
    accessoryDrive.value = json['accessory_drive'] ?? '';
    interCooler.value = json['inter_cooler'] ?? '';
    fuelInjectors.value = json['fuel_injectors'] ?? '';
    bridges.value = json['bridges'] ?? '';
    scavengePump.value = json['scavenge_pump'] ?? '';
    fuelFilters.value = json['fuel_filters'] ?? '';
    fuelPump.value = json['fuel_pump'] ?? '';
    preLubePump.value = json['pre_lube_pump'] ?? '';
    preLubeMotor.value = json['pre_lube_motor'] ?? '';
    carburetors.value = json['carburetors'] ?? '';
    fuelRegulators.value = json['fuel_regulators'] ?? '';
    preChamber.value = json['pre_chamber'] ?? '';
    regulators.value = json['regulators'] ?? '';
    governor.value = json['governor'] ?? '';
    governorLinkages.value = json['governor_linkages'] ?? '';
    preChamberCup.value = json['pre_chamber_cup'] ?? '';
    sparkPlugs.value = json['spark_plugs'] ?? '';
    sparkPlugCarriers.value = json['spark_plug_carriers'] ?? '';
    magneto.value = json['magneto'] ?? '';
    coils.value = json['coils'] ?? '';
    extension.value = json['extension'] ?? '';
    ignitionHarness.value = json['ignition_harness'] ?? '';
    mechanic1MainBearingCap.text = json['mechanic1_main_bearing_cap'] ?? '';
    mechanic2MainBearingCap.text = json['mechanic2_main_bearing_cap'] ?? '';
    mechanic1ConnectingRodTorqued.text =
        json['mechanic1_connecting_rod_torqued'] ?? '';
    mechanic2ConnectingRodTorqued.text =
        json['mechanic2_connecting_rod_torqued'] ?? '';
    mechanic1ConnectingRodSide.text =
        json['mechanic1_connecting_rod_side'] ?? '';
    mechanic2ConnectingRodSide.text =
        json['mechanic2_connecting_rod_side'] ?? '';
    mechanic1AllInternalPlugs.text = json['mechanic1_all_internal_plugs'] ?? '';
    mechanic2AllInternalPlugs.text = json['mechanic2_all_internal_plugs'] ?? '';
    mechanic1CrankShaftEndPlay.text =
        json['mechanic1_crank_shaft_end_play'] ?? '';
    mechanic2CrankShaftEndPlay.text =
        json['mechanic2_crank_shaft_end_play'] ?? '';
    comments.text = json['comments'] ?? '';
  }
}
