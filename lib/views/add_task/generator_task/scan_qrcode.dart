import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/generator_task_controllers.dart';
import 'package:mechanix/helpers/appbar.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/services/engine_service.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({super.key});

  @override
  State<ScanQrCodeScreen> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<ScanQrCodeScreen> {
  final AddTaskController controller = Get.find();
  late MobileScannerController mobileScannerController;

  @override
  void initState() {
    super.initState();
    // Initialize the MobileScannerController and store its reference
    mobileScannerController = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      returnImage: true,
    );
  }

  @override
  void dispose() {
    // Dispose of the MobileScannerController instance
    mobileScannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ReUsableAppbar(
              title: 'Scan QR Code',
              backgroundColor: AppColors.blueTextColor,
              showProfileAvatar: false,
            ),
            Expanded(
              child: MobileScanner(
                controller: mobileScannerController,
                onDetect: (capture) async {
                  final List<Barcode> barcodes = capture.barcodes;
                  final Uint8List? image = capture.image;

                  for (final barcode in barcodes) {
                    final String? engineName = barcode.rawValue;
                    if (engineName != null && engineName.isNotEmpty) {
                      debugPrint('QRCode Found: $engineName');
                      Timer(
                        const Duration(seconds: 2),
                        () => _showDialog(
                          context: context,
                          controller: controller,
                          engineName: barcodes.first.rawValue,
                        ),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showDialog(
    {required BuildContext context,
    String? engineName,
    required AddTaskController controller}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => Container(),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: AlertDialog(
            scrollable: true,
            backgroundColor: Colors.transparent,
            // title: CustomTextWidget(text: 'Hello'),
            content: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: context.height * 0.02),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(255, 220, 105, 0.4),
                    Color.fromRGBO(86, 127, 255, 0.4),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      spreadRadius: 5.0),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0)
                ],
              ),
              child: Column(
                children: [
                  CustomTextWidget(
                      text: engineName ?? '',
                      fontSize: 12.0,
                      maxLines: 2,
                      textAlign: TextAlign.center),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Image(image: MemoryImage(image!)),
                  // ),
                  QrImageView(data: engineName ?? ''),
                  Obx(
                    () => CustomButton(
                      isLoading: controller.isLoading.value,
                      usePrimaryColor: true,
                      buttonText: 'Save QR Code Value',
                      fontSize: 12.0,
                      onTap: () async {
                        try {
                          debugPrint('Saving QR Code for $engineName');
                          controller.isLoading.value = true;

                          final result = await EngineService()
                              .getEngineData(engineName: engineName ?? '');

                          if (result['success']) {
                            final engineData = result['data'];
                            final engineId = engineData['_id'];
                            final engineName = engineData['name'];

                            debugPrint('EngineId: ${engineId.toString()}');
                            debugPrint('EngineName: ${engineName.toString()}');

                            controller.engineBrandName.value = engineName ?? '';
                            controller.engineBrandId.value = engineId;

                            ToastMessage.showToastMessage(
                                message: 'QR Code Scanned Successfully',
                                backgroundColor: AppColors.blueTextColor);
                            Get.back();
                            Get.back();
                          } else {
                            final errorMessage = result['message'];
                            print('Failed to fetch engine data');
                            print('ErrorData: ${result['data']}');
                            debugPrint('ErrorMessage: $errorMessage');

                            ToastMessage.showToastMessage(
                                message: errorMessage,
                                backgroundColor: AppColors.blueTextColor);
                            Get.back();
                            Get.back();
                          }
                        } catch (e) {
                          debugPrint('An error occurred: $e');
                          ToastMessage.showToastMessage(
                              message: 'An error occurred, please try again',
                              backgroundColor: AppColors.blueTextColor);
                          Get.back();
                          Get.back();
                        } finally {
                          controller.isLoading.value = false;
                        }
                      },
                    ),
                  ),
                  const Divider(color: Colors.black54),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
