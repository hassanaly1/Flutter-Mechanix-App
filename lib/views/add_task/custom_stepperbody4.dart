import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/task_controllers.dart';
import 'package:mechanix/data/report_service.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/models/payload.dart';
import 'package:mechanix/views/add_task/custom_stepperbody2.dart';
import 'package:mechanix/views/add_task/widgets/heading_and_textfield.dart';
import 'package:mechanix/views/add_task/widgets/radio_button.dart';

class CustomStepperBody4 extends StatelessWidget {
  final bool isTaskUpdating;
  final SideMenuController? sideMenu;
  final Payload? model;
  CustomStepperBody4({
    super.key,
    this.sideMenu,
    required this.isTaskUpdating,
    this.model,
  });
  final AddTaskController controller = Get.find();
  final GlobalKey<FormState> _partsFormkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      child: ListView(
        children: [
          ReUsableContainer(
              color: AppColors.blueTextColor,
              borderRadius: 8.0,
              child: CustomTextWidget(
                text: 'START UP',
                textColor: Colors.white,
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
          //   Oil Pressure and Level Check
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Oil Pressure and Level Check'),
                CustomRadioButton(
                  heading: 'Oil pressure engine & good?',
                  options: const ['YES', 'NO'],
                  selectedOption: controller.oilPressureEngineAndGood,
                ),
                CustomRadioButton(
                  heading: 'Engine oil level:',
                  options: const ['LOW', 'GOOD', 'HIGH'],
                  selectedOption: controller.engineOilLevel,
                ),
              ],
            ),
          ),
          //   Coolant System Check
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Coolant System Check'),
                CustomRadioButton(
                  heading: 'Jacket water coolant level:',
                  options: const ['LOW', 'GOOD', 'HIGH'],
                  selectedOption: controller.jacketWaterCoolantLevel,
                ),
                CustomRadioButton(
                  heading: 'Auxiliary coolant level:',
                  options: const ['LOW', 'GOOD', 'HIGH'],
                  selectedOption: controller.auxiliaryCoolantLevel2,
                ),
              ],
            ),
          ),
          //   Temperature and Pressure Check
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Temperature and Pressure Check'),
                CustomRadioButton(
                  heading: 'All temps and pressures stable & normal ranges?',
                  options: const ['YES', 'NO'],
                  selectedOption:
                      controller.allTempsAndPressuresStableAndNormalRanges,
                ),
              ],
            ),
          ),
          //   Noise and Vibration Check
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Noise and Vibration Check'),
                CustomRadioButton(
                  heading: 'Noises or vibrations detected?',
                  options: const ['YES', 'NO'],
                  selectedOption: controller.noisesOrVibrationsDetected,
                ),
              ],
            ),
          ),
          //   Exhaust Gas and Manifold Pressure
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Exhaust Gas and Manifold Pressure'),
                CustomRadioButton(
                  heading: 'Engine exhaust gas checked & adjusted at max load?',
                  options: const ['YES', 'NO'],
                  selectedOption:
                      controller.engineExhaustGasCheckedAndAdjustedAtMaxLoad,
                ),
                HeadingAndTextfield(
                  title:
                      'Document final set point exhaust gas oxygen or CO levels:',
                  controller: controller
                      .documentFinalSetPointExhaustGasOxygenOrCOLevels,
                ),
                HeadingAndTextfield(
                  title: 'Document final manifold pressure and RPM:',
                  controller: controller.documentFinalManifoldPressureAndRPM,
                )
              ],
            ),
          ),
          ReUsableContainer(
              color: AppColors.blueTextColor,
              borderRadius: 8.0,
              child: CustomTextWidget(
                text: 'FUTURE REPAIRS',
                textColor: Colors.white,
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
          //   Engine Deficiencies for Future Repairs
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Engine Deficiencies for Future Repairs'),
                CustomRadioButton(
                  options: const ['YES', 'NO'],
                  selectedOption: controller.engineDeficienciesRadio,
                  heading: 'Engine deficiencies to be repaired in the future?',
                ),
                Obx(
                  () => Visibility(
                    visible: controller.engineDeficienciesRadio.value == 'YES',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(text: 'If yes then describe'),
                        ReUsableTextField(
                          maxLines: 3,
                          hintText:
                              'Describe Engine deficiencies to be repaired in the future?',
                          showBackgroundShadow:
                              controller.engineDeficienciesRadio.value == 'YES',
                          readOnly:
                              controller.engineDeficienciesRadio.value == 'NO',
                          controller: controller.engineDeficienciesTextfield,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //   Parts Ordering Status
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Parts Ordering Status'),
                CustomRadioButton(
                  heading: 'Parts for above repairs ordered?',
                  options: const ['YES', 'NO'],
                  selectedOption: controller.partsOrderingStatus,
                ),
              ],
            ),
          ),
          //Future Parts
          ReUsableContainer(
              color: AppColors.blueTextColor,
              borderRadius: 8.0,
              child: CustomTextWidget(
                text: 'PARTS ORDER LIST FOR NEXT VISIT',
                textColor: Colors.white,
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
          //   Add Parts in Table

          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Form(
              // key: _partsFormkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Add Parts'),
                  HeadingAndTextfield(
                    title: 'Name:',
                    controller: controller.partName,
                    // validator: (value) => AppValidator.validateEmptyText(
                    //     fieldName: 'Name', value: value),
                  ),
                  HeadingAndTextfield(
                    title: 'Description:',
                    controller: controller.partDescription,
                    // validator: (value) => AppValidator.validateEmptyText(
                    //     fieldName: 'Description', value: value),
                  ),
                  HeadingAndTextfield(
                    title: 'Quantity:',
                    controller: controller.partQuantity,
                    keyboardType: TextInputType.number,
                    // validator: (value) => AppValidator.validateEmptyText(
                    //     fieldName: 'Quantity', value: value),
                  ),
                  HeadingAndTextfield(
                    title: 'Vendor:',
                    controller: controller.partVendor,
                    // validator: (value) => AppValidator.validateEmptyText(
                    //     fieldName: 'Vendor', value: value),
                  ),
                  CustomButton(
                      isLoading: false,
                      buttonText: 'Add',
                      onTap: () {
                        // if (_partsFormkey.currentState!.validate()) {
                        controller.partsList.add(
                          Part(
                            name: controller.partName.text.trim(),
                            description: controller.partDescription.text.trim(),
                            quantity: int.tryParse(
                                controller.partQuantity.text.trim()),
                            vendor: controller.partVendor.text.trim(),
                          ),
                        );
                        controller.partName.clear();
                        controller.partDescription.clear();
                        controller.partQuantity.clear();
                        controller.partVendor.clear();
                      })
                ],
              ),
            ),
          ),
          Obx(
            () => ReUsableContainer(
                borderRadius: 8.0,
                child: controller.partsList.isEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.1),
                        child: CustomTextWidget(
                            text: 'No Parts Added',
                            textAlign: TextAlign.center),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.partsList.length,
                        itemBuilder: (context, index) => SinglePartDetail(
                          model: controller.partsList[index],
                          index: index,
                        ),
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                      )),
          ),
          // CustomTextWidget(
          //   text: model?.task?.taskId ?? 'NO TASK ID FOUND',
          // ),

          Row(
            children: [
              Expanded(
                child: CustomButton(
                    isLoading: false,
                    buttonText: 'BACK',
                    usePrimaryColor: true,
                    onTap: () {
                      controller.previousPage();
                      controller.scrollUp();
                    }),
              ),
              Expanded(
                child: Obx(
                  () => CustomButton(
                      isLoading: controller.isLoading.value,
                      buttonText: isTaskUpdating ? 'Update' : 'SUBMIT',
                      onTap: () async {
                        isTaskUpdating
                            ? await controller
                                .updateTask(model?.task?.taskId ?? '')
                            : await controller.addTask(context, sideMenu!);
                        // showConfirmationPopup(
                        //     context: context, payload: model!);
                      }),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SinglePartDetail extends StatelessWidget {
  final Part model;
  final int index;
  SinglePartDetail({super.key, required this.model, required this.index});

  final AddTaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      showBackgroundShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  textColor: Colors.transparent,
                  text: (index + 1).toString(),
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
                CustomTextWidget(
                  text: (index + 1).toString(),
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
                IconButton(
                    onPressed: () {
                      controller.partsList.removeAt(index);
                    },
                    icon: const Icon(FontAwesomeIcons.xmark, color: Colors.red))
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          CustomTextWidget(
            text: 'Part Name:  ',
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
          CustomTextWidget(text: model.name ?? ''),
          const SizedBox(height: 8.0),
          CustomTextWidget(
            text: 'Part Description:  ',
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
          CustomTextWidget(text: model.description ?? ''),
          const SizedBox(height: 8.0),
          CustomTextWidget(
            text: 'Part Quantity:  ',
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
          CustomTextWidget(text: model.quantity.toString()),
          const SizedBox(height: 8.0),
          CustomTextWidget(
            text: 'Part Vendor:  ',
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
          CustomTextWidget(text: model.vendor ?? ''),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

void showConfirmationPopup(
    {required BuildContext context,
    required String taskName,
    required String customerEmail,
    required String token,
    required String taskId}) {
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
                                'Do you want to send this report to $taskName at $customerEmail?',
                            fontSize: 14.0,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w400),
                        const SizedBox(height: 12.0),
                        CustomButton(
                          isLoading: false,
                          usePrimaryColor: true,
                          buttonText: 'Yes',
                          fontSize: 12.0,
                          onTap: () async {
                            try {
                              bool success = await ReportService()
                                  .generateReportById(taskId, token);
                              // isLoading = true;
                              if (success) {
                                print('Report sent successfully');
                                ToastMessage.showToastMessage(
                                    message: 'Report has been sent',
                                    backgroundColor: Colors.green);
                                Get.back();
                              } else {
                                ToastMessage.showToastMessage(
                                    message:
                                        'Something went wrong, please try again',
                                    backgroundColor: Colors.red);
                                Get.back();
                              }
                            } catch (e) {
                              print('Error generating report: $e');
                              ToastMessage.showToastMessage(
                                  message:
                                      'Something went wrong, please try again',
                                  backgroundColor: Colors.green);
                              Get.back();
                            } finally {}
                          },
                        ),
                        CustomButton(
                          isLoading: false,
                          usePrimaryColor: false,
                          buttonText: 'Not right now',
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
