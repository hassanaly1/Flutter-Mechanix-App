// To parse this JSON data, do
//
//     final payload = payloadFromJson(jsonString);

import 'dart:convert';

import 'package:mechanix/models/task_model.dart';

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));

String payloadToJson(Payload data) => json.encode(data.toJson());

class Payload {
  Geolocation? geolocation;
  TaskModel? task;
  List<TurboTemperature>? turboTemperature;
  List<Temperatures>? hotCompression;
  List<Temperatures>? cylinderExhaustPyrometer;
  List<Temperatures>? burnCompression;
  LeakageFound? leakageFound;
  List<Part>? parts;

  Payload({
    this.geolocation,
    this.task,
    this.turboTemperature,
    this.hotCompression,
    this.cylinderExhaustPyrometer,
    this.burnCompression,
    this.leakageFound,
    this.parts,
  });

  factory Payload.fromJson(Map<String, dynamic> taskJson) {
    Payload payload = Payload(
      geolocation: taskJson["geolocation"] == null
          ? null
          : Geolocation.fromJson(taskJson["geolocation"]),
      task: TaskModel.fromJson(taskJson),
      turboTemperature: taskJson["turbo_temperature"] == null
          ? []
          : List<TurboTemperature>.from(taskJson["turbo_temperature"]
              .map((x) => TurboTemperature.fromJson(x))),
      hotCompression: taskJson["hot_compression"] == null
          ? []
          : List<Temperatures>.from(
              taskJson["hot_compression"].map((x) => Temperatures.fromJson(x))),
      cylinderExhaustPyrometer: taskJson["cylinder_exhaust_pyrometer"] == null
          ? []
          : List<Temperatures>.from(taskJson["cylinder_exhaust_pyrometer"]
              .map((x) => Temperatures.fromJson(x))),
      burnCompression: taskJson["burn_compression"] == null
          ? []
          : List<Temperatures>.from(taskJson["burn_compression"]
              .map((x) => Temperatures.fromJson(x))),
      leakageFound: taskJson["leakage_found"] == null
          ? null
          : LeakageFound.fromJson(taskJson["leakage_found"]),
      parts: taskJson["parts"] == null
          ? []
          : List<Part>.from(taskJson["parts"].map((x) => Part.fromJson(x))),
    );
    // print(payload.geolocation);
    // print(payload.task);
    // print(payload.turboTemperature);
    // print(payload.hotCompression);
    // print(payload.cylinderExhaustPyrometer);
    // print(payload.burnCompression);
    // print(payload.leakageFound);
    // print(payload.parts);
    return payload;
  }

  Map<String, dynamic> toJson() => {
        "geolocation": geolocation?.toJson(),
        "task": task?.toJson(),
        "turbo_temperature": turboTemperature == null
            ? []
            : List<dynamic>.from(turboTemperature!.map((x) => x.toJson())),
        "hot_compression": hotCompression == null
            ? []
            : List<dynamic>.from(hotCompression!.map((x) => x.toJson())),
        "cylinder_exhaust_pyrometer": cylinderExhaustPyrometer == null
            ? []
            : List<dynamic>.from(
                cylinderExhaustPyrometer!.map((x) => x.toJson())),
        "burn_compression": burnCompression == null
            ? []
            : List<dynamic>.from(burnCompression!.map((x) => x.toJson())),
        "leakage_found": leakageFound?.toJson(),
        "parts": parts == null
            ? []
            : List<dynamic>.from(parts!.map((x) => x.toJson())),
      };
}

class Temperatures {
  double? temperatureNumber;
  bool? forCylinder;
  bool? forBurnTemperature;
  bool? forHotCompression;
  double? temperature;

  Temperatures({
    this.temperatureNumber,
    this.forCylinder,
    this.forBurnTemperature,
    this.forHotCompression,
    this.temperature,
  });

  // Convert Temperatures object to a JSON string
  String toJson() {
    return jsonEncode({
      'temperatureNumber': temperatureNumber ?? 0,
      'forCylinder': forCylinder ?? false,
      'forHotCompression': forBurnTemperature ?? false,
      'forEngineTuneUpHotCompressionTest': forHotCompression ?? false,
      'temperature': temperature ?? 0,
    });
  }

  // Create Temperatures object from a JSON string
  factory Temperatures.fromJson(Map<String, dynamic> json) {
    return Temperatures(
      temperatureNumber: json['temperature_number'],
      forCylinder: json['for_cylinder'],
      forBurnTemperature: json['for_burn_compression'],
      forHotCompression: json['for_hot_compression'],
      temperature: json['temperature'],
    );
  }
}

class Geolocation {
  double? geolat;
  double? geolong;
  String? geohash;
  String? address;

  Geolocation({
    this.geolat,
    this.geolong,
    this.geohash,
    this.address,
  });

  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
        geolat: json["geolat"],
        geolong: json["geolong"],
        geohash: json["geohash"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "geolat": geolat ?? 0.0,
        "geolong": geolong ?? 0.0,
        "geohash": geohash ?? 0.0,
        "address": address ?? "",
      };
}

class LeakageFound {
  bool? hasOilLeakage;
  bool? hasCoolantLeakage;
  bool? hasGasLeakage;
  bool? hasExhaustGasLeakage;
  bool? hasAirLeakage;
  String? oilDescription;
  String? coolantDescription;
  String? gasDescription;
  String? exhaustGasDescription;
  String? airDescription;

  LeakageFound({
    this.hasOilLeakage,
    this.hasCoolantLeakage,
    this.hasGasLeakage,
    this.hasExhaustGasLeakage,
    this.hasAirLeakage,
    this.oilDescription,
    this.coolantDescription,
    this.gasDescription,
    this.exhaustGasDescription,
    this.airDescription,
  });

  factory LeakageFound.fromJson(Map<String, dynamic> json) => LeakageFound(
        hasOilLeakage: json["has_oil_leakage"],
        hasCoolantLeakage: json["has_coolant_leakage"],
        hasGasLeakage: json["has_gas_leakage"],
        hasExhaustGasLeakage: json["has_exhaust_gas_leakage"],
        hasAirLeakage: json["has_air_leakage"],
        oilDescription: json["oil_description"],
        coolantDescription: json["coolant_description"],
        gasDescription: json["gas_description"],
        exhaustGasDescription: json["exhaust_gas_description"],
        airDescription: json["air_description"],
      );

  Map<String, dynamic> toJson() => {
        "has_oil_leakage": hasOilLeakage ?? false,
        "has_coolant_leakage": hasCoolantLeakage ?? false,
        "has_gas_leakage": hasGasLeakage ?? false,
        "has_exhaust_gas_leakage": hasExhaustGasLeakage ?? false,
        "has_air_leakage": hasAirLeakage ?? false,
        "oil_description": oilDescription ?? "",
        "coolant_description": coolantDescription ?? "",
        "gas_description": gasDescription ?? "",
        "exhaust_gas_description": exhaustGasDescription ?? "",
        "air_description": airDescription ?? "",
      };
}

class Part {
  String? name;
  String? description;
  int? quantity;
  String? vendor;

  Part({
    this.name,
    this.description,
    this.quantity,
    this.vendor,
  });

  factory Part.fromJson(Map<String, dynamic> json) => Part(
        name: json["name"],
        description: json["description"],
        quantity: json["quantity"],
        vendor: json["vendor"],
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? "",
        "description": description ?? "",
        "quantity": quantity ?? 0,
        "vendor": vendor ?? "",
      };
}

class GasSampleAs {
  String? gasName;

  GasSampleAs({
    this.gasName,
  });

  factory GasSampleAs.fromJson(Map<String, dynamic> json) => GasSampleAs(
        gasName: json["gas_name"],
      );

  Map<String, dynamic> toJson() => {
        "gas_name": gasName ?? "",
      };
}

class TurboTemperature {
  String? lbInType;
  int? lbInValue;
  bool? isTurboIn;
  bool? isTurboOut;
  String? rbInType;
  int? rbInValue;

  TurboTemperature({
    this.lbInType,
    this.lbInValue,
    this.isTurboIn,
    this.isTurboOut,
    this.rbInType,
    this.rbInValue,
  });

  factory TurboTemperature.fromJson(Map<String, dynamic> json) =>
      TurboTemperature(
        lbInType: json["lb_in_type"],
        lbInValue: json["lb_in_value"],
        isTurboIn: json["is_turbo_in"],
        isTurboOut: json["is_turbo_out"],
        rbInType: json["rb_in_type"],
        rbInValue: json["rb_in_value"],
      );

  Map<String, dynamic> toJson() => {
        "lb_in_type": lbInType ?? "",
        "lb_in_value": lbInValue ?? 0,
        "is_turbo_in": isTurboIn ?? false,
        "is_turbo_out": isTurboOut ?? false,
        "rb_in_type": rbInType ?? "",
        "rb_in_value": rbInValue ?? 0,
      };
}

// -----------------------
// factory Payload.fromJson(Map<String, dynamic> json) => Payload(
//       // This is previous
//       // geolocation: json["geolocation"] == null
//       //     ? null
//       //     : Geolocation.fromJson(json["geolocation"]),
//       //This is latest
//       geolocation: json["tasks"] == null
//           ? null
//           : json["tasks"]["geolocation"] == null
//               ? null
//               : Geolocation.fromJson(json["tasks"]["geolocation"]),
//       task: json["tasks"] == null ? null : TaskModel.fromJson(json["task"]),
//       turboTemperature: json["turbo_temperature"] == null
//           ? []
//           : List<TurboTemperature>.from(json["turbo_temperature"]!
//               .map((x) => TurboTemperature.fromJson(x))),
//       hotCompression: json["hot_compression"] == null
//           ? []
//           : List<Temperatures>.from(
//               json["hot_compression"]!.map((x) => Temperatures.fromJson(x))),
//       cylinderExhaustPyrometer: json["cylinder_exhaust_pyrometer"] == null
//           ? []
//           : List<Temperatures>.from(json["cylinder_exhaust_pyrometer"]!
//               .map((x) => Temperatures.fromJson(x))),
//       burnCompression: json["burn_compression"] == null
//           ? []
//           : List<Temperatures>.from(
//               json["burn_compression"]!.map((x) => Temperatures.fromJson(x))),
//       leakageFound: json["leakage_found"] == null
//           ? null
//           : LeakageFound.fromJson(json["leakage_found"]),
//       parts: json["parts"] == null
//           ? []
//           : List<Part>.from(json["parts"]!.map((x) => Part.fromJson(x))),
//     );
