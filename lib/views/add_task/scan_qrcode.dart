import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/task_controllers.dart';
import 'package:mechanix/helpers/appbar.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/toast.dart';
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
                // controller: MobileScannerController(
                //   //this only scans the same qr code only once
                //   detectionSpeed: DetectionSpeed.noDuplicates,
                //
                //   returnImage: true,
                // ),
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  final Uint8List? image = capture.image;
                  for (final barcode in barcodes) {
                    debugPrint('QRCode Found: ${barcode.rawValue}');
                    controller.engineBrandId.value = barcode.rawValue ?? '';
                  }
                  if (image != null) {
                    _showDialog(
                        context: context,
                        image: image,
                        barCodeValue: barcodes.first.rawValue);
                  }
                  Timer(const Duration(seconds: 1), () {
                    Get.back();
                    Get.back();
                    ToastMessage.showToastMessage(
                        message: 'QR Code Scanned Successfully',
                        backgroundColor: AppColors.blueTextColor);
                  });
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
    {required BuildContext context, Uint8List? image, String? barCodeValue}) {
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
                      text: barCodeValue ?? '',
                      fontSize: 12.0,
                      maxLines: 2,
                      textAlign: TextAlign.center),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Image(image: MemoryImage(image!)),
                  // ),
                  QrImageView(data: barCodeValue ?? ''),
                  CustomButton(
                    isLoading: false,
                    usePrimaryColor: true,
                    buttonText: 'Save QR Code Value',
                    fontSize: 12.0,
                    onTap: () {
                      ToastMessage.showToastMessage(
                          message: 'QR Code Scanned Successfully',
                          backgroundColor: AppColors.blueTextColor);
                    },
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
