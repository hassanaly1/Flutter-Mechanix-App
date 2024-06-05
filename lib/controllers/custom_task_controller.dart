import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:mechanix/models/custom_task_model.dart';

class CustomTaskController extends GetxController {
  final formElements = <MyCustomTaskModel>[].obs;
  final images = <Uint8List>[].obs;

  void addFormElement(MyCustomTaskModel e) => formElements.add(e);

  void removeFormElement(MyCustomTaskModel e) => formElements.remove(e);

  void sending() {
    var list = formElements.map((e) => e.toMap()).toList();
    print('OnSubmit: ${jsonEncode(list)}');
  }
}
