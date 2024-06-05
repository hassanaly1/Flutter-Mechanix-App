import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/compressor_task_controller.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/models/compressor_model.dart';
import 'package:mechanix/views/add_task/generator_task/custom_stepperbody2.dart';
import 'package:mechanix/views/add_task/widgets/heading_and_textfield.dart';
import 'package:mechanix/views/add_task/widgets/radio_button.dart';

class CustomCompressorBody1 extends StatelessWidget {
  final bool isTaskUpdating;
  final SideMenuController? sideMenuController;
  final CompressorTaskModel? model;

  CustomCompressorBody1({
    super.key,
    required this.isTaskUpdating,
    this.sideMenuController,
    this.model,
  });

  final UniversalController universalController = Get.find();
  final CompressorTaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomButton(
                isLoading: controller.isLoading.value,
                buttonText: isTaskUpdating ? 'Update' : 'Submit',
                onTap: () {
                  isTaskUpdating
                      ? controller.updateCompressorTask(
                          taskId: model?.taskId ?? '')
                      : controller.addCompressorTask(
                          context, sideMenuController);
                }),
          ),
        ),
        body: ListView(
          children: [
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingAndTextfield(
                        title: 'Task Name', controller: controller.taskName),
                    HeadingAndTextfield(
                        title: 'Customer Email',
                        controller: controller.customerEmail),
                    HeadingAndTextfield(
                        title: 'Make', controller: controller.make),
                    HeadingAndTextfield(
                        title: 'Model', controller: controller.model),
                    const ContainerHeading(heading: 'TORQUE ft/lbs'),
                    Row(
                      children: [
                        Flexible(
                            child: HeadingAndTextfield(
                                title: 'Crosshead Shoes',
                                controller: controller.crossheadShoes)),
                        Flexible(
                            child: HeadingAndTextfield(
                                title: 'Main Bearings',
                                controller: controller.mainBearings)),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: HeadingAndTextfield(
                                title: 'Conn Rod Bearings',
                                controller: controller.connRodBearings)),
                        Flexible(
                            child: HeadingAndTextfield(
                                title: 'Crosshead Pin thru Bolt',
                                controller: controller.crossHeadPinthruBolt)),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: HeadingAndTextfield(
                                title: 'Spacer Bar Bolts',
                                controller: controller.spacerBarBolts)),
                        Flexible(
                            child: HeadingAndTextfield(
                                title: 'Crosshead Guide to Crankcase',
                                controller:
                                    controller.crossHeadGuideToCrankcase)),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: HeadingAndTextfield(
                                title: 'Crosshead Guide to Cyl',
                                controller: controller.crossheadGuideToCyl)),
                        Flexible(
                            child: HeadingAndTextfield(
                                title: 'Rod Packing Bolts',
                                controller: controller.rodPackingBolts)),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: HeadingAndTextfield(
                                title: 'Piston Nut',
                                controller: controller.pistonNut)),
                        Flexible(
                            child: HeadingAndTextfield(
                                title: 'Crosshead Nut',
                                controller: controller.crossheadNut)),
                      ],
                    ),
                    const ContainerHeading(
                        heading:
                            'VALVE CAPS, VALVE CAP CENTRE BOLTS, AND CENTRE BOLT LOCKING NUT CYLINDER HEADEND POCKET'),
                    CustomRadioButton(
                        options: const ['NF', 'NC'],
                        selectedOption: controller.valueOf3By8,
                        heading: '3/8"'),
                    CustomRadioButton(
                        options: const ['NF', 'NC'],
                        selectedOption: controller.valueOf7By16,
                        heading: '7/16"'),
                    CustomRadioButton(
                        options: const ['NF', 'NC'],
                        selectedOption: controller.valueOf1By2,
                        heading: '1/2"'),
                    CustomRadioButton(
                        options: const ['NF', 'NC'],
                        selectedOption: controller.valueOf5By8,
                        heading: '5/8"'),
                    CustomRadioButton(
                        options: const ['NF', 'NC'],
                        selectedOption: controller.valueOf3By4,
                        heading: '3/4"'),
                    CustomRadioButton(
                        options: const ['NF', 'NC'],
                        selectedOption: controller.valueOf7By8,
                        heading: '7/8"'),
                    CustomRadioButton(
                        options: const ['NF', 'NC'],
                        selectedOption: controller.valueOf1,
                        heading: '1"'),
                    CustomRadioButton(
                        options: const ['NF', 'NC'],
                        selectedOption: controller.valueOf1_1By8,
                        heading: '1 1/8"'),
                    CustomRadioButton(
                        options: const ['NF', 'NC'],
                        selectedOption: controller.valueOf1_1By4,
                        heading: '1 1/4"'),
                    CustomRadioButton(
                        options: const ['NF', 'NC'],
                        selectedOption: controller.valueOf1_3By8,
                        heading: '1 3/8"'),
                    CustomRadioButton(
                        options: const ['NF', 'NC'],
                        selectedOption: controller.valueOf1_1By2,
                        heading: '1 1/2"'),
                    CustomRadioButton(
                        options: const ['NF', 'NC'],
                        selectedOption: controller.valueOf1_3By4,
                        heading: '1 3/4"'),
                    CustomRadioButton(
                        options: const ['NF', 'NC'],
                        selectedOption: controller.valueOf2,
                        heading: '2"'),
                    const ContainerHeading(heading: 'SPECIFICATIONS'),
                    HeadingAndTextfield(
                        title: 'Conn Rod Bushing',
                        controller: controller.connRodBushing),
                    CustomTextWidget(
                        text: 'Crosshead to Guide:',
                        fontWeight: FontWeight.w500,
                        maxLines: 2),
                    Row(
                      children: [
                        Flexible(
                            child: HeadingAndTextfield(
                                title: 'Babbit',
                                controller: controller.babbit)),
                        Flexible(
                            child: HeadingAndTextfield(
                                title: 'Bronze',
                                controller: controller.bronze)),
                        Flexible(
                            child: HeadingAndTextfield(
                                title: 'Cast Iron',
                                controller: controller.castIron)),
                      ],
                    ),
                    HeadingAndTextfield(
                        title: 'Conn Rod Side Clearance',
                        controller: controller.connRodSideClearance),
                    HeadingAndTextfield(
                        title: 'Main Bearing Clearance',
                        controller: controller.mainBearingClearance),
                    HeadingAndTextfield(
                        title: 'Piston End Clearance',
                        controller: controller.pistonEndClearance),
                    HeadingAndTextfield(
                        title: 'Conn Rod Bearing Clearance',
                        controller: controller.connRodBearingClearance),
                    HeadingAndTextfield(
                        title: 'Rod Packing Side Clearance',
                        controller: controller.rodPackingSideClearance),
                    Row(
                      children: [
                        Flexible(
                            child: HeadingAndTextfield(
                                title: 'Bronze',
                                controller: controller.bronze2)),
                        Flexible(
                            child: HeadingAndTextfield(
                                title: 'Teflon',
                                controller: controller.teflon)),
                      ],
                    ),
                    HeadingAndTextfield(
                        title: 'Crankshaft End Clearance',
                        controller: controller.crankshaftEndClearance),
                    HeadingAndTextfield(
                        title: 'Compressor Oil Pressure',
                        controller: controller.compressorOilPressure),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
