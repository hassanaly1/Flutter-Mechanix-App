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
  var isLoading = false.obs;
  var isEnginesAreLoading = false.obs;
  RxBool isQrCodeGenerated = false.obs;
  XFile? engineImage;
  Uint8List? engineImageInBytes;
  RxString engineImageUrl = ''.obs;
  TextEditingController engineName = TextEditingController();
  TextEditingController engineSubtitle = TextEditingController();
  RxString engineType = 'Generator'.obs;
  GlobalKey engineFormKey = GlobalKey<FormState>();
  RxString qrCodeData = ''.obs;

  final ImagePicker picker = ImagePicker();

  final PageController pageController = PageController();
  final UniversalController universalController = Get.find();
  EngineService engineService = EngineService();

  @override
  onInit() {
    debugPrint('EnginesController Initialized');
    getAllEngines();
    super.onInit();
  }

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
      isLoading.value = true;
      try {
        var newEngine = EngineModel(
          userId: _storage.read('user_info')['_id'],
          name: engineName.text.trim(),
          imageUrl: engineImageUrl.value,
          subname: engineSubtitle.text.trim(),
          isGenerator: engineType.value == 'Generator',
          isCompressor: engineType.value == 'Compressor',
        );
        engineImageInBytes != null
            ? engineService
                .addEngine(
                    engineModel: newEngine,
                    engineImageInBytes: engineImageInBytes!)
                .then((value) {
                ToastMessage.showToastMessage(
                    message: 'Engine Added Successfully',
                    backgroundColor: Colors.green);
                isLoading.value = false;
                pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
                getAllEngines();
                isQrCodeGenerated.value = true;
                engineType.value = 'Generator';
              })
            : ToastMessage.showToastMessage(
                message: 'Please Select an Engine Image',
                backgroundColor: Colors.red);
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        // isLoading.value = false;
      }
    }
  }

  Future<void> getAllEngines() async {
    debugPrint('GetAllEnginesFunctionCalled');
    try {
      isEnginesAreLoading.value = true;
      // Call the service method to fetch the engines
      List<EngineModel> fetchedEngines = await engineService.getAllEngines();
      // Assign the fetched engines to the engines list
      universalController.engines = fetchedEngines;
      debugPrint('EnginesCount: ${universalController.engines.length}');
      isEnginesAreLoading.value = false;
    } catch (e) {
      debugPrint('Error fetching engines: $e');
    } finally {
      isEnginesAreLoading.value = false;
    }
  }

  void updateEngine({required String id}) {
    debugPrint('UpdateEngineFunctionCalled');
    isLoading.value = true;
    try {
      var updatedEngineData = EngineModel(
        id: id,
        userId: _storage.read('user_info')['_id'],
        name: engineName.text.trim(),
        subname: engineSubtitle.text.trim(),
        isGenerator: engineType.value == 'Generator',
        isCompressor: engineType.value == 'Compressor',
      );
      engineService
          .updateEngine(
              engineModel: updatedEngineData, token: _storage.read('token'))
          .then((value) {
        isLoading.value = false;
        ToastMessage.showToastMessage(
            message: 'Engine Updated Successfully',
            backgroundColor: Colors.green);
        getAllEngines();
        Get.back();
      });
    } catch (e) {
      debugPrint('Error updating engine: $e');
    } finally {
      // isLoading.value = false;
    }
  }

  void deleteEngine({required EngineModel engineModel}) {
    debugPrint('DeleteEngineFunctionCalled');
    isLoading.value = true;
    try {
      var deletedEngineData = EngineModel(
        id: engineModel.id,
        userId: _storage.read('user_info')['_id'],
        name: engineModel.name,
        subname: engineModel.subname,
        isGenerator: engineModel.isGenerator,
        isCompressor: engineModel.isCompressor,
      );
      engineService
          .deleteEngine(
              engineModel: deletedEngineData, token: _storage.read('token'))
          .then((value) {
        getAllEngines();
        isLoading.value = false;
        ToastMessage.showToastMessage(
            message: 'Engine Deleted Successfully',
            backgroundColor: Colors.green);

        Get.back();
      });
    } catch (e) {
      isLoading.value = false;
      ToastMessage.showToastMessage(
          message: 'Something went wrong, please try again',
          backgroundColor: Colors.red);
      debugPrint('Error deleting engine: $e');
    } finally {
      // isLoading.value = false;
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
