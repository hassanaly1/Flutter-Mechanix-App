// To parse this JSON data, do
//
//     final compressor = compressorFromJson(jsonString);

import 'dart:convert';

CompressorTaskModel compressorFromJson(String str) =>
    CompressorTaskModel.fromJson(json.decode(str));

String compressorToJson(CompressorTaskModel data) => json.encode(data.toJson());

class CompressorTaskModel {
  String? taskId;
  String? compressorId;
  String? user;
  String? taskName;
  String? customerEmail;
  String? make;
  String? model;
  String? crossHeadShoes;
  String? mainBearing;
  String? connRodBearings;
  String? crossHeadPinThruBolt;
  String? spacerBarBolts;
  String? crossHeadGuideToCrankcase;
  String? crossHeadGuideToCyl;
  String? rodPackingBolt;
  String? pistonNut;
  String? crossHeadNut;
  List<ValveCap>? valveCaps;
  String? connRadBushing;
  String? babbit;
  String? bronze;
  String? castIron;
  String? connRodSideClearance;
  String? mainRodSideClearance;
  String? pistonEndCleareance;
  String? connRoadBearingClearance;
  String? rodPackingSideClearance; //
  String? clearanceBronze;
  String? teflon;
  String? crankstaftEndClearance;
  String? compressorOilPressure;

  CompressorTaskModel({
    this.taskId,
    this.compressorId,
    this.user,
    this.taskName,
    this.customerEmail,
    this.make,
    this.model,
    this.crossHeadShoes,
    this.connRodBearings,
    this.spacerBarBolts,
    this.crossHeadGuideToCyl,
    this.pistonNut,
    this.mainBearing,
    this.crossHeadPinThruBolt,
    this.crossHeadGuideToCrankcase,
    this.rodPackingBolt,
    this.crossHeadNut,
    this.valveCaps,
    this.connRadBushing,
    this.connRodSideClearance,
    this.mainRodSideClearance,
    this.connRoadBearingClearance,
    this.crankstaftEndClearance,
    this.babbit,
    this.bronze,
    this.castIron,
    this.pistonEndCleareance,
    this.rodPackingSideClearance,
    this.clearanceBronze,
    this.teflon,
    this.compressorOilPressure,
  });

  factory CompressorTaskModel.fromJson(Map<String, dynamic> json) {
    return CompressorTaskModel(
      taskId: json["_id"],
      compressorId: json["compressor"],
      user: json["user"],
      taskName: json["name"],
      customerEmail: json["customer_email"],
      make: json["make"],
      model: json["model"],
      crossHeadShoes: json["cross_head_shoes"],
      connRodBearings: json["conn_rod_bearings"],
      spacerBarBolts: json["spacer_bar_bolts"],
      crossHeadGuideToCyl: json["cross_head_guide_to_Cyl"],
      pistonNut: json["piston_nut"],
      mainBearing: json["main_bearing"],
      crossHeadPinThruBolt: json["cross_head_pin_thru_bolt"],
      crossHeadGuideToCrankcase: json["cross_head_guide_to_crankcase"],
      rodPackingBolt: json["rod_packing_bolt"],
      crossHeadNut: json["cross_head_nut"],
      valveCaps: json["valve_caps"] == null
          ? []
          : List<ValveCap>.from(
              json["valve_caps"]!.map((x) => ValveCap.fromJson(x))).toList(),
      connRadBushing: json["conn_rad_bushing"],
      connRodSideClearance: json["conn_rod_side_clearance"],
      mainRodSideClearance: json["main_rod_side_clearance"],
      connRoadBearingClearance: json["conn_road_bearing_clearance"],
      crankstaftEndClearance: json["crankstaft_end_clearance"],
      babbit: json["babbit"],
      bronze: json["bronze"],
      castIron: json["cast_iron"],
      pistonEndCleareance: json["piston_end_cleareance"],
      rodPackingSideClearance: json["rod_packing_side_clearance"],
      clearanceBronze: json["Clearance_bronze"],
      teflon: json["teflon"],
      compressorOilPressure: json["compressor_oil_pressure"],
    );
  }

  Map<String, dynamic> toJson() => {
        // "_id": taskId ?? '',
        "compressor": compressorId ?? '',
        "user": user ?? '',
        "name": taskName ?? '',
        "customer_email": customerEmail ?? '',
        "make": make ?? '',
        "model": model ?? '',
        "cross_head_shoes": crossHeadShoes ?? '',
        "conn_rod_bearings": connRodBearings ?? '',
        "spacer_bar_bolts": spacerBarBolts ?? '',
        "cross_head_guide_to_Cyl": crossHeadGuideToCyl ?? '',
        "piston_nut": pistonNut ?? '',
        "main_bearing": mainBearing ?? '',
        "cross_head_pin_thru_bolt": crossHeadPinThruBolt ?? '',
        "cross_head_guide_to_crankcase": crossHeadGuideToCrankcase ?? '',
        "rod_packing_bolt": rodPackingBolt ?? '',
        "cross_head_nut": crossHeadNut ?? '',
        "valve_caps": valveCaps == null
            ? []
            : List<dynamic>.from(valveCaps!.map((x) => x.toJson())),
        "conn_rad_bushing": connRadBushing ?? '',
        "conn_rod_side_clearance": connRodSideClearance ?? '',
        "main_rod_side_clearance": mainRodSideClearance ?? '',
        "conn_road_bearing_clearance": connRoadBearingClearance ?? '',
        "crankstaft_end_clearance": crankstaftEndClearance ?? '',
        "babbit": babbit ?? '',
        "bronze": bronze ?? '',
        "cast_iron": castIron ?? '',
        "piston_end_cleareance": pistonEndCleareance ?? '',
        "rod_packing_side_clearance": rodPackingSideClearance ?? '',
        "Clearance_bronze": clearanceBronze ?? '',
        "teflon": teflon ?? '',
        "compressor_oil_pressure": compressorOilPressure ?? '',
      };
}

class ValveCap {
  String? name;
  String? size;
  String? type;

  ValveCap({
    this.name,
    this.size,
    this.type,
  });

  factory ValveCap.fromJson(Map<String, dynamic> json) => ValveCap(
        name: json["name"],
        size: json["size"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "size": size,
        "type": type,
      };
}
