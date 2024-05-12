import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mechanix/data/api_endpoints.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/models/engine_model.dart';

class EngineService {
  final _storage = GetStorage();

  Future<bool> addEngine({
    required EngineModel engineModel,
    required Uint8List engineImageInBytes,
  }) async {
    var headers = {
      'Authorization': 'Bearer ${_storage.read('token')}',
      'Content-Type': 'application/json'
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${ApiEndPoints.baseUrl}${ApiEndPoints.addEngineUrl}'),
    );

    // Add form fields
    request.fields.addAll({
      'engine_brand[user]': '${_storage.read('user_info')['_id']}',
      'engine_brand[name]': '${engineModel.name}',
      'engine_brand[subname]': '${engineModel.subname}',
      'engine_brand[is_generator]': '${engineModel.isGenerator}',
      'engine_brand[is_compressor]': '${engineModel.isCompressor}',
    });
    request.files.add(
      http.MultipartFile.fromBytes(
        'engines',
        engineImageInBytes,
        filename: 'engine.png',
      ),
    );

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 201) {
        debugPrint(await response.stream.bytesToString());
        return true;
      } else {
        debugPrint(response.reasonPhrase);
        return false;
      }
    } catch (e) {
      debugPrint('Error adding engine: $e');
      return false;
    }
  }

  Future<List<EngineModel>> getAllEngines(
      {String? searchString, required String token, required int page}) async {
    String apiUrl =
        '${ApiEndPoints.baseUrl}${ApiEndPoints.getEngineUrl}?page=$page';

    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          'search': {"name": searchString}
        }),
      );
      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic> responseData = json.decode(response.body);
        // You can now access specific fields within this data using their keys.
        List<dynamic> engineData = responseData['data'][0]['engines'];

        // Map the JSON data to a list of EngineModel objects
        List<EngineModel> engines =
            engineData.map((data) => EngineModel.fromJson(data)).toList();

        return engines;
      } else {
        debugPrint('Failed to get engines: ${response.reasonPhrase}');
        return [];
      }
    } catch (e) {
      debugPrint('Error getting engines: $e');
      return [];
    }
  }

  Future<void> updateEngine(
      {required EngineModel engineModel, required String token}) async {
    String apiUrl = '${ApiEndPoints.baseUrl}${ApiEndPoints.updateEngineUrl}';
    debugPrint(jsonEncode(engineModel.toJson()));

    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'engine_brand': engineModel.toJson(),
        }),
      );
      if (response.statusCode == 201) {
        Map<String, dynamic> responseData = json.decode(response.body);
        String message = responseData['message'];

        debugPrint(message);
      } else {
        ToastMessage.showToastMessage(
            message: 'Something went wrong, please try again',
            backgroundColor: Colors.red);
        debugPrint(
            'Failed to update engine: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      ToastMessage.showToastMessage(
          message: 'Something went wrong, please try again',
          backgroundColor: Colors.red);
    }
  }

  Future<void> deleteEngine(
      {required EngineModel engineModel, required String token}) async {
    String apiUrl = '${ApiEndPoints.baseUrl}${ApiEndPoints.deleteEngineUrl}';
    debugPrint(jsonEncode(engineModel.toJson()));

    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'engine_brand': engineModel.toJson(),
        }),
      );
      if (response.statusCode == 201) {
        Map<String, dynamic> responseData = json.decode(response.body);
        String message = responseData['message'];

        debugPrint(message);
      } else {
        ToastMessage.showToastMessage(
            message: 'Something went wrong, please try again',
            backgroundColor: Colors.red);
        debugPrint(
            'Failed to delete engine: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      ToastMessage.showToastMessage(
          message: 'Something went wrong, please try again',
          backgroundColor: Colors.red);
    }
  }

  Future<void> updateEngineImage({
    required Uint8List engineImageInBytes,
    required String engineId,
    required String token,
  }) async {
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          '${ApiEndPoints.baseUrl}${ApiEndPoints.updateEngineImageUrl}?id=$engineId'),
    );
    // Add image file to the request
    request.files.add(
      http.MultipartFile.fromBytes(
        'engines',
        engineImageInBytes,
        filename: 'engine.png',
      ),
    );

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 201) {
        debugPrint(await response.stream.bytesToString());
      } else {
        ToastMessage.showToastMessage(
            message: 'Something went wrong, please try again',
            backgroundColor: Colors.red);
        debugPrint('Error updating engine image:${response.reasonPhrase}');
      }
    } catch (e) {
      ToastMessage.showToastMessage(
          message: 'Something went wrong, please try again',
          backgroundColor: Colors.red);

      debugPrint('Error updating engine image: $e');
    }
  }
}
