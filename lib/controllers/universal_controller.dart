import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mechanix/helpers/storage_helper.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/models/compressor_model.dart';
import 'package:mechanix/models/engine_model.dart';
import 'package:mechanix/models/overhaul_report_model.dart';
import 'package:mechanix/models/payload.dart';
import 'package:mechanix/models/report_model.dart';
import 'package:mechanix/services/compressor_task_service.dart';
import 'package:mechanix/services/generator_task_service.dart';
import 'package:mechanix/services/overhaul_report_service.dart';
import 'package:mechanix/services/report_service.dart';

class UniversalController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isGeneratorTasksAreLoading = false.obs;
  RxBool isCompressorTasksAreLoading = false.obs;
  RxBool isOverhaulTasksAreLoading = false.obs;
  RxBool isReportsAreLoading = false.obs;

  RxInt numberOfControllers = 0.obs;

  // Tasks
  List<Payload> generatorTasks = <Payload>[].obs;
  List<CompressorTaskModel> compressorTasks = <CompressorTaskModel>[].obs;
  List<OverHaulReportModel> overhaulReportsTasks = <OverHaulReportModel>[].obs;

  List<ReportModel> reports = <ReportModel>[].obs;
  List<EngineModel> engines = <EngineModel>[].obs;

  final GeneratorTaskService generatorTaskService = GeneratorTaskService();
  final CompressorTaskService compressorTaskService = CompressorTaskService();
  OverhaulReportServices overhaulReportServices = OverhaulReportServices();
  final ReportService reportService = ReportService();

  XFile? userImage;
  RxString userImageURL = ''.obs;
  Uint8List? userImageInBytes;
  RxMap userInfo = {}.obs;

  set setUserImageUrl(String value) {
    print('ValueOfImage: $value');
    userImageURL.value = value;
    print('ValueOfImageUrl: ${userImageURL.value}');
    update();
  }

  //For Searching
  TextEditingController searchController = TextEditingController();

  //For Pagination
  ScrollController scrollControllerForGenerator = ScrollController();
  ScrollController scrollControllerForCompressor = ScrollController();
  ScrollController scrollControllerForOverhaul = ScrollController();
  final RxInt currentPage = 1.obs;

  final customerEngineInfo = CustomerEngineInfo();
  late EngineAssembly engineAssembly;
  late EngineAssemblyReportCont engineAssemblyReportCont;
  final engineAssemblyPartsExchangeCatalog =
      EngineAssemblyPartsExchangeCatalog();
  final gearTrain = GearTrain();

  @override
  void onInit() async {
    super.onInit();
    userInfo.value = storage.read('user_info') ?? {};
    userImageURL.value = storage.read('user_info')['profile'];
    debugPrint('UserImageAtStart: $userImageURL');
    engineAssembly = EngineAssembly(count: numberOfControllers.value);
    engineAssemblyReportCont =
        EngineAssemblyReportCont(count: numberOfControllers.value);
    // await getAllGeneratorTasks();
    // await getAllCompressorTasks();
    // await getAllOverhaulTasks();
    // for (var element in result) {
    //   print(element.customerEngineInfo.customer.text.trim());
    // }
    // print(result[1].finalToJson());

    // await getAllReports();
    scrollControllerForGenerator.addListener(() {
      if (scrollControllerForGenerator.position.pixels ==
          scrollControllerForGenerator.position.maxScrollExtent) {
        if (!isLoading.value) {
          _loadNextPageGenerators();
        }
      }
    });
    scrollControllerForCompressor.addListener(() {
      if (scrollControllerForCompressor.position.pixels ==
          scrollControllerForCompressor.position.maxScrollExtent) {
        if (!isLoading.value) {
          _loadNextPageCompressors();
        }
      }
    });
    scrollControllerForOverhaul.addListener(() {
      if (scrollControllerForOverhaul.position.pixels ==
          scrollControllerForOverhaul.position.maxScrollExtent) {
        if (!isLoading.value) {
          // _loadNextPageCompressors();
        }
      }
    });
  }

  updateUserInfo(Map<String, dynamic> userInfo) {
    this.userInfo.value = userInfo;
    storage.write('user_info', userInfo);
  }

  void _loadNextPageGenerators() async {
    debugPrint('Loading Next Page ${currentPage.value} Generator Tasks');
    isLoading.value = true;

    List<Payload> nextPageTasks = await generatorTaskService.getAllTasks(
      token: storage.read('token'),
      page: currentPage.value,
    );

    // Create a Set of existing task IDs to avoid duplicates
    Set<String?> existingTaskIds =
        generatorTasks.map((task) => task.task?.taskId).toSet();

    // Add only unique tasks
    for (var task in nextPageTasks) {
      if (!existingTaskIds.contains(task.task?.taskId)) {
        generatorTasks.add(task);
        existingTaskIds
            .add(task.task?.taskId); // Update the set with the new task ID
      }
    }

    // Only increment the page if we received a full page of tasks
    if (nextPageTasks.length >= 10) {
      currentPage.value++;
    }

    isLoading.value = false;
  }

  void _loadNextPageCompressors() async {
    debugPrint('Loading Next Page ${currentPage.value} Compressor Tasks');
    isLoading.value = true;

    List<CompressorTaskModel> nextPageTasks =
        await compressorTaskService.getAllCompressorTasks(
      token: storage.read('token'),
      page: currentPage.value,
    );

    // Create a Set of existing task IDs to avoid duplicates
    Set<String?> existingTaskIds =
        compressorTasks.map((task) => task.taskId).toSet();

    // Add only unique tasks
    for (var task in nextPageTasks) {
      if (!existingTaskIds.contains(task.taskId)) {
        compressorTasks.add(task);
        existingTaskIds.add(task.taskId); // Update the set with the new task ID
      }
    }

    // Only increment the page if we received a full page of tasks
    if (nextPageTasks.length >= 10) {
      currentPage.value++;
    }

    isLoading.value = false;
  }

  Future<void> getAllGeneratorTasks({String? searchName, int? page}) async {
    debugPrint('Page${page ?? currentPage.value} Generator tasks called.');
    try {
      isGeneratorTasksAreLoading.value = true;
      List<Payload> fetchedTasks = await generatorTaskService.getAllTasks(
        searchString: searchName ?? '',
        token: storage.read('token'),
        page: page ?? currentPage.value,
      );
      if (fetchedTasks.isNotEmpty) {
        debugPrint('GeneratorTasksCount: ${fetchedTasks.length}');
        generatorTasks = fetchedTasks;
      } else {
        generatorTasks = [];
      }
    } catch (e) {
      debugPrint('Error fetching Generator Tasks: $e');
    } finally {
      isGeneratorTasksAreLoading.value = false;
    }
  }

  Future<void> getAllCompressorTasks({String? searchName, int? page}) async {
    debugPrint('Page ${page ?? currentPage.value} Compressor tasks called.');
    try {
      isCompressorTasksAreLoading.value = true;
      List<CompressorTaskModel> fetchedCompressorTasks =
          await compressorTaskService.getAllCompressorTasks(
        searchString: searchName ?? '',
        token: storage.read('token'),
        page: page ?? currentPage.value,
      );
      if (fetchedCompressorTasks.isNotEmpty) {
        debugPrint('CompressorTasksCount: ${fetchedCompressorTasks.length}');
        compressorTasks = fetchedCompressorTasks;
      } else {
        compressorTasks = [];
      }
    } catch (e) {
      debugPrint('Error fetching compressorTasks: $e');
    } finally {
      isCompressorTasksAreLoading.value = false;
    }
  }

  Future<List<OverHaulReportModel>> getAllOverhaulTasks(
      {String? searchName, int? page}) async {
    debugPrint('Page ${page ?? currentPage.value} Overhaul tasks called.');
    try {
      isOverhaulTasksAreLoading.value = true;
      List<dynamic> data = await overhaulReportServices.getAllTasks(
        searchString: searchName ?? '',
        token: storage.read('token'),
        page: page ?? currentPage.value,
      );
      List<OverHaulReportModel> fetchedOverhaulTasks =
          OverHaulReportModel.fromJsonList(data);
      debugPrint('OverhawlTasksCount: ${fetchedOverhaulTasks.length}');
      if (fetchedOverhaulTasks.isNotEmpty) {
        overhaulReportsTasks = fetchedOverhaulTasks;
      } else {
        overhaulReportsTasks = [];
      }
      return overhaulReportsTasks;
    } catch (e) {
      debugPrint('Error fetching OverhawlTasks: $e');
    } finally {
      isOverhaulTasksAreLoading.value = false;
    }
    return [];
  }

  Future<void> getAllReports({String? searchName, String? date}) async {
    debugPrint('Page${currentPage.value} reports called.');
    // String formattedDate = DateFormat('yyyy-MM-dd').format(date!);
    // // Add the time part to the formatted date
    // String startTime = '$formattedDate+T12:59:20.849+00:00';

    debugPrint('Date: $date');
    try {
      isReportsAreLoading.value = true;
      List<ReportModel> fetchedReports = await reportService.getAllReport(
          searchString: searchName ?? '',
          token: storage.read('token'),
          page: currentPage.value,
          date: date);
      if (fetchedReports.isNotEmpty) {
        debugPrint('ReportsCount: ${fetchedReports.length}');
        reports = fetchedReports;
      } else {
        reports = [];
      }
    } catch (e) {
      debugPrint('Error fetching reports: $e');
    } finally {
      isReportsAreLoading.value = false;
    }
  }

  Future<void> deleteGeneratorTask({taskId}) async {
    isLoading.value = true;
    try {
      bool taskDeleted = await generatorTaskService.deleteTaskById(
        taskId: taskId,
        token: storage.read('token'),
      );

      if (taskDeleted) {
        await getAllGeneratorTasks();
        ToastMessage.showToastMessage(
            message: 'Task Deleted Successfully',
            backgroundColor: Colors.green);
        Get.back();
      } else {
        ToastMessage.showToastMessage(
            message: 'Failed to delete task, please try again',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      ToastMessage.showToastMessage(
          message: 'Something went wrong, please try again',
          backgroundColor: Colors.red);
      debugPrint('Error deleting task: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteCompressorTask({taskId}) async {
    isLoading.value = true;
    try {
      bool taskDeleted = await compressorTaskService.deleteTaskById(
        taskId: taskId,
        token: storage.read('token'),
      );

      if (taskDeleted) {
        await getAllCompressorTasks(page: 1);
        ToastMessage.showToastMessage(
            message: 'Task Deleted Successfully',
            backgroundColor: Colors.green);
        Get.back();
      } else {
        ToastMessage.showToastMessage(
            message: 'Failed to delete task, please try again',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      ToastMessage.showToastMessage(
          message: 'Something went wrong, please try again',
          backgroundColor: Colors.red);
      debugPrint('Error deleting task: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteOverhaulTask({taskId}) async {
    isLoading.value = true;
    try {
      bool taskDeleted = await overhaulReportServices.deleteTaskById(
        taskId: taskId,
        token: storage.read('token'),
      );

      if (taskDeleted) {
        await getAllOverhaulTasks(page: 1);
        ToastMessage.showToastMessage(
            message: 'Task Deleted Successfully',
            backgroundColor: Colors.green);
        Get.back();
      } else {
        ToastMessage.showToastMessage(
            message: 'Failed to delete task, please try again',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      ToastMessage.showToastMessage(
          message: 'Something went wrong, please try again',
          backgroundColor: Colors.red);
      debugPrint('Error deleting task: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteReport({reportId}) async {
    isLoading.value = true;
    try {
      bool reportDeleted = await reportService.deleteReportById(
        reportId: reportId,
        token: storage.read('token'),
      );
      await getAllReports(searchName: '');
      if (reportDeleted) {
        ToastMessage.showToastMessage(
            message: 'Report Deleted Successfully',
            backgroundColor: Colors.green);
        Get.back();
      } else {
        ToastMessage.showToastMessage(
            message: 'Failed to delete report, please try again',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      ToastMessage.showToastMessage(
          message: 'Something went wrong, please try again',
          backgroundColor: Colors.red);
      debugPrint('Error deleting report: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
