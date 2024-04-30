import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/models/engine_model.dart';

class EnginesController extends GetxController {
  RxBool isQrCodeGenerated = false.obs;
  RxString engineImage = ''.obs;
  TextEditingController engineName = TextEditingController();
  TextEditingController engineSubtitle = TextEditingController();
  RxString engineType = 'Generator'.obs;
  GlobalKey qrFormKey = GlobalKey<FormState>();
  RxString qrCodeData = ''.obs;

  final PageController pageController = PageController();
  final UniversalController universalController = Get.find();

  void generateQrCode() {
    var newEngineData = EngineModel(
      name: engineName.text.trim(),
      subtitle: engineSubtitle.text.trim(),
      type: engineType.value,
      image: engineImage.value,
      qrCode: qrCodeData.value,
    );
    universalController.engines.add(newEngineData);
    isQrCodeGenerated.value = true;
    // engineImage.value = '';
    // engineName.clear();
    // engineSubtitle.clear();
    engineType.value = 'Generator';
    // isQrCodeGenerated.value = false;
  }

  @override
  void onClose() {
    engineName.dispose();
    engineSubtitle.dispose();
    pageController.dispose();
    super.onClose();
  }
}
