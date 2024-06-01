import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mechanix/models/payload.dart';
import 'package:mechanix/models/task_model.dart';
import 'package:mechanix/services/api_endpoints.dart';

class GeneratorTaskResponse {
  final bool success;
  final String message;
  final String? taskId;

  GeneratorTaskResponse(
      {required this.success, required this.message, this.taskId});
}

class GeneratorTaskService {
  Future<GeneratorTaskResponse> createTask({
    required String token,
    required Geolocation geolocation,
    required TaskModel task,
    required List<TurboTemperature> turboTemperature,
    required List<Temperatures> hotCompression,
    required List<Temperatures> cylinderExhaustPyrometer,
    required List<Temperatures> burnCompression,
    required LeakageFound leakageFound,
    required List<Part> parts,
  }) async {
    final Uri apiUrl =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.createTaskUrl);
    debugPrint('Payload1: ${task.gasSampleAsFound}');
    debugPrint('Payload2: ${task.gasSampleAsAdjusted}');
    debugPrint('EngineId: ${task.engineBrandId}');
    final Map<String, dynamic> payload = {
      "geolocation": geolocation.toJson(),
      "task": task.toJson(),
      "turbo_temperature": turboTemperature.map((e) => e.toJson()).toList(),
      "hot_compression": hotCompression.map((e) => e.toJson()).toList(),
      "cylinder_exhaust_pyrometer":
          cylinderExhaustPyrometer.map((e) => e.toJson()).toList(),
      "burn_compression": burnCompression.map((e) => e.toJson()).toList(),
      "leakage_found": leakageFound.toJson(),
      "parts": parts.map((e) => e.toJson()).toList(),
    };

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
        return GeneratorTaskResponse(
          success: true,
          message: responseData["message"],
          taskId: responseData["task"]["_id"], // Get taskId from response
        );
      } else {
        debugPrint(
            'Failed to create task. Status Code: ${response.statusCode} ${response.reasonPhrase}');
        return GeneratorTaskResponse(
            success: false, message: 'Failed to create task');
      }
    } catch (error) {
      debugPrint('Error creating task: $error');
      return GeneratorTaskResponse(
          success: false, message: 'Error creating task');
    }
  }

  Future<List<Payload>> getAllTasks(
      {String? searchString, required String token, required int page}) async {
    String apiUrl =
        '${ApiEndPoints.baseUrl}${ApiEndPoints.getAllTaskUrl}?page=$page';
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
          final tasksList = jsonData['data'];

          final List<Payload> tasks = [];

          // {
          //   'tasks': [],
          //   'totalCount': int
          // }

          // Payload payload = Payload.fromJson(tasksDataList[0]);
          // print(payload);
          if (tasksList['tasks'] != null) {
            final List<dynamic> tasksDataList = tasksList['tasks'];
            // Check if tasksDataList is not empty
            if (tasksDataList.isNotEmpty) {
              tasks.addAll(tasksDataList.map((data) => Payload.fromJson(data)));
            } else {
              debugPrint(
                  'No Generator tasks found, please create the Generator task first.');
              return [];
            }
          }

          return tasks;
        } else {
          debugPrint('No Generator tasks found in the request response');
          return [];
        }
      } else {
        debugPrint('Failed to get Generator tasks: ${response.reasonPhrase}');
        return [];
      }
    } catch (e) {
      debugPrint('Error getting Generator tasks: $e');
      return [];
    }
  }

  Future<bool> updateTaskById({
    required String taskId,
    required String token,
    required Geolocation geolocation,
    required TaskModel task,
    required List<TurboTemperature> turboTemperature,
    required List<Temperatures> hotCompression,
    required List<Temperatures> cylinderExhaustPyrometer,
    required List<Temperatures> burnCompression,
    required LeakageFound leakageFound,
    required List<Part> parts,
  }) async {
    bool isSuccess = false;

    final Uri apiUrl = Uri.parse(
      '${ApiEndPoints.baseUrl}${ApiEndPoints.updateTaskUrl}?id=$taskId',
    );
    debugPrint('EngineId: ${task.engineBrandId}');

    final Map<String, dynamic> payload = {
      "geolocation": geolocation.toJson(),
      "task": task.toJson(),
      "turbo_temperature": turboTemperature.map((e) => e.toJson()).toList(),
      "hot_compression": hotCompression.map((e) => e.toJson()).toList(),
      "cylinder_exhaust_pyrometer":
          cylinderExhaustPyrometer.map((e) => e.toJson()).toList(),
      "burn_compression": burnCompression.map((e) => e.toJson()).toList(),
      "leakage_found": leakageFound.toJson(),
      "parts": parts.map((e) => e.toJson()).toList(),
    };

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final http.Response response = await http.post(
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

  Future<bool> deleteTaskById({
    required String taskId,
    required String token,
  }) async {
    bool isSuccess = false;

    final Uri apiUrl = Uri.parse(
      '${ApiEndPoints.baseUrl}${ApiEndPoints.deleteTaskUrl}?id=$taskId',
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
        final Map<String, dynamic> data = responseData['data'];
        debugPrint('Task deletion message: $message');
        debugPrint('Deleted Task details: $data');
        isSuccess = true;
      } else {
        debugPrint(
            'Failed to delete task. Status Code: ${response.statusCode} ${response.reasonPhrase}');
        debugPrint('Response Body: ${response.body}');
      }
    } catch (error) {
      debugPrint('Error deleting task: $error');
    }

    return isSuccess;
  }
}
