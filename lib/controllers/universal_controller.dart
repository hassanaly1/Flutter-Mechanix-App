import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mechanix/data/task_service.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/models/engine_model.dart';
import 'package:mechanix/models/payload.dart';
import 'package:mechanix/models/task_model.dart';

class UniversalController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isTasksAreLoading = false.obs;
  List<Payload> tasks = <Payload>[].obs;

  List reports = [].obs;
  List<EngineModel> engines = <EngineModel>[].obs;

  final TaskService taskService = TaskService();
  final _storage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    await getAllTasks();
    debugPrint('Tasks: ${tasks.length}');
  }

  Future<void> getAllTasks() async {
    try {
      isTasksAreLoading.value = true;
      List<Payload> fetchedTasks = await taskService.getAllTasks(
        userId: _storage.read('user_info')['_id'],
        token: _storage.read('token'),
      );
      if (fetchedTasks.isNotEmpty) {
        debugPrint('FetchedList: $fetchedTasks');
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
