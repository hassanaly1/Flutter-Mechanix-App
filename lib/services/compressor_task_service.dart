import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mechanix/models/compressor_model.dart';
import 'package:mechanix/services/api_endpoints.dart';

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
    required CompressorTaskModel compressor,
  }) async {
    final Uri apiUrl =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.createCompressorUrl);
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
        return CompressorTaskResponse(
          success: true,
          message: responseData["message"],
          taskId: responseData["data"]["_id"],
        );
      } else {
        debugPrint(
            'Failed to create task. Status Code: ${response.statusCode} ${response.reasonPhrase}');
        return CompressorTaskResponse(
            success: false, message: 'Failed to create task');
      }
    } catch (error) {
      debugPrint('Error creating task: $error');
      return CompressorTaskResponse(
          success: false, message: 'Error creating task');
    }
  }

  Future<List<CompressorTaskModel>> getAllCompressorTasks(
      {String? searchString, required String token, required int page}) async {
    String apiUrl =
        '${ApiEndPoints.baseUrl}${ApiEndPoints.getAllCompressorUrl}?page=$page';
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
          final List<CompressorTaskModel> compressors = [];
          // Compressor payload = Compressor.fromJson(data[0]);
          // print(payload);
          // Convert the map to a List<Compressor>
          compressors.addAll(data
              .map<CompressorTaskModel>(
                  (data) => CompressorTaskModel.fromJson(data))
              .toList());
          return compressors;
        } else {
          debugPrint('No Compressor tasks found in the response.body');
          return [];
        }
      } else {
        debugPrint('Failed to get Compressor tasks: ${response.reasonPhrase}');
        return [];
      }
    } catch (e) {
      debugPrint('Error getting Compressor tasks: $e');
      return [];
    }
  }

  Future<bool> deleteTaskById({
    required String taskId,
    required String token,
  }) async {
    bool isSuccess = false;
    debugPrint('Deleting Compressor task with ID: $taskId');
    final Uri apiUrl = Uri.parse(
      '${ApiEndPoints.baseUrl}${ApiEndPoints.deleteCompressorByIdUrl}?id=$taskId',
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
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String message = responseData['message'];
        final Map<String, dynamic> data = responseData['data'];
        print('Deleted Compressor Task details: $message | $data');
        isSuccess = true;
      } else {
        print(
            'Failed to delete Compressor task. Status Code: ${response.statusCode} ${response.reasonPhrase}');
        print('Response Body: ${response.body}');
      }
    } catch (error) {
      print('Error deleting Compressor task: $error');
    }

    return isSuccess;
  }

  Future<bool> updateTaskById({
    required String taskId,
    required String token,
    required CompressorTaskModel compressor,
  }) async {
    bool isSuccess = false;

    final Uri apiUrl = Uri.parse(
      '${ApiEndPoints.baseUrl}${ApiEndPoints.updateCompressorByIdUrl}?id=$taskId',
    );

    final Map<String, dynamic> payload = {"payload": compressor.toJson()};
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final http.Response response = await http.put(
        apiUrl,
        headers: headers,
        body: json.encode(payload),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic>? responseData = json.decode(response.body);
        if (responseData != null) {
          final String? message = responseData['message'];
          if (message != null) {
            debugPrint('Updated task MESSAGE: $message');
          } else {
            debugPrint('No message found in the response');
          }
        } else {
          debugPrint('No data found in the response');
        }

        debugPrint(
            'Task Updated successfully: ${response.statusCode} ${response.reasonPhrase}');
        debugPrint('Task Updated Body: ${response.body}');
        isSuccess = true;
      } else {
        debugPrint(
            'Failed to update task. Status Code: ${response.statusCode} ${response.reasonPhrase}');
        debugPrint('Response Body: ${response.body}');
      }
    } catch (error) {
      debugPrint('Error Updating task: $error');
    }

    return isSuccess;
  }
}
