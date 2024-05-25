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
}
