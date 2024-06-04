import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mechanix/models/report_model.dart';
import 'package:mechanix/services/api_endpoints.dart';

class ReportService {
  Future<bool> generateReportById(String id, String token) async {
    debugPrint('Generating report for task: $id');
    String apiUrl =
        '${ApiEndPoints.baseUrl}${ApiEndPoints.createReportUrl}?id=$id';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      debugPrint(' ${response.statusCode} ${response.reasonPhrase}');
      // Map<String, dynamic> data = jsonDecode(response.body);
      return true;
    } else {
      debugPrint(
          '${response.body} ${response.statusCode} ${response.reasonPhrase}');
      return false;
    }
  }

  Future<List<ReportModel>> getAllReport(
      {String? searchString,
      required String token,
      required int page,
      required String? date}) async {
    String apiUrl =
        '${ApiEndPoints.baseUrl}${ApiEndPoints.getReportUrl}?page=$page';
    String newDate = ('${date}T12:59:20.849+00:00');
    print(newDate);
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
            "start_date": date == null ? '' : newDate,
            "end_date": date == null ? '' : newDate
            // "start_date": '2024-05-13T12:59:20.849+00:00',
            // "end_date": '2024-05-13T12:59:20.849+00:00'
          }
        }),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print('response: ${response.statusCode} ${response.reasonPhrase}');

        if (jsonData['data'] != null) {
          final tasksList = jsonData['data'];

          final List<ReportModel> reports = [];

          if (tasksList['report'] != null) {
            final List<dynamic> reportsDataList = tasksList['report'];
            // Check if reportsDataList is not empty
            if (reportsDataList.isNotEmpty) {
              reports.addAll(
                  reportsDataList.map((data) => ReportModel.fromJson(data)));
            } else {
              debugPrint('No tasks found');
              return [];
            }
          }

          return reports;
        } else {
          debugPrint('No reports found in the request response');
          return [];
        }
      } else {
        debugPrint('Failed to get reports: ${response.reasonPhrase}');
        return [];
      }
    } catch (e) {
      debugPrint('Error getting reports: $e');
      return [];
    }
  }

  Future<bool> deleteReportById({
    required String reportId,
    required String token,
  }) async {
    debugPrint('Deleting report: $reportId');
    bool isSuccess = false;

    final Uri apiUrl = Uri.parse(
      '${ApiEndPoints.baseUrl}${ApiEndPoints.deleteReportUrl}?id=$reportId',
    );

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final http.Response response = await http.post(
        apiUrl,
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String message = responseData['message'];
        final List<dynamic> data = responseData['data'];
        print('Report deletion message: $message');
        print('Deleted Report details: $data');
        isSuccess = true;
      } else {
        print(
            'Failed to delete report. Status Code: ${response.statusCode} ${response.reasonPhrase}');
        print('Response Body: ${response.body}');
      }
    } catch (error) {
      print('Error deleting report: $error');
    }

    return isSuccess;
  }
}
