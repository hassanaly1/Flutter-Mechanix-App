// To parse this JSON data, do
// final overHaulReport = overHaulReportFromJson(jsonString);

import 'dart:convert';

OverHaulReport overHaulReportFromJson(String str) =>
    OverHaulReport.fromJson(json.decode(str));

String overHaulReportToJson(OverHaulReport data) => json.encode(data.toJson());

class OverHaulReport {
  CustomerEngineInfo? customerEngineInfo;
  EngineAssembly? engineAssembly;
  List<EngineAssemblyPartsExchangeCatalog>? engineAssemblyPartsExchangeCatalog;
  EngineAssemblyReportCont? engineAssemblyReportCont;
  List<GearTrain>? gearTrain;
  String? type;

  OverHaulReport({
    this.customerEngineInfo,
    this.engineAssembly,
    this.engineAssemblyPartsExchangeCatalog,
    this.engineAssemblyReportCont,
    this.gearTrain,
    this.type,
  });

  factory OverHaulReport.fromJson(Map<String, dynamic> json) => OverHaulReport(
        customerEngineInfo: json["customer_engine_info"] == null
            ? null
            : CustomerEngineInfo.fromJson(json["customer_engine_info"]),
        engineAssembly: json["engine_assembly"] == null
            ? null
            : EngineAssembly.fromJson(json["engine_assembly"]),
        engineAssemblyPartsExchangeCatalog:
            json["engine_assembly_parts_exchange_catalog"] == null
                ? []
                : List<EngineAssemblyPartsExchangeCatalog>.from(
                    json["engine_assembly_parts_exchange_catalog"]!.map(
                        (x) => EngineAssemblyPartsExchangeCatalog.fromJson(x))),
        engineAssemblyReportCont: json["engine_assembly_report_cont"] == null
            ? null
            : EngineAssemblyReportCont.fromJson(
                json["engine_assembly_report_cont"]),
        gearTrain: json["gear_train"] == null
            ? []
            : List<GearTrain>.from(
                json["gear_train"]!.map((x) => GearTrain.fromJson(x))),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "customer_engine_info": customerEngineInfo?.toJson(),
        "engine_assembly": engineAssembly?.toJson(),
        "engine_assembly_parts_exchange_catalog":
            engineAssemblyPartsExchangeCatalog == null
                ? []
                : List<dynamic>.from(
                    engineAssemblyPartsExchangeCatalog!.map((x) => x.toJson())),
        "engine_assembly_report_cont": engineAssemblyReportCont?.toJson(),
        "gear_train": gearTrain == null
            ? []
            : List<dynamic>.from(gearTrain!.map((x) => x.toJson())),
        "type": type,
      };
}

class CustomerEngineInfo {
  String? customer;
  String? workorder;
  String? location;
  String? lsd;
  int? unit;
  int? unitHours;
  DateTime? date;
  String? engineMake;
  String? engineModel;
  String? engineSerial;
  String? engineArrangement;
  String? customerContact;
  List<String>? mechanic;

  CustomerEngineInfo({
    this.customer,
    this.workorder,
    this.location,
    this.lsd,
    this.unit,
    this.unitHours,
    this.date,
    this.engineMake,
    this.engineModel,
    this.engineSerial,
    this.engineArrangement,
    this.customerContact,
    this.mechanic,
  });

  factory CustomerEngineInfo.fromJson(Map<String, dynamic> json) =>
      CustomerEngineInfo(
        customer: json["customer"],
        workorder: json["workorder"],
        location: json["location"],
        lsd: json["lsd"],
        unit: json["unit"],
        unitHours: json["unit_hours"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        engineMake: json["engine_make"],
        engineModel: json["engine_model"],
        engineSerial: json["engine_serial"],
        engineArrangement: json["engine_arrangement"],
        customerContact: json["customer_contact"],
        mechanic: json["mechanic"] == null
            ? []
            : List<String>.from(json["mechanic"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "customer": customer,
        "workorder": workorder,
        "location": location,
        "lsd": lsd,
        "unit": unit,
        "unit_hours": unitHours,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "engine_make": engineMake,
        "engine_model": engineModel,
        "engine_serial": engineSerial,
        "engine_arrangement": engineArrangement,
        "customer_contact": customerContact,
        "mechanic":
            mechanic == null ? [] : List<dynamic>.from(mechanic!.map((x) => x)),
      };
}

class EngineAssembly {
  String? engineBlocks;
  bool? lineBorePerformed;
  String? company;
  bool? magCheckedForCracks;
  bool? linerFitsRepaired;
  List<String>? engineAssemblyReportIndicateWhichOne;
  String? engineCrankshaft;
  String? plastiGuageReadingsOneMainBearingSpec;
  String? plastiGuageReadingsOneMainBearingActual;
  List<String>? engineReportIndicateWhichOne;
  String? endPlaySpec;
  String? endPlayActual;

  EngineAssembly({
    this.engineBlocks,
    this.lineBorePerformed,
    this.company,
    this.magCheckedForCracks,
    this.linerFitsRepaired,
    this.engineAssemblyReportIndicateWhichOne,
    this.engineCrankshaft,
    this.plastiGuageReadingsOneMainBearingSpec,
    this.plastiGuageReadingsOneMainBearingActual,
    this.engineReportIndicateWhichOne,
    this.endPlaySpec,
    this.endPlayActual,
  });

  factory EngineAssembly.fromJson(Map<String, dynamic> json) => EngineAssembly(
        engineBlocks: json["engine_blocks"],
        lineBorePerformed: json["line_bore_performed"],
        company: json["company"],
        magCheckedForCracks: json["mag_checked_for_cracks"],
        linerFitsRepaired: json["liner_fits_repaired"],
        engineAssemblyReportIndicateWhichOne:
            json["engine_assembly_report_indicate_which_one"] == null
                ? []
                : List<String>.from(
                    json["engine_assembly_report_indicate_which_one"]!
                        .map((x) => x)),
        engineCrankshaft: json["engine_crankshaft"],
        plastiGuageReadingsOneMainBearingSpec:
            json["plasti_guage_readings_one_main_bearing_spec"],
        plastiGuageReadingsOneMainBearingActual:
            json["plasti_guage_readings_one_main_bearing_actual"],
        engineReportIndicateWhichOne:
            json["engine_report_indicate_which_one"] == null
                ? []
                : List<String>.from(
                    json["engine_report_indicate_which_one"]!.map((x) => x)),
        endPlaySpec: json["end_play_spec"],
        endPlayActual: json["end_play_actual"],
      );

  Map<String, dynamic> toJson() => {
        "engine_blocks": engineBlocks,
        "line_bore_performed": lineBorePerformed,
        "company": company,
        "mag_checked_for_cracks": magCheckedForCracks,
        "liner_fits_repaired": linerFitsRepaired,
        "engine_assembly_report_indicate_which_one":
            engineAssemblyReportIndicateWhichOne == null
                ? []
                : List<dynamic>.from(
                    engineAssemblyReportIndicateWhichOne!.map((x) => x)),
        "engine_crankshaft": engineCrankshaft,
        "plasti_guage_readings_one_main_bearing_spec":
            plastiGuageReadingsOneMainBearingSpec,
        "plasti_guage_readings_one_main_bearing_actual":
            plastiGuageReadingsOneMainBearingActual,
        "engine_report_indicate_which_one": engineReportIndicateWhichOne == null
            ? []
            : List<dynamic>.from(engineReportIndicateWhichOne!.map((x) => x)),
        "end_play_spec": endPlaySpec,
        "end_play_actual": endPlayActual,
      };
}

class EngineAssemblyPartsExchangeCatalog {
  String? partName;
  bool? engineAssemblyPartsExchangeCatalogNew;
  bool? reConditioned;
  bool? reUsed;
  bool? exchange;

  EngineAssemblyPartsExchangeCatalog({
    this.partName,
    this.engineAssemblyPartsExchangeCatalogNew,
    this.reConditioned,
    this.reUsed,
    this.exchange,
  });

  factory EngineAssemblyPartsExchangeCatalog.fromJson(
          Map<String, dynamic> json) =>
      EngineAssemblyPartsExchangeCatalog(
        partName: json["part_name"],
        engineAssemblyPartsExchangeCatalogNew: json["new"],
        reConditioned: json["re_conditioned"],
        reUsed: json["re_used"],
        exchange: json["exchange"],
      );

  Map<String, dynamic> toJson() => {
        "part_name": partName,
        "new": engineAssemblyPartsExchangeCatalogNew,
        "re_conditioned": reConditioned,
        "re_used": reUsed,
        "exchange": exchange,
      };
}

class EngineAssemblyReportCont {
  String? engineAssembly;
  bool? mainBearingsReplaced;
  String? reasonIfNotReplaced;
  double? numerOfUperShellThickness;
  double? numberOfLowerShellThickness;
  double? mainBearingTorque;
  String? mainBearingTorqueSpec;
  bool? thrustBearingsReplaced;
  bool? crossTiesTorqued;
  String? crossTiesTorquedSpec;
  bool? counterWeightsTorqued;
  String? counterWeightsTorquedSpec;
  bool? vibrationDampenerReplacedTorqued;
  bool? frontAndRearSealsReplaced;
  String? frontAndRearSealsReplacedDescFront;
  String? frontAndRearSealsReplacedDescRear;
  String? connectionRods;
  List<String>? connectionRodsIndicateWhichOne;
  bool? connectionRodBearingsReplaced;
  String? reasonIfNotConnectionRodBearingsReplaced;
  bool? rodBearingCapsTorqued;
  String? rodBearingCapsTorquedSpec;
  bool? connectionRodSideClearanceChecked;
  String? connectionRodSideClearanceCheckedSpec;
  List<String>? actualReading;
  String? pistonPins;
  List<String>? indicateNewPistons;
  String? pistons;
  List<String>? indicateNewPins;
  bool? linerPacks;
  List<RingClearances>? ringClearancesLinear;
  List<RingClearances>? ringClearancesPistons;
  String? cylinderLiners;
  List<String>? indicateNewLiners;
  bool? linerORingsReplaced;
  String? cylinderHeads;
  List<String>? indicateCylinderHeads;
  bool? cylinderHeadsTorqued;
  String? cylinderHeadSpec;
  String? rockerShaftAssemblies;
  List<String>? rockerShaftAssembliesIndicateWhichOne;
  bool? rockerShaftAssembliesTorqued;
  String? rockerShaftAssembliesSpec;
  String? pushRods;
  String? camshaft;
  bool? camshaftBearingReplaced;
  bool? camshaftBearingTorqued;
  String? camshaftBearingTorquedSpec;
  bool? camshaftEndPlayChecked;
  String? camshaftEndPlayCheckedSpec;
  String? camshaftEndPlayCheckActual;
  String? camFollowers;
  String? bridgesSettings;
  double? valveIntake;
  double? valveExhaust;
  double? valveInjector;
  List<String>? injectorTrimCodes;

  EngineAssemblyReportCont({
    this.engineAssembly,
    this.mainBearingsReplaced,
    this.reasonIfNotReplaced,
    this.numerOfUperShellThickness,
    this.numberOfLowerShellThickness,
    this.mainBearingTorque,
    this.mainBearingTorqueSpec,
    this.thrustBearingsReplaced,
    this.crossTiesTorqued,
    this.crossTiesTorquedSpec,
    this.counterWeightsTorqued,
    this.counterWeightsTorquedSpec,
    this.vibrationDampenerReplacedTorqued,
    this.frontAndRearSealsReplaced,
    this.frontAndRearSealsReplacedDescFront,
    this.frontAndRearSealsReplacedDescRear,
    this.connectionRods,
    this.connectionRodsIndicateWhichOne,
    this.connectionRodBearingsReplaced,
    this.reasonIfNotConnectionRodBearingsReplaced,
    this.rodBearingCapsTorqued,
    this.rodBearingCapsTorquedSpec,
    this.connectionRodSideClearanceChecked,
    this.connectionRodSideClearanceCheckedSpec,
    this.actualReading,
    this.pistonPins,
    this.indicateNewPistons,
    this.pistons,
    this.indicateNewPins,
    this.linerPacks,
    this.ringClearancesLinear,
    this.ringClearancesPistons,
    this.cylinderLiners,
    this.indicateNewLiners,
    this.linerORingsReplaced,
    this.cylinderHeads,
    this.indicateCylinderHeads,
    this.cylinderHeadsTorqued,
    this.cylinderHeadSpec,
    this.rockerShaftAssemblies,
    this.rockerShaftAssembliesIndicateWhichOne,
    this.rockerShaftAssembliesTorqued,
    this.rockerShaftAssembliesSpec,
    this.pushRods,
    this.camshaft,
    this.camshaftBearingReplaced,
    this.camshaftBearingTorqued,
    this.camshaftBearingTorquedSpec,
    this.camshaftEndPlayChecked,
    this.camshaftEndPlayCheckedSpec,
    this.camshaftEndPlayCheckActual,
    this.camFollowers,
    this.bridgesSettings,
    this.valveIntake,
    this.valveExhaust,
    this.valveInjector,
    this.injectorTrimCodes,
  });

  factory EngineAssemblyReportCont.fromJson(Map<String, dynamic> json) =>
      EngineAssemblyReportCont(
        engineAssembly: json["engine_assembly"],
        mainBearingsReplaced: json["main_bearings_replaced"],
        reasonIfNotReplaced: json["reason_if_not_replaced"],
        numerOfUperShellThickness:
            json["numer_of_uper_shell_thickness"]?.toDouble(),
        numberOfLowerShellThickness:
            json["number_of_lower_shell_thickness"]?.toDouble(),
        mainBearingTorque: json["main_bearing_torque"]?.toDouble(),
        mainBearingTorqueSpec: json["main_bearing_torque_spec"],
        thrustBearingsReplaced: json["thrust_bearings_replaced"],
        crossTiesTorqued: json["cross_ties_torqued"],
        crossTiesTorquedSpec: json["cross_ties_torqued_spec"],
        counterWeightsTorqued: json["counter_weights_torqued"],
        counterWeightsTorquedSpec: json["counter_weights_torqued_spec"],
        vibrationDampenerReplacedTorqued:
            json["vibration_dampener_replaced_torqued"],
        frontAndRearSealsReplaced: json["front_and_rear_seals_replaced"],
        frontAndRearSealsReplacedDescFront:
            json["front_and_rear_seals_replaced_desc_front"],
        frontAndRearSealsReplacedDescRear:
            json["front_and_rear_seals_replaced_desc_rear"],
        connectionRods: json["connection_rods"],
        connectionRodsIndicateWhichOne:
            json["connection_rods_indicate_which_one"] == null
                ? []
                : List<String>.from(
                    json["connection_rods_indicate_which_one"]!.map((x) => x)),
        connectionRodBearingsReplaced: json["connection_rod_bearings_replaced"],
        reasonIfNotConnectionRodBearingsReplaced:
            json["reason_if_not_connection_rod_bearings_replaced"],
        rodBearingCapsTorqued: json["rod_bearing_caps_torqued"],
        rodBearingCapsTorquedSpec: json["rod_bearing_caps_torqued_spec"],
        connectionRodSideClearanceChecked:
            json["connection_rod_side_clearance_checked"],
        connectionRodSideClearanceCheckedSpec:
            json["connection_rod_side_clearance_checked_spec"],
        actualReading: json["actual_reading"] == null
            ? []
            : List<String>.from(json["actual_reading"]!.map((x) => x)),
        pistonPins: json["piston_pins"],
        indicateNewPistons: json["indicate_new_pistons"] == null
            ? []
            : List<String>.from(json["indicate_new_pistons"]!.map((x) => x)),
        pistons: json["pistons"],
        indicateNewPins: json["indicate_new_pins"] == null
            ? []
            : List<String>.from(json["indicate_new_pins"]!.map((x) => x)),
        linerPacks: json["liner_packs"],
        ringClearancesLinear: json["ring_clearances_linear"] == null
            ? []
            : List<RingClearances>.from(json["ring_clearances_linear"]!
                .map((x) => RingClearances.fromJson(x))),
        ringClearancesPistons: json["ring_clearances_pistons"] == null
            ? []
            : List<RingClearances>.from(json["ring_clearances_pistons"]!
                .map((x) => RingClearances.fromJson(x))),
        cylinderLiners: json["cylinder_liners"],
        indicateNewLiners: json["indicate_new_liners"] == null
            ? []
            : List<String>.from(json["indicate_new_liners"]!.map((x) => x)),
        linerORingsReplaced: json["liner_o_rings_replaced"],
        cylinderHeads: json["cylinder_heads"],
        indicateCylinderHeads: json["indicate_cylinder_heads"] == null
            ? []
            : List<String>.from(json["indicate_cylinder_heads"]!.map((x) => x)),
        cylinderHeadsTorqued: json["cylinder_heads_torqued"],
        cylinderHeadSpec: json["cylinder_head_spec"],
        rockerShaftAssemblies: json["rocker_shaft_assemblies"],
        rockerShaftAssembliesIndicateWhichOne:
            json["rocker_shaft_assemblies_indicate_which_one"] == null
                ? []
                : List<String>.from(
                    json["rocker_shaft_assemblies_indicate_which_one"]!
                        .map((x) => x)),
        rockerShaftAssembliesTorqued: json["rocker_shaft_assemblies_torqued"],
        rockerShaftAssembliesSpec: json["rocker_shaft_assemblies_spec"],
        pushRods: json["push_rods"],
        camshaft: json["camshaft"],
        camshaftBearingReplaced: json["camshaft_bearing_replaced"],
        camshaftBearingTorqued: json["camshaft_bearing_torqued"],
        camshaftBearingTorquedSpec: json["camshaft_bearing_torqued_spec"],
        camshaftEndPlayChecked: json["camshaft_end_play_checked"],
        camshaftEndPlayCheckedSpec: json["camshaft_end_play_checked_spec"],
        camshaftEndPlayCheckActual: json["camshaft_end_play_check_actual"],
        camFollowers: json["cam_followers"],
        bridgesSettings: json["bridges_settings"],
        valveIntake: json["valve_intake"]?.toDouble(),
        valveExhaust: json["valve_exhaust"]?.toDouble(),
        valveInjector: json["valve_injector"]?.toDouble(),
        injectorTrimCodes: json["injector_trim_codes"] == null
            ? []
            : List<String>.from(json["injector_trim_codes"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "engine_assembly": engineAssembly,
        "main_bearings_replaced": mainBearingsReplaced,
        "reason_if_not_replaced": reasonIfNotReplaced,
        "numer_of_uper_shell_thickness": numerOfUperShellThickness,
        "number_of_lower_shell_thickness": numberOfLowerShellThickness,
        "main_bearing_torque": mainBearingTorque,
        "main_bearing_torque_spec": mainBearingTorqueSpec,
        "thrust_bearings_replaced": thrustBearingsReplaced,
        "cross_ties_torqued": crossTiesTorqued,
        "cross_ties_torqued_spec": crossTiesTorquedSpec,
        "counter_weights_torqued": counterWeightsTorqued,
        "counter_weights_torqued_spec": counterWeightsTorquedSpec,
        "vibration_dampener_replaced_torqued": vibrationDampenerReplacedTorqued,
        "front_and_rear_seals_replaced": frontAndRearSealsReplaced,
        "front_and_rear_seals_replaced_desc_front":
            frontAndRearSealsReplacedDescFront,
        "front_and_rear_seals_replaced_desc_rear":
            frontAndRearSealsReplacedDescRear,
        "connection_rods": connectionRods,
        "connection_rods_indicate_which_one": connectionRodsIndicateWhichOne ==
                null
            ? []
            : List<dynamic>.from(connectionRodsIndicateWhichOne!.map((x) => x)),
        "connection_rod_bearings_replaced": connectionRodBearingsReplaced,
        "reason_if_not_connection_rod_bearings_replaced":
            reasonIfNotConnectionRodBearingsReplaced,
        "rod_bearing_caps_torqued": rodBearingCapsTorqued,
        "rod_bearing_caps_torqued_spec": rodBearingCapsTorquedSpec,
        "connection_rod_side_clearance_checked":
            connectionRodSideClearanceChecked,
        "connection_rod_side_clearance_checked_spec":
            connectionRodSideClearanceCheckedSpec,
        "actual_reading": actualReading == null
            ? []
            : List<dynamic>.from(actualReading!.map((x) => x)),
        "piston_pins": pistonPins,
        "indicate_new_pistons": indicateNewPistons == null
            ? []
            : List<dynamic>.from(indicateNewPistons!.map((x) => x)),
        "pistons": pistons,
        "indicate_new_pins": indicateNewPins == null
            ? []
            : List<dynamic>.from(indicateNewPins!.map((x) => x)),
        "liner_packs": linerPacks,
        "ring_clearances_linear": ringClearancesLinear == null
            ? []
            : List<dynamic>.from(ringClearancesLinear!.map((x) => x.toJson())),
        "ring_clearances_pistons": ringClearancesPistons == null
            ? []
            : List<dynamic>.from(ringClearancesPistons!.map((x) => x.toJson())),
        "cylinder_liners": cylinderLiners,
        "indicate_new_liners": indicateNewLiners == null
            ? []
            : List<dynamic>.from(indicateNewLiners!.map((x) => x)),
        "liner_o_rings_replaced": linerORingsReplaced,
        "cylinder_heads": cylinderHeads,
        "indicate_cylinder_heads": indicateCylinderHeads == null
            ? []
            : List<dynamic>.from(indicateCylinderHeads!.map((x) => x)),
        "cylinder_heads_torqued": cylinderHeadsTorqued,
        "cylinder_head_spec": cylinderHeadSpec,
        "rocker_shaft_assemblies": rockerShaftAssemblies,
        "rocker_shaft_assemblies_indicate_which_one":
            rockerShaftAssembliesIndicateWhichOne == null
                ? []
                : List<dynamic>.from(
                    rockerShaftAssembliesIndicateWhichOne!.map((x) => x)),
        "rocker_shaft_assemblies_torqued": rockerShaftAssembliesTorqued,
        "rocker_shaft_assemblies_spec": rockerShaftAssembliesSpec,
        "push_rods": pushRods,
        "camshaft": camshaft,
        "camshaft_bearing_replaced": camshaftBearingReplaced,
        "camshaft_bearing_torqued": camshaftBearingTorqued,
        "camshaft_bearing_torqued_spec": camshaftBearingTorquedSpec,
        "camshaft_end_play_checked": camshaftEndPlayChecked,
        "camshaft_end_play_checked_spec": camshaftEndPlayCheckedSpec,
        "camshaft_end_play_check_actual": camshaftEndPlayCheckActual,
        "cam_followers": camFollowers,
        "bridges_settings": bridgesSettings,
        "valve_intake": valveIntake,
        "valve_exhaust": valveExhaust,
        "valve_injector": valveInjector,
        "injector_trim_codes": injectorTrimCodes == null
            ? []
            : List<dynamic>.from(injectorTrimCodes!.map((x) => x)),
      };
}

class RingClearances {
  int? piston;
  double? ring1;
  double? ring2;
  double? ring3;
  double? ring4;

  RingClearances({
    this.piston,
    this.ring1,
    this.ring2,
    this.ring3,
    this.ring4,
  });

  factory RingClearances.fromJson(Map<String, dynamic> json) => RingClearances(
        piston: json["piston"],
        ring1: json["ring_1"]?.toDouble(),
        ring2: json["ring_2"]?.toDouble(),
        ring3: json["ring_3"]?.toDouble(),
        ring4: json["ring_4"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "piston": piston,
        "ring_1": ring1,
        "ring_2": ring2,
        "ring_3": ring3,
        "ring_4": ring4,
      };
}

class GearTrain {
  String? partName;
  bool? gearTrainNew;
  bool? reUsed;
  dynamic backLash;

  GearTrain({
    this.partName,
    this.gearTrainNew,
    this.reUsed,
    this.backLash,
  });

  factory GearTrain.fromJson(Map<String, dynamic> json) => GearTrain(
        partName: json["part_name"],
        gearTrainNew: json["new"],
        reUsed: json["re_used"],
        backLash: json["back_lash"],
      );

  Map<String, dynamic> toJson() => {
        "part_name": partName,
        "new": gearTrainNew,
        "re_used": reUsed,
        "back_lash": backLash,
      };
}
