import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mechanix/models/payload.dart';
import 'package:mechanix/models/task_model.dart';

class TaskService {
  Future<void> createTask({
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
    const String url =
        'https://mechanix-api-production.up.railway.app/api/task/createtask';
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
    // debugPrint(payload.toString());

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(payload),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        debugPrint('Task created successfully: ${responseData["message"]}');

        // Handle the response data here
      } else {
        debugPrint(
            'Failed to create task. Status Code: ${response.statusCode}');
        debugPrint('Response Body: ${response.body}');
      }
    } catch (error) {
      debugPrint('Error creating task: $error');
    }
  }

  Future<List<Payload>> getAllTasks(
      {required String userId, required String token}) async {
    const apiUrl =
        'https://mechanix-api-production.up.railway.app/api/task/getalltasks';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'user': userId}),
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

          if (tasksList['tasks'] != null) {
            final List<dynamic> tasksDataList = tasksList['tasks'];

            // Payload payload = Payload.fromJson(tasksDataList[0]);
            // print(payload);

            tasks.addAll(tasksDataList.map((data) => Payload.fromJson(data)));
          }

          return tasks;
        } else {
          debugPrint('No tasks found');
          return [];
        }
      } else {
        debugPrint('Failed to get tasks: ${response.reasonPhrase}');
        return [];
      }
    } catch (e) {
      debugPrint('Error getting tasks: $e');
      return [];
    }
  }
}
