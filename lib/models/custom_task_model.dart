import 'dart:typed_data';

enum MyCustomTaskType { textfield, textArea, radioButton, checkbox, attachment }

String? _typeInString(MyCustomTaskType? type) => type?.name;

MyCustomTaskType? _typeFromString(String? type) {
  switch (type) {
    case 'textfield':
      return MyCustomTaskType.textfield;
    case 'textArea':
      return MyCustomTaskType.textArea;
    case 'radioButton':
      return MyCustomTaskType.radioButton;
    case 'checkbox':
      return MyCustomTaskType.checkbox;
    case 'attachment':
      return MyCustomTaskType.attachment;
    default:
      return null;
  }
}

class MyCustomTaskModel {
  String? label;
  List<String>? options;
  MyCustomTaskType? type;
  dynamic controller;

  MyCustomTaskModel({this.label, this.options, this.type, this.controller});

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'options': options,
      'type': _typeInString(type),
      'value': type == MyCustomTaskType.textfield ||
              type == MyCustomTaskType.textArea
          ? controller.text.trim()
          : type == MyCustomTaskType.radioButton
              ? controller.value
              : type == MyCustomTaskType.checkbox
                  ? controller.value
                  : type == MyCustomTaskType.attachment
                      ? (controller is Uint8List ? controller : null)
                      : null
    };
  }

  fromMap(Map<String, dynamic> map) {
    return MyCustomTaskModel(
      label: map['heading'],
      options: map['options'],
      type: _typeFromString(map['type']),
      controller: map['controller'],
    );
  }
}
