import 'package:flutter/material.dart';
import 'package:mechanix/views/dashboard/profile_section.dart';

class CustomizeUnitSection extends StatelessWidget {
  const CustomizeUnitSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: reusableContainerDecoration(),
        child: const Center(
          child: Text(
            'Customize Units',
            style: TextStyle(fontSize: 35),
          ),
        ),
      ),
    );
  }
}
