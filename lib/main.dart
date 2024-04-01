import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/views/dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mechanix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DashboardScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(UniversalController());
      }),
    );
  }
}
