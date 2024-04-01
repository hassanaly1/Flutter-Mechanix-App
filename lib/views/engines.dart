import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/engines_controller.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/helpers/validator.dart';
import 'package:mechanix/models/engine_model.dart';
import 'package:mechanix/views/add_task/widgets/heading&textfield.dart';
import 'package:mechanix/views/engine_detail.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EnginesScreen extends StatelessWidget {
  final SideMenuController sideMenu;
  EnginesScreen({super.key, required this.sideMenu});

  final EnginesController controller = Get.put(EnginesController());
  final UniversalController universalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            sideMenu.changePage(0);
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: context.height * 0.02,
                    horizontal: context.width * 0.05),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Obx(
                  () => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.isLandscape
                                ? context.width * 0.08
                                : 0.0),
                        child: ReUsableTextField(
                          hintText: 'Search Reports',
                          suffixIcon: const Icon(Icons.search_sharp),
                        ),
                      ),
                      CustomButton(
                        buttonText: '+ Add Engine',
                        onTap: () => _openAddEngineDialog(
                            context: context, controller: controller),
                      ),
                      universalController.engines.isEmpty
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomTextWidget(
                                  text: 'No Engines Added',
                                  maxLines: 2,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: universalController.engines.length,
                                itemBuilder: (context, index) {
                                  final engine =
                                      universalController.engines[index];
                                  return CustomEngineCard(
                                    model: engine,
                                    onTap: () => Get.to(
                                        () => EngineDetailScreen(model: engine),
                                        transition: Transition.size),
                                  );
                                },
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _openAddEngineDialog(
    {required BuildContext context, required EnginesController controller}) {
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
          child: Obx(
            () => AlertDialog(
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
                    // InkWell(
                    //   onTap: () {},
                    //   child: Container(
                    //     height: context.height * 0.1,
                    //     decoration: const BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       image: DecorationImage(
                    //           fit: BoxFit.contain,
                    //           image: AssetImage("assets/images/engine.png")),
                    //     ),
                    //   ),
                    // ),
                    Form(
                        key: controller.qrFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadingAndTextfield(
                              title: 'Enter Engine Name & Model',
                              fontSize: 12.0,
                              controller: controller.engineName,
                              validator: (val) =>
                                  AppValidator.validateEmptyText(
                                      fieldName: 'Engine Name & Model',
                                      value: val),
                            ),
                            HeadingAndTextfield(
                              title: 'Enter Subtitle',
                              fontSize: 12.0,
                              controller: controller.engineSubtitle,
                              validator: (val) =>
                                  AppValidator.validateEmptyText(
                                      fieldName: 'Engine Subtitle', value: val),
                            ),
                            CustomTextWidget(
                              text: 'Select Engine Type',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              maxLines: 2,
                            ),
                            Obx(
                              () => Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    ['Generator', 'Compressor'].map((option) {
                                  return Row(
                                    children: [
                                      Radio(
                                        visualDensity: VisualDensity.compact,
                                        activeColor: AppColors.blueTextColor,
                                        value: option,
                                        groupValue: controller.engineType.value,
                                        onChanged: (value) {
                                          controller.engineType.value =
                                              value.toString();
                                        },
                                      ),
                                      CustomTextWidget(
                                          text: option, fontSize: 11.0),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        )),
                    CustomButton(
                      usePrimaryColor:
                          controller.isQrCodeGenerated.value == true,
                      buttonText: 'Save & Generate QR code ',
                      fontSize: 12.0,
                      onTap: () {
                        FormState? formState =
                            controller.qrFormKey.currentState as FormState?;
                        if (formState != null && formState.validate()) {
                          controller.generateQrCode();
                          // Get.back();
                          // controller.isQrCodeGenerated.value = false;
                        }
                      },
                    ),
                    const Divider(color: Colors.black54),
                    controller.isQrCodeGenerated.value
                        ? Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54)),
                            child: QrImageView(
                              data: controller.engineName.text.trim(),
                              version: QrVersions.auto,
                              size: 200.0,
                              errorStateBuilder: (cxt, err) {
                                return Center(
                                  child: CustomTextWidget(
                                    text: 'Uh oh! Something went wrong...',
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    fontSize: 12.0,
                                  ),
                                );
                              },
                            ),
                          )
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextWidget(
                                text:
                                    'Generate QR Code by filling the above fields.',
                                maxLines: 2,
                                fontSize: 12.0,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

class CustomEngineCard extends StatelessWidget {
  final EngineModel model;
  final VoidCallback onTap;

  const CustomEngineCard({
    super.key,
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: onTap,
        // leading: ClipRRect(
        //   borderRadius: BorderRadius.circular(8.0),
        //
        //   // child: Image.asset(
        //   //   model.image == '' ? 'assets/images/engine.png' : model.image,
        //   //   width: 100,
        //   //   fit: BoxFit.cover,
        //   // ),
        // ),
        leading: const CircleAvatar(backgroundColor: Colors.red),
        title: CustomTextWidget(
          text: model.name ?? 'No Image Specified',
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: model.subtitle ?? 'No SubTitle Specified',
              textColor: AppColors.textColor,
              fontSize: 14.0,
            ),
            CustomTextWidget(
              text: model.type ?? 'No Type Specified',
              fontSize: 12.0,
              textColor: AppColors.lightGreyColor,
            ),
          ],
        ),
        trailing: QrImageView(
          data: model.name ?? '',
          version: QrVersions.auto,
          size: context.height * 0.1,
          errorStateBuilder: (cxt, err) {
            return Center(
              child: CustomTextWidget(
                text: 'Uh oh! Something went wrong...',
                textAlign: TextAlign.center,
                maxLines: 2,
                fontSize: 12.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
