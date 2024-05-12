import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mechanix/controllers/user_controller.dart';
import 'package:mechanix/data/task_service.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/models/engine_model.dart';
import 'package:mechanix/models/payload.dart';

class UniversalController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isTasksAreLoading = false.obs;
  List<Payload> tasks = <Payload>[].obs;

  List reports = [].obs;
  List<EngineModel> engines = <EngineModel>[].obs;

  final TaskService taskService = TaskService();
  final _storage = GetStorage();

  //For Searching
  TextEditingController searchController = TextEditingController();

  //For Pagination
  ScrollController scrollController = ScrollController();
  final RxInt currentPage = 1.obs;

  UserController userController = Get.put(UserController());

  @override
  void onInit() async {
    super.onInit();
    await getAllTasks();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!isLoading.value) {
          _loadNextPage();
        }
      }
    });
  }

  void _loadNextPage() async {
    debugPrint('Loading Next Page');
    isLoading.value = true;
    List<Payload> nextPageTasks = await taskService.getAllTasks(
      token: _storage.read('token'),
      page: currentPage.value,
    );

    tasks.addAll(nextPageTasks);
    currentPage.value++;
    isLoading.value = false;
  }

  Future<void> getAllTasks({String? searchName}) async {
    try {
      isTasksAreLoading.value = true;
      List<Payload> fetchedTasks = await taskService.getAllTasks(
        searchString: searchName ?? '',
        token: _storage.read('token'),
        page: currentPage.value,
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

  Future<void> deleteTask({taskId}) async {
    isLoading.value = true;
    try {
      await taskService.deleteTaskById(
        taskId: taskId,
        token: _storage.read('token'),
      );

      await getAllTasks();
      ToastMessage.showToastMessage(
          message: 'Task Deleted Successfully', backgroundColor: Colors.green);
      Get.back();
    } catch (e) {
      ToastMessage.showToastMessage(
          message: 'Something went wrong, please try again',
          backgroundColor: Colors.red);
      debugPrint('Error deleting task: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
