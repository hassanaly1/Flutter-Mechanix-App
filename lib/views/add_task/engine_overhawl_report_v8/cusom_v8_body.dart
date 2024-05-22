import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/report_v8_controller.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/models/compressor_model.dart';
import 'package:mechanix/views/add_task/generator_task/custom_stepperbody2.dart';
import 'package:mechanix/views/add_task/widgets/heading_and_textfield.dart';
import 'package:mechanix/views/add_task/widgets/radio_button.dart';

class CustomV8Body1 extends StatefulWidget {
  final bool isTaskUpdating;
  final SideMenuController? sideMenuController;
  final CompressorTaskModel? model;

  const CustomV8Body1({
    super.key,
    required this.isTaskUpdating,
    this.sideMenuController,
    this.model,
  });

  @override
  State<CustomV8Body1> createState() => _CustomV8Body1State();
}

class _CustomV8Body1State extends State<CustomV8Body1> {
  final UniversalController universalController = Get.find();
  late ReportV8Controller controller;

  @override
  void initState() {
    controller = Get.put(ReportV8Controller());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ReportV8Controller controller = Get.find();
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
          /// General Info
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingAndTextfield(
                      title: 'Customer Name',
                      controller: controller.customerName),
                  HeadingAndTextfield(
                      title: 'Location', controller: controller.location),
                  Row(
                    children: [
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'Work Order',
                              controller: controller.workOrder)),
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'LSD', controller: controller.lsd)),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'Unit #',
                              controller: controller.unitNumber)),
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'Unit Hours',
                              controller: controller.unitHours)),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'Date', controller: controller.date)),
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'Customer Contact',
                              controller: controller.customerContact)),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'Engine Make',
                              controller: controller.engineMake)),
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'Engine Model',
                              controller: controller.engineModel)),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'Engine Serial #',
                              controller: controller.engineSerialNumber)),
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'Engine Arrangement',
                              controller: controller.engineArrangementNumber)),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'Mechanic #1',
                              controller: controller.mechanicName1)),
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'Mechanic #2',
                              controller: controller.mechanicName2)),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// Engine Block
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Engine Block'),
                  CustomRadioButton(
                    options: const [
                      'NEW',
                      'EXCHANGE',
                      'CUSTOMERS REFURBISHMENT'
                    ],
                    selectedOption: controller.engineBlock,
                    heading: 'Engine Block',
                  ),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: controller.lineBorePerfumed,
                    heading: 'Line Bore Performed (Crankshaft and Camshaft)',
                  ),
                  HeadingAndTextfield(
                      title: 'Company',
                      controller: controller.lineBorePerfumedCompany),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: controller.magChecked,
                    heading: 'Mag Checked for Cracks?',
                  ),
                  HeadingAndTextfield(
                      title: 'Company',
                      controller: controller.magCheckedCompany),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: controller.linerFitsRepaired,
                    heading: 'Liner Fits Repaired? (Upper (U) and Lower (L))',
                  ),
                  HeadingAndTextfield(
                      title: 'Company',
                      controller: controller.linerFitsRepairedCompany),
                  const ContainerHeading(heading: 'Indicate Which Ones'),

                  ///todo: Assigning Controllers Remaining
                  const DynamicTextFields(),
                ],
              ),
            ),
          ),

          /// Engine Crankshaft
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Engine Crankshaft'),
                  CustomRadioButton(
                    options: const [
                      'NEW',
                      'EXCHANGE',
                      'CUSTOMERS REFURBISHMENT'
                    ],
                    selectedOption: controller.engineCrankshaft,
                    heading: 'Engine Crankshaft',
                  ),
                  CustomTextWidget(
                    text: 'Plasti-Gauge readings on main bearings:',
                    fontWeight: FontWeight.w500,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'Specs',
                              controller: controller.plastiGaugeSpecs)),
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'Annual',
                              controller: controller.plastiGaugeAnnual)),
                    ],
                  ),
                  const ContainerHeading(heading: 'Indicate Which Ones'),

                  ///todo: Assigning Controllers Remaining
                  const DynamicTextFields(),
                  CustomTextWidget(
                    text: 'End Play:',
                    fontWeight: FontWeight.w500,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'Specs',
                              controller: controller.endPlaySpecs)),
                      Flexible(
                          child: HeadingAndTextfield(
                              title: 'Annual',
                              controller: controller.endPlayAnnual)),
                    ],
                  ),
                  const ContainerHeading(heading: 'Engine Crankshaft Cont.'),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: controller.mainBearingsReplaced,
                    heading: 'Main Bearings Replaced',
                  ),
                  HeadingAndTextfield(
                      title: 'If Not Indicate Why?',
                      controller: controller.mainBearingsIfNotIndicateWhy),
                  HeadingAndTextfield(
                      title: 'Numbers on Upper Shell',
                      controller: controller.numbersOnUpperShell),
                  HeadingAndTextfield(
                      title: 'Numbers on Lower Shell',
                      controller: controller.numbersOnLowerShell),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: controller.mainBearingsTorqued,
                    heading: 'Main Bearings Torqued',
                  ),
                  ReUsableTextField(
                    hintText: 'Specs',
                    controller: controller.mainBearingsTorquedSpecs,
                  ),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: controller.thrustBearingsTorqued,
                    heading: 'Thrust Bearings Torqued',
                  ),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: controller.crossTiesTorqued,
                    heading: 'Cross Ties Torqued?',
                  ),
                  ReUsableTextField(
                    hintText: 'Specs',
                    controller: controller.crossTiesTorquedSpecs,
                  ),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: controller.counterWeightsTorqued,
                    heading: 'Counter Weights Torqued?',
                  ),
                  ReUsableTextField(
                    hintText: 'Specs',
                    controller: controller.counterWeightsTorquedSpecs,
                  ),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: controller.vibrationDampenerTorqued,
                    heading: 'Vibration Dampener Replaced and Torqued?',
                  ),
                  ReUsableTextField(
                    hintText: 'Specs',
                    controller: controller.vibrationDampenerTorquedSpecs1,
                  ),
                  ReUsableTextField(
                    hintText: 'Specs',
                    controller: controller.vibrationDampenerTorquedSpecs2,
                  ),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: controller.frontAndRearSealsReplaced,
                    heading: 'Front and Rear Seals Replaced?',
                  ),
                  ReUsableTextField(
                    hintText: 'Front',
                    controller: controller.frontSeals,
                  ),
                  ReUsableTextField(
                    hintText: 'Rear',
                    controller: controller.rearSeals,
                  ),
                ],
              ),
            ),
          ),

          /// Connecting Rods
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRadioButton(
                    options: const [
                      'NEW',
                      'EXCHANGE',
                      'CUSTOMERS RECONDITIONED',
                      'CUSTOMER RE-USED (CRU)'
                    ],
                    selectedOption: 'C'.obs,
                    heading: 'Connecting Rods',
                  ),
                  const ContainerHeading(heading: 'Indicate Which Ones'),

                  ///todo: Assigning Controllers Remaining
                  const DynamicTextFields(),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: 'C'.obs,
                    heading: 'Connecting rod bearings replaced?',
                  ),
                  ReUsableTextField(hintText: 'If not indicate why?'),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: 'C'.obs,
                    heading: 'Rod bearing caps torqued?',
                  ),
                  ReUsableTextField(hintText: 'Specs'),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: 'C'.obs,
                    heading: 'Connecting rod side clearance checked?',
                  ),
                  ReUsableTextField(hintText: 'Specs'),
                  const ContainerHeading(heading: 'Actual Readings'),

                  ///todo: Assigning Controllers Remaining
                  const DynamicTextFields(),
                ],
              ),
            ),
          ),

          /// Piston Pins
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRadioButton(
                    options: const [
                      'NEW',
                      'EXCHANGE',
                      'CUSTOMERS RECONDITIONED',
                      'CUSTOMER RE-USED (CRU)'
                    ],
                    selectedOption: 'C'.obs,
                    heading: 'Piston Pins',
                  ),
                  const ContainerHeading(heading: 'Indicate New Pins'),

                  ///todo: Assigning Controllers Remaining
                  const DynamicTextFields(),
                  CustomRadioButton(
                    options: const ['NEW', 'CUSTOMERS RECONDITIONED (CR)'],
                    selectedOption: 'C'.obs,
                    heading: 'Pistons',
                  ),
                  const ContainerHeading(heading: 'Indicate New Pistons'),

                  ///todo: Assigning Controllers Remaining
                  const DynamicTextFields(),
                ],
              ),
            ),
          ),

          /// Ring Clearances in Liners
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Ring Clearances in Liners'),
                  Row(
                    children: [
                      CustomTextWidget(text: '1'),
                      const SizedBox(width: 6.0),
                      Flexible(child: ReUsableTextField(hintText: '# 1')),
                      Flexible(child: ReUsableTextField(hintText: '# 2')),
                      Flexible(child: ReUsableTextField(hintText: '# 3')),
                      Flexible(child: ReUsableTextField(hintText: '# 4')),
                    ],
                  ),
                  Row(
                    children: [
                      CustomTextWidget(text: '2'),
                      const SizedBox(width: 4.0),
                      Flexible(child: ReUsableTextField(hintText: '# 1')),
                      Flexible(child: ReUsableTextField(hintText: '# 2')),
                      Flexible(child: ReUsableTextField(hintText: '# 3')),
                      Flexible(child: ReUsableTextField(hintText: '# 4')),
                    ],
                  ),
                  Row(
                    children: [
                      CustomTextWidget(text: '3'),
                      const SizedBox(width: 4.0),
                      Flexible(child: ReUsableTextField(hintText: '# 1')),
                      Flexible(child: ReUsableTextField(hintText: '# 2')),
                      Flexible(child: ReUsableTextField(hintText: '# 3')),
                      Flexible(child: ReUsableTextField(hintText: '# 4')),
                    ],
                  )
                ],
              ),
            ),
          ),

          /// Ring Clearances in Pistons
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Ring Clearances in Pistons'),
                  Row(
                    children: [
                      CustomTextWidget(text: '1'),
                      const SizedBox(width: 6.0),
                      Flexible(child: ReUsableTextField(hintText: '# 1')),
                      Flexible(child: ReUsableTextField(hintText: '# 2')),
                      Flexible(child: ReUsableTextField(hintText: '# 3')),
                      Flexible(child: ReUsableTextField(hintText: '# 4')),
                    ],
                  ),
                  Row(
                    children: [
                      CustomTextWidget(text: '2'),
                      const SizedBox(width: 4.0),
                      Flexible(child: ReUsableTextField(hintText: '# 1')),
                      Flexible(child: ReUsableTextField(hintText: '# 2')),
                      Flexible(child: ReUsableTextField(hintText: '# 3')),
                      Flexible(child: ReUsableTextField(hintText: '# 4')),
                    ],
                  ),
                  Row(
                    children: [
                      CustomTextWidget(text: '3'),
                      const SizedBox(width: 4.0),
                      Flexible(child: ReUsableTextField(hintText: '# 1')),
                      Flexible(child: ReUsableTextField(hintText: '# 2')),
                      Flexible(child: ReUsableTextField(hintText: '# 3')),
                      Flexible(child: ReUsableTextField(hintText: '# 4')),
                    ],
                  )
                ],
              ),
            ),
          ),

          /// Cylinder Liners
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRadioButton(
                    options: const [
                      'NEW',
                      'EXCHANGE',
                      'CUSTOMERS RECONDITIONED',
                      'CUSTOMER RE-USED (CRU)'
                    ],
                    selectedOption: 'C'.obs,
                    heading: 'Cylinder Liners',
                  ),
                  const ContainerHeading(heading: 'Indicate New Liners'),

                  ///todo: Assigning Controllers Remaining
                  const DynamicTextFields(),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: 'C'.obs,
                    heading: 'Liner O Rings Replaced',
                  ),
                ],
              ),
            ),
          ),

          /// Cylinder Heads
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRadioButton(
                    options: const [
                      'NEW',
                      'EXCHANGE',
                      'CUSTOMERS RECONDITIONED',
                      'CUSTOMER RE-USED (CRU)'
                    ],
                    selectedOption: 'C'.obs,
                    heading: 'Cylinder Heads',
                  ),
                  const ContainerHeading(heading: 'Indicate Cylinder Heads'),

                  ///todo: Assigning Controllers Remaining
                  const DynamicTextFields(),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: 'C'.obs,
                    heading: 'Cylinder Heads',
                  ),
                  ReUsableTextField(hintText: 'Specs')
                ],
              ),
            ),
          ),

          /// Rocker Shaft Assemblies
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRadioButton(
                    options: const [
                      'NEW',
                      'EXCHANGE',
                      'CUSTOMERS RECONDITIONED',
                      'CUSTOMER RE-USED (CRU)'
                    ],
                    selectedOption: 'C'.obs,
                    heading: 'Rocker Shaft Assemblies',
                  ),
                  const ContainerHeading(
                      heading: 'Indicate Rocker Shaft Assemblies'),

                  ///todo: Assigning Controllers Remaining
                  const DynamicTextFields(),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: 'C'.obs,
                    heading: 'Rocker Assembly torqued?',
                  ),
                  ReUsableTextField(hintText: 'Specs')
                ],
              ),
            ),
          ),

          /// Push Rods
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRadioButton(
                    options: const [
                      'NEW',
                      'EXCHANGE',
                      'CUSTOMERS RECONDITIONED',
                      'CUSTOMER RE-USED (CRU)'
                    ],
                    selectedOption: 'C'.obs,
                    heading: 'Push Rods',
                  ),
                ],
              ),
            ),
          ),

          /// Camshaft
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRadioButton(
                    options: const [
                      'NEW',
                      'EXCHANGE',
                      'CUSTOMERS RECONDITIONED',
                      'CUSTOMER RE-USED (CRU)'
                    ],
                    selectedOption: 'C'.obs,
                    heading: 'Camshaft',
                  ),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: 'C'.obs,
                    heading: 'Camshaft bearings replaced?',
                  ),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: 'C'.obs,
                    heading: 'Camshaft bearings torqued?',
                  ),
                  ReUsableTextField(hintText: 'Specs'),
                  CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: 'C'.obs,
                    heading: 'Camshaft end play checked?',
                  ),
                  Row(
                    children: [
                      Flexible(child: ReUsableTextField(hintText: 'Specs')),
                      Flexible(child: ReUsableTextField(hintText: 'Actual')),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// Cam Followers
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRadioButton(
                    options: const [
                      'NEW',
                      'EXCHANGE',
                      'CUSTOMERS RECONDITIONED',
                      'CUSTOMER RE-USED (CRU)'
                    ],
                    selectedOption: 'C'.obs,
                    heading: 'Cam Followers',
                  ),
                ],
              ),
            ),
          ),

          /// Bridges
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRadioButton(
                    options: const ['Adjustable', 'Non Adjustable'],
                    selectedOption: 'C'.obs,
                    heading: 'Bridges',
                  ),
                  ReUsableTextField(hintText: 'Setting')
                ],
              ),
            ),
          ),

          /// Valves
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Valves',
                    fontWeight: FontWeight.w500,
                    maxLines: 2,
                  ),
                  ReUsableTextField(hintText: 'Intake'),
                  ReUsableTextField(hintText: 'Exhaust'),
                  ReUsableTextField(hintText: 'Injector'),
                ],
              ),
            ),
          ),

          /// Injector Trim Codes
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Injector Trim Codes',
                    fontWeight: FontWeight.w500,
                    maxLines: 2,
                  ),

                  ///todo: Assigning Controllers Remaining
                  const DynamicTextFields()
                ],
              ),
            ),
          ),

          ///Engine Assembly Report Cont
          buildEngineAssemblyReportSection(),
          CustomTextWidget(
              maxLines: 3,
              text: 'Was the main bearing cap torque checked and verified?'),
          Row(
            children: [
              Flexible(
                  child: HeadingAndTextfield(
                      title: 'Mechanic #1',
                      controller: controller.mechanic1MainBearingCap)),
              Flexible(
                  child: HeadingAndTextfield(
                      title: 'Mechanic #2',
                      controller: controller.mechanic2MainBearingCap)),
            ],
          ),
          CustomTextWidget(
              maxLines: 3,
              text: 'Was the connecting rod torque checked and verified?'),
          Row(
            children: [
              Flexible(
                  child: HeadingAndTextfield(
                      title: 'Mechanic #1',
                      controller: controller.mechanic1ConnectingRodTorqued)),
              Flexible(
                  child: HeadingAndTextfield(
                      title: 'Mechanic #2',
                      controller: controller.mechanic2ConnectingRodTorqued)),
            ],
          ),
          CustomTextWidget(
              maxLines: 3,
              text:
                  'Was the connecting rod side clearance checked and verified?'),
          Row(
            children: [
              Flexible(
                  child: HeadingAndTextfield(
                      title: 'Mechanic #1',
                      controller: controller.mechanic1ConnectingRodSide)),
              Flexible(
                  child: HeadingAndTextfield(
                      title: 'Mechanic #2',
                      controller: controller.mechanic2ConnectingRodSide)),
            ],
          ),
          CustomTextWidget(
              maxLines: 3,
              text: 'Were all internal plugs installed and verified?'),
          Row(
            children: [
              Flexible(
                  child: HeadingAndTextfield(
                      title: 'Mechanic #1',
                      controller: controller.mechanic1AllInternalPlugs)),
              Flexible(
                  child: HeadingAndTextfield(
                      title: 'Mechanic #2',
                      controller: controller.mechanic2AllInternalPlugs)),
            ],
          ),
          CustomTextWidget(
              maxLines: 3,
              text:
                  'Was the crank shaft endplay checked after the installation of the flywheel and the front hub?'),
          Row(
            children: [
              Flexible(
                  child: HeadingAndTextfield(
                      title: 'Mechanic #1',
                      controller: controller.mechanic1CrankShaftEndPlay)),
              Flexible(
                  child: HeadingAndTextfield(
                      title: 'Mechanic #2',
                      controller: controller.mechanic2CrankShaftEndPlay)),
            ],
          ),

          ///Submit
          Obx(
            () => CustomButton(
                isLoading: controller.isLoading.value,
                buttonText: widget.isTaskUpdating ? 'Update' : 'Submit',
                onTap: () {
                  // widget.isTaskUpdating
                  //     ? controller.updateCompressorTask(
                  //         taskId: widget.model?.taskId ?? '')
                  //     : controller.addCompressorTask(widget.sideMenuController);
                }),
          )
        ],
      ),
    );
  }
}

class DynamicTextFields extends StatelessWidget {
  const DynamicTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];

    // Generate rows dynamically
    for (int i = 0; i < 8; i += 2) {
      rows.add(
        Row(
          children: [
            Flexible(
              child: NumberWithTextField(number: '${i + 1}'),
            ),
            Flexible(
              child: NumberWithTextField(number: '${i + 2}'),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows,
    );
  }
}

Widget buildEngineAssemblyReportSection() {
  const radioOptions = [
    'NEW',
    'EXCHANGE',
    'CUSTOMERS RECONDITIONED',
    'CUSTOMER RE-USED (CRU)'
  ];
  const headings = [
    'Oil Pump',
    'Main Water Pump',
    'AUX Water Pump',
    'Starter',
    'Water Gate',
    'Trubo',
    'Oil Filters',
    'Air Filters',
    'Air Belts',
    'Accessory Drive',
    'Inter Cooler',
    'Fuel Injectors',
    'Bridges',
    'Scavenge Pump',
    'Fuel Filters',
    'Fuel Pump'
  ];

  return ReUsableContainer(
    showBackgroundShadow: false,
    color: Colors.grey.shade300,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: headings
            .map((heading) => CustomRadioButton(
                  options: radioOptions,
                  selectedOption: 'C'.obs,
                  heading: heading,
                ))
            .toList(),
      ),
    ),
  );
}
