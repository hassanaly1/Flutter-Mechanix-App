import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mechanix/views/auth/login.dart';
import 'package:mechanix/views/auth/onboarding/onbaording.dart';
import 'package:mechanix/views/dashboard/dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    bool isFirstTime = storage.read('isFirstTime') ?? true;

    return GetMaterialApp(
      title: 'Mechanix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isFirstTime == true
          ? const OnBoardingScreen()
          : storage.read('token') != null
              ? const DashboardScreen()
              : LoginScreen(),
      // initialBinding: BindingsBuilder(() {
      //   Get.put(UniversalController());
      // }),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
