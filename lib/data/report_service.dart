import 'package:flutter/material.dart';
import 'package:mechanix/data/api_endpoints.dart';
import 'package:http/http.dart' as http;

class ReportService {
  Future<void> generateReport({required String taskId}) async {
    final Uri apiUrl = Uri.parse(
        '${ApiEndPoints.baseUrl}${ApiEndPoints.createReportUrl}?id=$taskId');
    final response = await http.post(apiUrl);
    try {
      if (response.statusCode == 200) {
        debugPrint('Report generated successfully');
      } else {
        debugPrint('Failed to generate report: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error generating report: $e');
    }
  }
}
