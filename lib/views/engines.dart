import 'dart:io';

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

class EnginesScreen extends StatefulWidget {
  final SideMenuController sideMenu;
  const EnginesScreen({super.key, required this.sideMenu});

  @override
  State<EnginesScreen> createState() => _EnginesScreenState();
}

class _EnginesScreenState extends State<EnginesScreen> {
  late EnginesController controller;
  @override
  void initState() {
    controller = Get.put(EnginesController());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final EnginesController controller = Get.find();
    final UniversalController universalController = Get.find();
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            widget.sideMenu.changePage(0);
            Get.delete<EnginesController>();
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
                child: RefreshIndicator(
                  onRefresh: () => controller.getAllEngines(),
                  color: AppColors.primaryColor,
                  backgroundColor: AppColors.secondaryColor,
                  triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  child: Column(
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
                        isLoading: false,
                        buttonText: '+ Add Engine',
                        onTap: () => _openAddEngineDialog(
                            context: context, controller: controller),
                      ),
                      Obx(
                        () => controller.isLoading.value
                            ? const SingleChildScrollView(
                                physics: AlwaysScrollableScrollPhysics(),
                                child: Center(
                                    heightFactor: 3,
                                    child: SpinKitCircle(
                                      color: Colors.black87,
                                      size: 40.0,
                                    )),
                              )
                            : universalController.engines.isEmpty
                                ? Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              height: context.height * 0.15),
                                          Image.asset(
                                              'assets/images/view-task.png',
                                              height: context.height * 0.15),
                                          CustomTextWidget(
                                            text: 'No Engines found',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(
                                              height: context.height * 0.25),
                                        ],
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      itemCount:
                                          universalController.engines.length,
                                      itemBuilder: (context, index) {
                                        final engine =
                                            universalController.engines[index];
                                        return Dismissible(
                                          key: Key(engine.id.toString()),
                                          onDismissed: (direction) {
                                            // todo: delete api call
                                            universalController.engines
                                                .removeAt(index);
                                          },
                                          child: CustomEngineCard(
                                            controller: controller,
                                            model: engine,
                                            onTap: () {
                                              Get.to(
                                                  () => EngineDetailScreen(
                                                      model: engine),
                                                  transition: Transition.size);
                                            },
                                          ),
                                        );
                                      },
                                    ),
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
              child: PopScope(
                  canPop: false,
                  onPopInvoked: (didPop) {
                    if (!didPop) {
                      controller.isQrCodeGenerated.value = false;
                      controller.engineImageUrl.value = '';
                      controller.engineName.clear();
                      controller.engineSubtitle.clear();
                      Get.back();
                    }
                  },
                  child: AlertDialog(
                      scrollable: true,
                      backgroundColor: Colors.transparent,
                      content: Container(
                          width: context.width * 0.7,
                          height: context.height * 0.7,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
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
                          child: PageView(
                              controller: controller.pageController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                SingleChildScrollView(
                                    child: DialogFirstView(
                                        controller: controller)),
                                SingleChildScrollView(
                                    child: DialogSecondView(
                                        controller: controller)),
                              ]))))));
    },
  );
}

class DialogFirstView extends StatelessWidget {
  final EnginesController controller;

  const DialogFirstView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      InkWell(
        onTap: () => controller.pickImage(),
        child: Obx(
          () => CircleAvatar(
            radius: 45,
            backgroundColor: Colors.white,
            backgroundImage: controller.engineImageUrl.value == ''
                ? const AssetImage('assets/images/placeholder.png')
                    as ImageProvider
                : FileImage(File(controller.engineImageUrl.value)),
          ),
        ),
      ),
      const SizedBox(height: 12.0),
      Form(
          key: controller.engineFormKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadingAndTextfield(
                title: 'Enter Engine Name & Model',
                fontSize: 12.0,
                controller: controller.engineName,
                validator: (val) => AppValidator.validateEmptyText(
                    fieldName: 'Engine Name & Model', value: val)),
            HeadingAndTextfield(
                title: 'Enter Subtitle',
                fontSize: 12.0,
                controller: controller.engineSubtitle,
                validator: (val) => AppValidator.validateEmptyText(
                    fieldName: 'Engine Subtitle', value: val)),
            CustomTextWidget(
                text: 'Select Engine Type',
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                maxLines: 2),
            Obx(
              () => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ['Generator', 'Compressor'].map((option) {
                  return Row(children: [
                    Radio(
                        visualDensity: VisualDensity.compact,
                        activeColor: AppColors.blueTextColor,
                        value: option,
                        groupValue: controller.engineType.value,
                        onChanged: (value) {
                          controller.engineType.value = value.toString();
                        }),
                    CustomTextWidget(text: option, fontSize: 11.0)
                  ]);
                }).toList(),
              ),
            )
          ])),
      Obx(
        () => CustomButton(
            isLoading: controller.isLoading.value,
            usePrimaryColor: controller.isQrCodeGenerated.value == true,
            buttonText: 'Save & Generate QR code',
            fontSize: 12.0,
            onTap: () {
              FormState? formState =
                  controller.engineFormKey.currentState as FormState?;
              if (formState != null && formState.validate()) {
                controller.addEngine();
              }
            }),
      ),
      const Divider(color: Colors.black54),
      Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextWidget(
                  text: 'Generate QR Code by filling the above fields.',
                  maxLines: 2,
                  fontSize: 12.0,
                  textAlign: TextAlign.center)))
    ]);
  }
}

class DialogSecondView extends StatelessWidget {
  final EnginesController controller;
  const DialogSecondView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextWidget(
              text: controller.engineName.text,
              maxLines: 2,
              fontSize: 14.0,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        controller.isQrCodeGenerated.value
            ? Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black54)),
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
                        'Something went wrong in generating the QrCode, try again!',
                    maxLines: 2,
                    fontSize: 10.0,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
        const Divider(color: Colors.black54),
        CustomButton(
          isLoading: false,
          usePrimaryColor: controller.isQrCodeGenerated.value == true,
          buttonText: 'Close',
          fontSize: 12.0,
          onTap: () {
            controller.isQrCodeGenerated.value = false;
            controller.engineImageUrl.value = '';
            controller.engineName.clear();
            controller.engineSubtitle.clear();
            Get.back();
          },
        ),
      ],
    );
  }
}

class CustomEngineCard extends StatelessWidget {
  final EngineModel model;
  final VoidCallback onTap;
  final EnginesController controller;

  const CustomEngineCard(
      {super.key,
      required this.model,
      required this.onTap,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: onTap,
        leading: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), shape: BoxShape.circle),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(model.imageUrl ?? ''),
          ),
        ),
        title: CustomTextWidget(
            text: model.name ?? 'No Image Specified',
            fontSize: 14.0,
            fontWeight: FontWeight.w500),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomTextWidget(
              text: model.subname ?? 'No SubTitle Specified',
              textColor: AppColors.lightTextColor,
              fontSize: 12.0),
          CustomTextWidget(
              text: model.id ?? 'No Id Specified',
              fontSize: 12.0,
              textColor: AppColors.lightGreyColor)
        ]),
        trailing: Wrap(
          spacing: 12.0,
          children: [
            InkWell(
                onTap: () {
                  _showEditPopup(
                      context: context, controller: controller, model: model);
                },
                child: Icon(Icons.edit, color: AppColors.secondaryColor)),
            InkWell(
                onTap: () {
                  _showDeletePopup(
                      context: context, controller: controller, model: model);
                },
                child: const Icon(Icons.delete, color: Colors.red))
          ],
        ),
        // trailing: QrImageView(
        //     data: model.name ?? '',
        //     version: QrVersions.auto,
        //     // size: context.height * 0.1,
        //     errorStateBuilder: (cxt, err) {
        //       return Center(
        //           child: CustomTextWidget(
        //               text: 'Uh oh! Something went wrong...',
        //               textAlign: TextAlign.center,
        //               maxLines: 2,
        //               fontSize: 12.0));
        //     }),
      ),
    );
  }
}

void _showEditPopup(
    {required BuildContext context,
    required EnginesController controller,
    required EngineModel model}) {
  controller.engineName.text = model.name ?? '';
  controller.engineSubtitle.text = model.subname ?? '';
  controller.engineType.value = model.isGenerator! ? 'Generator' : 'Compressor';
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
              child: PopScope(
                canPop: false,
                onPopInvoked: (didPop) {
                  if (!didPop) {
                    controller.isQrCodeGenerated.value = false;
                    controller.engineImageUrl.value = '';
                    controller.engineName.clear();
                    controller.engineSubtitle.clear();
                    controller.engineType.value = 'Generator';
                    Get.back();
                  }
                },
                child: AlertDialog(
                    scrollable: true,
                    backgroundColor: Colors.transparent,
                    content: Container(
                      width: context.width * 0.7,
                      height: context.height * 0.7,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => controller.pickImage(),
                              child: CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.white,
                                backgroundImage: model.imageUrl == null
                                    ? const AssetImage(
                                            'assets/images/placeholder.png')
                                        as ImageProvider
                                    : NetworkImage(model.imageUrl!),
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            Form(
                              key: controller.engineFormKey,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                        text: 'ID: ${model.id}',
                                        fontSize: 11.0),
                                    HeadingAndTextfield(
                                        title: 'Enter Engine Name & Model',
                                        fontSize: 12.0,
                                        controller: controller.engineName,
                                        validator: (val) =>
                                            AppValidator.validateEmptyText(
                                                fieldName:
                                                    'Engine Name & Model',
                                                value: val)),
                                    HeadingAndTextfield(
                                        title: 'Enter Subtitle',
                                        fontSize: 12.0,
                                        controller: controller.engineSubtitle,
                                        validator: (val) =>
                                            AppValidator.validateEmptyText(
                                                fieldName: 'Engine Subtitle',
                                                value: val)),
                                    CustomTextWidget(
                                        text: 'Select Engine Type',
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        maxLines: 2),
                                    Obx(
                                      () => Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: ['Generator', 'Compressor']
                                            .map((option) {
                                          return Row(children: [
                                            Radio(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                activeColor:
                                                    AppColors.blueTextColor,
                                                value: option,
                                                groupValue:
                                                    controller.engineType.value,
                                                onChanged: (value) {
                                                  controller.engineType.value =
                                                      value.toString();
                                                }),
                                            CustomTextWidget(
                                                text: option, fontSize: 11.0)
                                          ]);
                                        }).toList(),
                                      ),
                                    )
                                  ]),
                            ),
                            Obx(
                              () => CustomButton(
                                  isLoading: controller.isLoading.value,
                                  usePrimaryColor:
                                      controller.isQrCodeGenerated.value ==
                                          true,
                                  buttonText: 'Update',
                                  fontSize: 12.0,
                                  onTap: () {
                                    FormState? formState = controller
                                        .engineFormKey
                                        .currentState as FormState?;
                                    if (formState != null &&
                                        formState.validate()) {
                                      controller.updateEngine(
                                          id: model.id ?? '');
                                    }
                                  }),
                            ),
                          ]),
                    )),
              )));
    },
  );
}

void _showDeletePopup(
    {required BuildContext context,
    required EnginesController controller,
    required EngineModel model}) {
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
                  content: Container(
                    width: context.width * 0.7,
                    // height: context.height * 0.3,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                            text:
                                'Are you sure to delete the Engine? This action cannot be undone.',
                            fontSize: 14.0,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w400),
                        const SizedBox(height: 12.0),
                        InkWell(
                            onTap: () {
                              controller.deleteEngine(engineModel: model);
                            },
                            child: ReUsableContainer(
                              verticalPadding: context.height * 0.01,
                              height: 50,
                              color: Colors.red,
                              child: Center(
                                  child: controller.isLoading.value
                                      ? const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: SpinKitRing(
                                            lineWidth: 2.0,
                                            color: Colors.white,
                                          ),
                                        )
                                      : CustomTextWidget(
                                          text: 'Delete',
                                          fontSize: 12,
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          textAlign: TextAlign.center,
                                        )),
                            )),
                        CustomButton(
                          isLoading: false,
                          usePrimaryColor: false,
                          buttonText: 'Cancel',
                          fontSize: 12.0,
                          onTap: () {
                            Get.back();
                          },
                        )
                      ],
                    ),
                  ))));
    },
  );
}
