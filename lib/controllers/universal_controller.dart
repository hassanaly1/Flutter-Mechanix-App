import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mechanix/data/generator_task_service.dart';
import 'package:mechanix/data/report_service.dart';
import 'package:mechanix/helpers/storage_helper.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/models/engine_model.dart';
import 'package:mechanix/models/payload.dart';
import 'package:mechanix/models/report_model.dart';

class UniversalController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isTasksAreLoading = false.obs;
  RxBool isReportsAreLoading = false.obs;
  List<Payload> tasks = <Payload>[].obs;

  List<ReportModel> reports = <ReportModel>[].obs;
  List<EngineModel> engines = <EngineModel>[].obs;

  final TaskService taskService = TaskService();
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
  ScrollController scrollController = ScrollController();
  final RxInt currentPage = 1.obs;

  @override
  void onInit() async {
    super.onInit();
    userInfo.value = storage.read('user_info') ?? {};
    userImageURL.value = storage.read('user_info')['profile'];
    debugPrint('UserImageAtStart: $userImageURL');
    await getAllGeneratorTasks();
    await getAllReports();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!isLoading.value) {
          _loadNextPage();
        }
      }
    });
  }

  updateUserInfo(Map<String, dynamic> userInfo) {
    this.userInfo.value = userInfo;
    storage.write('user_info', userInfo);
  }

  void _loadNextPage() async {
    debugPrint('Loading Next Page');
    isLoading.value = true;
    List<Payload> nextPageTasks = await taskService.getAllTasks(
      token: storage.read('token'),
      page: currentPage.value,
    );

    tasks.addAll(nextPageTasks);
    currentPage.value++;
    isLoading.value = false;
  }

  Future<void> getAllGeneratorTasks({String? searchName, int? page}) async {
    debugPrint('Page${page ?? currentPage.value} tasks called.');
    try {
      isTasksAreLoading.value = true;
      List<Payload> fetchedTasks = await taskService.getAllTasks(
        searchString: searchName ?? '',
        token: storage.read('token'),
        page: page ?? currentPage.value,
      );
      if (fetchedTasks.isNotEmpty) {
        debugPrint('TasksCount: ${fetchedTasks.length}');
        tasks = fetchedTasks;
      } else {
        tasks = [];
      }
    } catch (e) {
      debugPrint('Error fetching tasks: $e');
    } finally {
      isTasksAreLoading.value = false;
    }
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

  Future<void> deleteTask({taskId}) async {
    isLoading.value = true;
    try {
      bool taskDeleted = await taskService.deleteTaskById(
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
