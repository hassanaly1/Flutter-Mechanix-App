import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/storage_helper.dart';
import 'package:mechanix/services/api_endpoints.dart';

class AuthService {
  // RegisterUser
  Future<Map<String, dynamic>> registerUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String confirmPassword}) async {
    final Uri apiUrl =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.registerUserUrl);
    final Map<String, dynamic> payload = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    };

    try {
      final response = await http.post(apiUrl,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(payload));

      if (response.statusCode == 201) {
        debugPrint('StatusCode: ${response.statusCode}');
        debugPrint('ResponseBody: ${response.body}');
        return jsonDecode(response.body);
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        debugPrint('StatusCodeIfError: ${response.statusCode}');
        debugPrint('StatusCodeIfError: ${response.body}');

        return {
          'status': 'error',
          'message': errorResponse['message'],
          'code': response.statusCode,
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Network error: $e',
      };
    }
  }

  // VerifyEmail
  Future<Map<String, dynamic>> verifyEmail(
      {required String email, required String otp}) async {
    final Uri apiUrl =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.verifyEmailUrl);

    final Map<String, dynamic> payload = {
      'email': email,
      'otp': otp,
    };

    try {
      final http.Response response = await http.post(
        apiUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        debugPrint('StatusCode: ${response.statusCode}');
        debugPrint('ResponseBody: ${response.body}');

        return jsonDecode(response.body);
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        debugPrint('StatusCodeIfError: ${response.statusCode}');
        debugPrint('StatusCodeIfError: ${response.body}');

        return {
          'status': 'error',
          'message': errorResponse['message'],
          'code': response.statusCode,
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Network error: $e',
      };
    }
  }

  //LoginUser
  Future<Map<String, dynamic>> loginUser(
      {required String email, required String password}) async {
    final Uri apiUrl =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.loginUserUrl);

    final Map<String, dynamic> payload = {
      "email": email,
      "password": password,
    };

    try {
      final response = await http.post(apiUrl,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(payload));

      if (response.statusCode == 200) {
        debugPrint('StatusCode: ${response.statusCode}');
        debugPrint('ResponseBody: ${response.body}');
        return jsonDecode(response.body);
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        debugPrint('StatusCodeIfError: ${response.statusCode}');
        debugPrint('StatusCodeIfError: ${response.body}');

        return {
          'status': 'error',
          'message': errorResponse['message'],
          'code': response.statusCode,
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Network error: $e',
      };
    }
  }

  //ForgetPassword || SendOtp
  Future<Map<String, dynamic>> sendOtp({required String email}) async {
    final Uri apiUrl =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.sendOtpUrl);

    final Map<String, dynamic> payload = {
      "email": email,
    };

    try {
      final response = await http.post(apiUrl,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(payload));

      if (response.statusCode == 200) {
        debugPrint('StatusCode: ${response.statusCode}');
        debugPrint('ResponseBody: ${response.body}');
        return jsonDecode(response.body);
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        debugPrint('StatusCodeIfError: ${response.statusCode}');
        debugPrint('StatusCodeIfError: ${response.body}');

        return {
          'status': 'error',
          'message': errorResponse['message'],
          'code': response.statusCode,
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Network error: $e',
      };
    }
  }

  // VerifyOtpUrl
  Future<Map<String, dynamic>> verifyOtp(
      {required String email, required String otp}) async {
    final Uri apiUrl =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.verifyOtpUrl);

    final Map<String, dynamic> payload = {
      'email': email,
      'otp': otp,
    };

    try {
      final http.Response response = await http.post(
        apiUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        debugPrint('StatusCode: ${response.statusCode}');
        // debugPrint('ResponseBody: ${response.body}');

        return jsonDecode(response.body);
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        debugPrint('StatusCodeIfError: ${response.statusCode}');
        debugPrint('StatusCodeIfError: ${response.body}');

        return {
          'status': 'error',
          'message': errorResponse['message'],
          'code': response.statusCode,
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Network error: $e',
      };
    }
  }

  // ChangePassword
  Future<Map<String, dynamic>> changePassword(
      {required String password,
      required String confirmPassword,
      required String token}) async {
    final Uri apiUrl =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.changePasswordUrl);

    final Map<String, dynamic> payload = {
      'password': password,
      'confirm_password': confirmPassword,
    };

    try {
      final http.Response response = await http.post(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        debugPrint('StatusCode: ${response.statusCode}');
        debugPrint('ResponseBody: ${response.body}');

        return jsonDecode(response.body);
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        debugPrint('StatusCodeIfError: ${response.statusCode}');
        debugPrint('StatusCodeIfError: ${response.body}');

        return {
          'status': 'error',
          'message': errorResponse['message'],
          'code': response.statusCode,
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Network error: $e',
      };
    }
  }

// UpdateProfile
  Future<bool> updateProfile({
    required String firstName,
    required String lastName,
    // Uint8List? userImageInBytes,
    required String token,
  }) async {
    bool isSuccess = false; // Initialize isSuccess variable

    var headers = {
      'Authorization': 'Bearer $token',
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${ApiEndPoints.baseUrl}${ApiEndPoints.updateProfileUrl}'),
    );

    request.fields.addAll({
      'first_name': firstName,
      'last_name': lastName,
    });
    // Validate image data
    // if (userImageInBytes != null && userImageInBytes.isNotEmpty) {
    //   request.files.add(
    //     http.MultipartFile.fromBytes(
    //       'profile',
    //       userImageInBytes,
    //       filename: 'profile.png',
    //     ),
    //   );
    // } else {
    //   debugPrint('Image data is empty or null');
    // }
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String responseString = await response.stream.bytesToString();
        try {
          Map<String, dynamic> jsonResponse = json.decode(responseString);
          if (jsonResponse['status'] == 'success') {
            Map<String, dynamic> userData = jsonResponse['data'][0]['user'];
            storage.write('user_info', userData);
            Get.find<UniversalController>().updateUserInfo(userData);
            isSuccess = true;
            debugPrint('Profile updated successfully');
          } else {
            debugPrint(
                'Error: ${jsonResponse['message']} ${response.reasonPhrase}}');
          }
          debugPrint('Profile updated successfully');
        } on FormatException catch (e) {
          debugPrint('Error parsing response: $e');
        }
      } else {
        debugPrint(
            'Error: Status code ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      if (e is SocketException) {
        debugPrint('Network error: $e');
      } else {
        debugPrint('Error updating info: $e');
      }
    }

    return isSuccess; // Return isSuccess value after API call
  }

  Future<UpdateUserImageResult> updateUserImage({
    required Uint8List engineImageInBytes,
    required String token,
  }) async {
    bool isSuccess = false;
    Map<String, dynamic>? userData;

    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          '${ApiEndPoints.baseUrl}${ApiEndPoints.updateProfilePictureUrl}'),
    );
    request.files.add(
      http.MultipartFile.fromBytes(
        'profile',
        engineImageInBytes,
        filename: 'profile.png',
      ),
    );
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String responseString = await response.stream.bytesToString();
        debugPrint('Response: $responseString');
        try {
          Map<String, dynamic> jsonResponse = json.decode(responseString);
          if (jsonResponse['status'] == 'success') {
            userData = jsonResponse['data'][0]['user'];
            storage.write('user_info', userData);
            Get.find<UniversalController>().updateUserInfo(userData!);
            isSuccess = true;
            debugPrint('Profile updated successfully');
          } else {
            debugPrint(
                'Error: ${jsonResponse['message']} ${response.reasonPhrase}}');
          }
        } on FormatException catch (e) {
          debugPrint('Error parsing response: $e');
        }
      } else {
        debugPrint(
            'Error: Status code ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      if (e is SocketException) {
        debugPrint('Network error: $e');
      } else {
        debugPrint('Error updating info: $e');
      }
    }

    return UpdateUserImageResult(isSuccess: isSuccess, userData: userData);
  }
}

class UpdateUserImageResult {
  final bool isSuccess;
  final Map<String, dynamic>? userData;

  UpdateUserImageResult({required this.isSuccess, this.userData});
}
