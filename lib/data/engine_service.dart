import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mechanix/data/api_endpoints.dart';
import 'package:mechanix/models/engine_model.dart';

class EngineService {
  final _storage = GetStorage();

  Future<void> addEngine({
    required EngineModel engineModel,
    required Uint8List engineImageInBytes,
  }) async {
    if (engineImageInBytes.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Please Select an Engine Image',
        backgroundColor: Colors.red,
      );
      return;
    }

    var headers = {
      'Authorization': 'Bearer ${_storage.read('token')}',
      'Content-Type': 'application/json'
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://mechanix-api-production.up.railway.app/api/engine/createenginebrand'),
    );

    // Add form fields
    request.fields.addAll({
      'engine_brand[user]': '${_storage.read('user_info')['_id']}',
      'engine_brand[name]': '${engineModel.name}',
      'engine_brand[subname]': '${engineModel.subname}',
      'engine_brand[is_generator]': '${engineModel.isGenerator}',
      'engine_brand[is_compressor]': '${engineModel.isCompressor}',
    });

    // Add image file to the request
    request.files.add(
      http.MultipartFile.fromBytes(
        'engines',
        engineImageInBytes,
        filename: 'placeholder.png',
      ),
    );

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 201) {
        debugPrint(await response.stream.bytesToString());
      } else {
        Fluttertoast.showToast(
          msg: 'Failed to add engine: ${response.reasonPhrase}',
          backgroundColor: Colors.red,
        );
        debugPrint(response.reasonPhrase);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error adding engine: $e',
        backgroundColor: Colors.red,
      );
      debugPrint('Error adding engine: $e');
    }
  }
}
