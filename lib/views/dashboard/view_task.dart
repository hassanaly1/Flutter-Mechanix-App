import 'package:mechanix/views/dashboard/profile_section.dart';
import 'package:flutter/material.dart';

class ViewTaskSection extends StatelessWidget {
  const ViewTaskSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: reusableContainerDecoration(),
      child: const Center(
        child: Text(
          'View Task',
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}
