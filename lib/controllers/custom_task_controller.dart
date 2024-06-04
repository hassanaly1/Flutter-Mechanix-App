import 'package:get/get.dart';

class CustomTaskController extends GetxController {
  final formElements = <MyCustomTaskModel>[].obs;

  void addFormElement(MyCustomTaskModel e) => formElements.add(e);
}

enum MyCustomTaskType { textfield, textArea, radioButton, checkbox, attachment }

class MyCustomTaskModel {
  final String? heading, value;
  final List<String>? options;
  final MyCustomTaskType? type;

  MyCustomTaskModel({this.heading, this.value, this.options, this.type});
}
