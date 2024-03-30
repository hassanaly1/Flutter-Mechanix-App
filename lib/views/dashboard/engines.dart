import 'package:mechanix/views/dashboard/profile_section.dart';
import 'package:flutter/material.dart';

class EngineSection extends StatelessWidget {
  const EngineSection({
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
            'Engines',
            style: TextStyle(fontSize: 35),
          ),
        ),
      ),
    );
  }
}
