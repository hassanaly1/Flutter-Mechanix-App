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
  late Uint8List engineImageInBytes;
  RxString engineImageUrl = ''.obs;
  TextEditingController engineName = TextEditingController();
  TextEditingController engineSubtitle = TextEditingController();
  RxString engineType = 'Generator'.obs;
  GlobalKey engineFormKey = GlobalKey<FormState>();
  RxString qrCodeData = ''.obs;

  var fetchedEngines = <EngineModel>[].obs;

  final ImagePicker picker = ImagePicker();
  final PageController pageController = PageController();
  final UniversalController universalController = Get.find();
  EngineService engineService = EngineService();

  //For Pagination
  ScrollController scrollController = ScrollController();
  final RxInt _currentPage = 1.obs;

  //For Searching
  TextEditingController searchController = TextEditingController();

  @override
  onInit() {
    debugPrint('EnginesController Initialized');
    getAllEngines();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!isLoading.value) {
          _loadNextPage();
        }
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    pageController.dispose();
    universalController.dispose();
    super.dispose();
  }

  void _loadNextPage() async {
    debugPrint('Loading Next Page');
    isLoading.value = true;
    List<EngineModel> nextPageEngines = await engineService.getAllEngines(
      page: _currentPage.value + 1,
      token: _storage.read('token'),
    );

    fetchedEngines.addAll(nextPageEngines);
    _currentPage.value++;
    isLoading.value = false;
  }

  Future<void> getAllEngines({String? searchName}) async {
    debugPrint('GetAllEnginesFunctionCalled');
    try {
      isEnginesAreLoading.value = true;
      _currentPage.value = 1;
      // Call the service method to fetch the engines
      fetchedEngines.value = await engineService.getAllEngines(
        searchString: searchName ?? '',
        token: _storage.read('token'),
        page: _currentPage.value,
      );
      universalController.engines = fetchedEngines;
      debugPrint('EnginesCount: ${universalController.engines.length}');
      isEnginesAreLoading.value = false;
    } catch (e) {
      debugPrint('Error fetching engines: $e');
    } finally {
      isEnginesAreLoading.value = false;
    }
  }

  // Function to pick an image
  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      engineImage = image;
      engineImageUrl.value = image.path;
      engineImageInBytes = (await engineImage?.readAsBytes())!;
      debugPrint(engineImageUrl.value);
      debugPrint('Image Picked');
      update();
    }
  }

  // Function to update an image
  Future<void> updateImage(EngineModel model) async {
    debugPrint('Update Image Called');
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      engineImage = image;
      engineImageUrl.value = image.path;
      engineImageInBytes = (await engineImage?.readAsBytes())!;
      debugPrint(engineImageInBytes.lengthInBytes.toString());
      engineService.updateEngineImage(
          engineImageInBytes: engineImageInBytes,
          engineId: model.id ?? '',
          token: _storage.read('token'));
    }
  }

  void addEngine() async {
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
        debugPrint('UserId: ${newEngine.userId}');
        debugPrint('Name: ${newEngine.name}');
        debugPrint('ImageUrl: ${newEngine.imageUrl}');
        debugPrint('Image: $engineImageInBytes');
        debugPrint('Subname: ${newEngine.subname}');
        debugPrint('IsGenerator: ${newEngine.isGenerator}');
        debugPrint('IsCompressor: ${newEngine.isCompressor}');
        bool success = await engineService.addEngine(
            engineModel: newEngine, engineImageInBytes: engineImageInBytes);

        if (success) {
          ToastMessage.showToastMessage(
              message: 'Engine Added Successfully',
              backgroundColor: Colors.green);
          isLoading.value = false;
          pageController.nextPage(
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
          getAllEngines();
          isQrCodeGenerated.value = true;
          engineType.value = 'Generator';
        } else {
          ToastMessage.showToastMessage(
              message: 'Something went wrong, please try again',
              backgroundColor: Colors.red);
          isLoading.value = false;
        }
      } catch (e) {
        debugPrint(e.toString());
        ToastMessage.showToastMessage(
            message: 'Something went wrong, please try again',
            backgroundColor: Colors.red);
        isLoading.value = false;
      }
    }
  }

  Future<void> updateEngine({required String id}) async {
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
      bool success = await engineService.updateEngine(
          engineModel: updatedEngineData, token: _storage.read('token'));
      isLoading.value = false;
      if (success) {
        ToastMessage.showToastMessage(
            message: 'Engine Updated Successfully',
            backgroundColor: Colors.green);
        getAllEngines();
        Get.back();
      } else {
        ToastMessage.showToastMessage(
            message: 'Failed to update engine, please try again',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      debugPrint('Error updating engine: $e');
    } finally {
      // isLoading.value = false;
    }
  }

  Future<void> deleteEngine({required EngineModel engineModel}) async {
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
      bool success = await engineService.deleteEngine(
        engineModel: deletedEngineData,
        token: _storage.read('token'),
      );
      getAllEngines();
      isLoading.value = false;
      if (success) {
        ToastMessage.showToastMessage(
          message: 'Engine Deleted Successfully',
          backgroundColor: Colors.green,
        );
        Get.back();
      } else {
        ToastMessage.showToastMessage(
          message: 'Failed to delete engine, please try again',
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      isLoading.value = false;
      ToastMessage.showToastMessage(
        message: 'Something went wrong, please try again',
        backgroundColor: Colors.red,
      );
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
    engineImageInBytes = Uint8List(0);
    isQrCodeGenerated.value = false;
    pageController.dispose();
    super.onClose();
  }
}
