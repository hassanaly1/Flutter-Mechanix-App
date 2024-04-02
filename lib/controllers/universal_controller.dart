import 'package:get/get.dart';
import 'package:mechanix/models/engine_model.dart';
import 'package:mechanix/models/task_model.dart';

class UniversalController extends GetxController {
  List<TaskModel> tasks = <TaskModel>[].obs;

  List reports = [].obs;
  List<EngineModel> engines = <EngineModel>[].obs;
}
