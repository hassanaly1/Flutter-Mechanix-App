import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mechanix/data/api_endpoints.dart';
import 'package:mechanix/models/compressor_model.dart';

class CompressorTaskResponse {
  final bool success;
  final String message;
  final String? taskId;

  CompressorTaskResponse(
      {required this.success, required this.message, this.taskId});
}

class CompressorTaskService {
  Future<CompressorTaskResponse> createTask({
    required String token,
    required Compressor compressor,
  }) async {
    final Uri apiUrl =
        Uri.parse(ApiEndPoints.newBaseUrl + ApiEndPoints.createCompressorUrl);
    final Map<String, dynamic> payload = {"payload": compressor.toJson()};
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final http.Response response = await http.post(
        apiUrl,
        headers: headers,
        body: json.encode(payload),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        debugPrint('Task created successfully: ${responseData["message"]}');
        debugPrint('Task Response Body: ${response.body}');
        return CompressorTaskResponse(
          success: true,
          message: responseData["message"],
          taskId: responseData["data"]["_id"],
        );
      } else {
        debugPrint(
            'Failed to create task. Status Code: ${response.statusCode} ${response.reasonPhrase}');
        debugPrint('Response Body: ${response.body}');
        return CompressorTaskResponse(
            success: false, message: 'Failed to create task');
      }
    } catch (error) {
      debugPrint('Error creating task: $error');
      return CompressorTaskResponse(
          success: false, message: 'Error creating task');
    }
  }
}
