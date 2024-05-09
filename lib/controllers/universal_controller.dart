import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mechanix/data/task_service.dart';
import 'package:mechanix/models/engine_model.dart';
import 'package:mechanix/models/payload.dart';
import 'package:mechanix/models/task_model.dart';

class UniversalController extends GetxController {
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
    debugPrint(tasks[0].task?.userId ?? 'No User Id Found'.toString());
    debugPrint(tasks[0].task?.name ?? 'No Task Name Found'.toString());
    debugPrint(tasks[0].task?.customerEmail ?? 'No Email Found'.toString());
    debugPrint(tasks[0].task?.nameJourneyMan ?? 'No Name Found'.toString());
    debugPrint(tasks[0].task?.jobScope ?? 'No Job Scope Found'.toString());
  }

  Future<void> getAllTasks() async {
    List<Payload> fetchedTasks = await taskService.getAllTasks(
      userId: _storage.read('user_info')['_id'],
      token: _storage.read('token'),
    );
    if (fetchedTasks.isNotEmpty) {
      debugPrint('FetchedList: $fetchedTasks');
      tasks = fetchedTasks;
    }
  }
}
