import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mechanix/services/api_endpoints.dart';

class OverhaulReportTaskResponse {
  final bool success;
  final String message;
  final String? taskId;

  OverhaulReportTaskResponse(
      {required this.success, required this.message, this.taskId});
}

class OverhaulReportServices {
  Future<OverhaulReportTaskResponse> createOverhaulReport(
      {required String data, required String token}) async {
    Uri apiUrl = Uri.parse(
        '${ApiEndPoints.newBaseUrl}${ApiEndPoints.createOverhaulReportUrl}');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      final http.Response response = await http.post(
        apiUrl,
        headers: headers,
        body: data,
      );
      debugPrint(
          'Response Body: ${response.statusCode} ${response.reasonPhrase}');
      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return OverhaulReportTaskResponse(
          success: true,
          message: responseData["message"],
          taskId: responseData["response"]["engine_assembly_report_cont"]
              ["_id"],
        );
      } else {
        return OverhaulReportTaskResponse(
            success: false, message: 'Failed to create task');
      }
    } catch (error) {
      debugPrint('Error creating task: $error');
      return OverhaulReportTaskResponse(
          success: false, message: 'Error creating task');
    }
  }

  getAllTasks(
      {String? searchString, required String token, required int page}) async {
    String apiUrl =
        '${ApiEndPoints.newBaseUrl}${ApiEndPoints.getOverhaulReportUrl}';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'search': {
            "name": searchString,
          }
        }),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData['data'] != null) {
          final data = jsonData['data'];
          // final List<OverHaulReport> tasks = [];
          // Payload payload = Payload.fromJson(tasksDataList[0]);
          // print(payload);

          return data;
        } else {
          debugPrint('No Overhawl tasks found in the request response');
          return [];
        }
      } else {
        debugPrint(
            'Failed to get Overhawl tasks: ${response.statusCode} ${response.body}}');
        return [];
      }
    } catch (e) {
      debugPrint('Error getting Overhawl tasks: $e');
      return [];
    }
  }

  Future<bool> deleteTaskById({
    required String taskId,
    required String token,
  }) async {
    bool isSuccess = false;
    debugPrint('Deleting Overhaul task with ID: $taskId');
    final Uri apiUrl = Uri.parse(
      '${ApiEndPoints.newBaseUrl}${ApiEndPoints.deleteOverhaulReportUrl}?id=$taskId',
    );

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final http.Response response = await http.delete(
        apiUrl,
        headers: headers,
      );
      debugPrint(
          'DeleteOverhaulTaskResponse: ${response.reasonPhrase}  ${response.statusCode}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String message = responseData['message'];
        final Map<String, dynamic> data = responseData['data'];
        print('Deleted Overhaul Task details: $message | $data');
        isSuccess = true;
      } else {
        print(
            'Failed to delete Overhaul task. Status Code: ${response.statusCode} ${response.reasonPhrase}');
        print('Response Body: ${response.body}');
      }
    } catch (error) {
      print('Error deleting Compressor task: $error');
    }

    return isSuccess;
  }

  Future<OverhaulReportTaskResponse> updateOverhaulReport(
      {required String data,
      required String token,
      required String taskId}) async {
    debugPrint('Updating Overhaul task with ID: $taskId');
    Uri apiUrl = Uri.parse(
        '${ApiEndPoints.newBaseUrl}${ApiEndPoints.updateOverhaulReportUrl}?id=$taskId');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      final http.Response response = await http.put(
        apiUrl,
        headers: headers,
        body: data,
      );
      debugPrint(
          'Response Body: ${response.statusCode} ${response.reasonPhrase}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return OverhaulReportTaskResponse(
          success: responseData["status"] == "success",
          message: responseData["message"],
          taskId: responseData["data"]["engine_assembly_report_cont"]["_id"],
        );
      } else {
        return OverhaulReportTaskResponse(
            success: false, message: 'Failed to update task');
      }
    } catch (error) {
      debugPrint('Error updating task: $error');
      return OverhaulReportTaskResponse(
          success: false, message: 'Error updating task');
    }
  }
}
