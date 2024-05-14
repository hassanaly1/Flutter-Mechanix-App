// To parse this JSON data, do
//
//     final reportModel = reportModelFromJson(jsonString);

import 'dart:convert';

ReportModel reportModelFromJson(String str) =>
    ReportModel.fromJson(json.decode(str));

String reportModelToJson(ReportModel data) => json.encode(data.toJson());

class ReportModel {
  String? id;
  String? name;
  String? user;
  String? reportId;
  String? task;
  DateTime? reportDate;
  int? v;

  ReportModel({
    this.id,
    this.name,
    this.user,
    this.reportId,
    this.task,
    this.reportDate,
    this.v,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        id: json["_id"],
        name: json["name"],
        user: json["user"],
        reportId: json["report_id"],
        task: json["task"],
        reportDate: json["report_date"] == null
            ? null
            : DateTime.parse(json["report_date"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "user": user,
        "report_id": reportId,
        "task": task,
        "report_date": reportDate?.toIso8601String(),
        "__v": v,
      };
}
