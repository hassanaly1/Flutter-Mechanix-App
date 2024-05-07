import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/data/engine_service.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/models/engine_model.dart';
import 'package:image_picker/image_picker.dart';

class EnginesController extends GetxController {
  final _storage = GetStorage();
  RxBool isQrCodeGenerated = false.obs;
  XFile? engineImage;
  Uint8List? engineImageInBytes;
  RxString engineImageUrl = ''.obs;
  TextEditingController engineName = TextEditingController();
  TextEditingController engineSubtitle = TextEditingController();
  RxString engineType = 'Generator'.obs;
  GlobalKey qrFormKey = GlobalKey<FormState>();
  RxString qrCodeData = ''.obs;

  final ImagePicker picker = ImagePicker();

  final PageController pageController = PageController();
  final UniversalController universalController = Get.find();

  // Function to pick an image
  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      engineImage = image;
      engineImageUrl.value = image.path;
      engineImageInBytes = await engineImage?.readAsBytes();
      debugPrint(engineImageUrl.value);
      debugPrint('Image Picked');
      update();
    }
  }

  void addEngine() {
    if (engineImageUrl.value == '') {
      ToastMessage.showToastMessage(
          message: 'Please Select an Engine Image',
          backgroundColor: Colors.red);
    } else {
      var newEngine = EngineModel(
        userId: _storage.read('user_info')['_id'],
        name: engineName.text.trim(),
        imageUrl: engineImageUrl.value,
        subname: engineSubtitle.text.trim(),
        isGenerator: engineType.value == 'Generator',
        isCompressor: engineType.value == 'Compressor',
      );

      EngineService()
          .addEngine(
              engineModel: newEngine, engineImageInBytes: engineImageInBytes!)
          .then((value) {
        ToastMessage.showToastMessage(
            message: 'Engine Added Successfully',
            backgroundColor: Colors.green);
        pageController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
        isQrCodeGenerated.value = true;
        engineType.value = 'Generator';
      });
    }
  }

  @override
  void onClose() {
    engineName.clear();
    engineSubtitle.clear();
    engineImageUrl.value = '';
    engineImageInBytes = null;
    isQrCodeGenerated.value = false;
    pageController.dispose();
    super.onClose();
  }
}
