import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/views/auth/login.dart';
import 'package:mechanix/views/auth/onboarding/onbaording.dart';

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
      home: const OnBoardingScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(UniversalController());
      }),
    );
  }
}
