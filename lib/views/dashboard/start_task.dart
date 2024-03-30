import 'package:mechanix/views/add_task/add_task.dart';
import 'package:flutter/material.dart';

class StartTaskSection extends StatelessWidget {
  const StartTaskSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AddTaskScreen(),
    );
  }
}
