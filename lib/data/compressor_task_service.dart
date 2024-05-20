class CompressorTaskResponse {
  final bool success;
  final String message;
  final String? taskId;

  CompressorTaskResponse(
      {required this.success, required this.message, this.taskId});
}

class CompressorTaskService {}
