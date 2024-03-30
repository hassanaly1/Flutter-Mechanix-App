import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/models/engine_model.dart';

class EnginesController extends GetxController {
  RxBool isQrCodeGenerated = false.obs;
  RxString engineImage = ''.obs;
  TextEditingController engineName = TextEditingController();
  TextEditingController engineSubtitle = TextEditingController();
  GlobalKey qrFormKey = GlobalKey<FormState>();
  RxString qrCodeData = ''.obs;

  final UniversalController universalController = Get.find();

  void generateQrCode() {
    var newEngineData = EngineModel(
      name: engineName.text.trim(),
      subtitle: engineSubtitle.text.trim(),
      image: engineImage.value,
      qrCode: qrCodeData.value,
    );
    universalController.engines.add(newEngineData);
    debugPrint(universalController.engines.length.toString());
    debugPrint(newEngineData.name);
    isQrCodeGenerated.value = true;
    engineImage.value = '';
    engineName.clear();
    engineSubtitle.clear();
  }
}
