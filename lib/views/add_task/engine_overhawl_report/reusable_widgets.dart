import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/report_v8_controller.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/views/add_task/generator_task/custom_stepperbody2.dart';
import 'package:mechanix/views/add_task/widgets/heading_and_textfield.dart';
import 'package:mechanix/views/add_task/widgets/radio_button.dart';

class InjectorTrimCodes extends StatelessWidget {
  const InjectorTrimCodes({
    super.key,
    required this.universalController,
    required this.controller,
  });

  final UniversalController universalController;
  final OverhaulReportController controller;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
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
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers: controller
                  .overHaulReport.engineAssemblyReportCont.injectorTrimCodes,
            ),
          ],
        ),
      ),
    );
  }
}

class Valves extends StatelessWidget {
  const Valves({
    super.key,
    required this.controller,
  });

  final OverhaulReportController controller;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
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
            ReUsableTextField(
              hintText: 'Intake',
              controller: controller
                  .overHaulReport.engineAssemblyReportCont.valveIntake,
            ),
            ReUsableTextField(
              hintText: 'Exhaust',
              controller: controller
                  .overHaulReport.engineAssemblyReportCont.valveExhaust,
            ),
            ReUsableTextField(
              hintText: 'Injector',
              controller: controller
                  .overHaulReport.engineAssemblyReportCont.valveInjector,
            ),
          ],
        ),
      ),
    );
  }
}

class Bridges extends StatelessWidget {
  const Bridges({
    super.key,
    required this.controller,
  });

  final OverhaulReportController controller;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      showBackgroundShadow: false,
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRadioButton(
              options: const ['Adjustable', 'Non Adjustable'],
              selectedOption:
                  controller.overHaulReport.engineAssemblyReportCont.bridges,
              heading: 'Bridges',
            ),
            ReUsableTextField(
              hintText: 'Setting',
              controller: controller
                  .overHaulReport.engineAssemblyReportCont.bridgesSettings,
            )
          ],
        ),
      ),
    );
  }
}

class CamFollowers extends StatelessWidget {
  const CamFollowers({
    super.key,
    required this.controller,
  });

  final OverhaulReportController controller;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
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
              selectedOption: controller
                  .overHaulReport.engineAssemblyReportCont.camFollowers,
              heading: 'Cam Followers',
            ),
          ],
        ),
      ),
    );
  }
}

class Camshaft extends StatelessWidget {
  const Camshaft({
    super.key,
    required this.controller,
  });

  final OverhaulReportController controller;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
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
              selectedOption:
                  controller.overHaulReport.engineAssemblyReportCont.camshaft,
              heading: 'Camshaft',
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller.overHaulReport.engineAssemblyReportCont
                  .camshaftBearingReplaced,
              heading: 'Camshaft bearings replaced?',
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller.overHaulReport.engineAssemblyReportCont
                  .camshaftBearingTorqued,
              heading: 'Camshaft bearings torqued?',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              controller: controller.overHaulReport.engineAssemblyReportCont
                  .camshaftBearingTorquedSpec,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller.overHaulReport.engineAssemblyReportCont
                  .camshaftEndPlayChecked,
              heading: 'Camshaft end play checked?',
            ),
            Row(
              children: [
                Flexible(
                    child: ReUsableTextField(
                  hintText: 'Specs',
                  controller: controller.overHaulReport.engineAssemblyReportCont
                      .camshaftEndPlayCheckedSpec,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                )),
                Flexible(
                    child: ReUsableTextField(
                  hintText: 'Actual',
                  controller: controller.overHaulReport.engineAssemblyReportCont
                      .camshaftEndPlayCheckActual,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PushRods extends StatelessWidget {
  const PushRods({
    super.key,
    required this.controller,
  });

  final OverhaulReportController controller;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
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
              selectedOption:
                  controller.overHaulReport.engineAssemblyReportCont.pushRods,
              heading: 'Push Rods',
            ),
          ],
        ),
      ),
    );
  }
}

class RockerShaftAssemblies extends StatelessWidget {
  const RockerShaftAssemblies({
    super.key,
    required this.controller,
    required this.universalController,
  });

  final OverhaulReportController controller;
  final UniversalController universalController;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
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
              selectedOption: controller.overHaulReport.engineAssemblyReportCont
                  .rockerShaftAssemblies,
              heading: 'Rocker Shaft Assemblies',
            ),
            const ContainerHeading(heading: 'Indicate Rocker Shaft Assemblies'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers: controller.overHaulReport.engineAssemblyReportCont
                  .rockerShaftAssembliesIndicateWhichOne,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller.overHaulReport.engineAssemblyReportCont
                  .rockerShaftAssembliesBool,
              heading: 'Rocker Assembly torqued?',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: controller.overHaulReport.engineAssemblyReportCont
                  .rockerShaftAssembliesSpec,
            )
          ],
        ),
      ),
    );
  }
}

class CylinderHeads extends StatelessWidget {
  const CylinderHeads({
    super.key,
    required this.controller,
    required this.universalController,
  });

  final OverhaulReportController controller;
  final UniversalController universalController;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
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
              selectedOption: controller
                  .overHaulReport.engineAssemblyReportCont.cylinderHeads,
              heading: 'Cylinder Heads',
            ),
            const ContainerHeading(heading: 'Indicate Cylinder Heads'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers: controller.overHaulReport.engineAssemblyReportCont
                  .indicateCylinderHeads,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller
                  .overHaulReport.engineAssemblyReportCont.cylinderHeadsBool,
              heading: 'Cylinder Heads',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: controller
                  .overHaulReport.engineAssemblyReportCont.cylinderHeadSpec,
            )
          ],
        ),
      ),
    );
  }
}

class CylinderLiners extends StatelessWidget {
  const CylinderLiners({
    super.key,
    required this.controller,
    required this.universalController,
  });

  final OverhaulReportController controller;
  final UniversalController universalController;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
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
              selectedOption: controller
                  .overHaulReport.engineAssemblyReportCont.cylinderLiners,
              heading: 'Cylinder Liners',
            ),
            const ContainerHeading(heading: 'Indicate New Liners'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers: controller
                  .overHaulReport.engineAssemblyReportCont.indicateNewLiners,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller
                  .overHaulReport.engineAssemblyReportCont.linerORingsReplaced,
              heading: 'Liner O Rings Replaced',
            ),
          ],
        ),
      ),
    );
  }
}

class RingClearancesInPistons extends StatelessWidget {
  const RingClearancesInPistons({
    super.key,
    required this.controller,
  });

  final OverhaulReportController controller;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      showBackgroundShadow: false,
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContainerHeading(heading: 'Ring Clearances in Pistons'),
            for (int i = 0;
                i <
                    controller.overHaulReport.engineAssemblyReportCont
                        .ringClearancesInPistons.length;
                i++)
              Row(
                children: [
                  CustomTextWidget(text: '${i + 1}'),
                  for (int j = 0;
                      j <
                          controller.overHaulReport.engineAssemblyReportCont
                              .ringClearancesInPistons[i].length;
                      j++)
                    Expanded(
                      child: Row(
                        children: [
                          const SizedBox(width: 4.0),
                          Flexible(
                              child: ReUsableTextField(
                            hintText: '${j + 1}',
                            controller: controller
                                .overHaulReport
                                .engineAssemblyReportCont
                                .ringClearancesInPistons[i][j],
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                          )),
                        ],
                      ),
                    ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class RingClearancesInLiners extends StatelessWidget {
  const RingClearancesInLiners({
    super.key,
    required this.controller,
  });

  final OverhaulReportController controller;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      showBackgroundShadow: false,
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContainerHeading(heading: 'Ring Clearances in Liners'),
            for (int i = 0;
                i <
                    controller.overHaulReport.engineAssemblyReportCont
                        .ringClearancesInLiners.length;
                i++)
              Row(
                children: [
                  CustomTextWidget(text: '${i + 1}'),
                  for (int j = 0;
                      j <
                          controller.overHaulReport.engineAssemblyReportCont
                              .ringClearancesInLiners[i].length;
                      j++)
                    Expanded(
                      child: Row(
                        children: [
                          const SizedBox(width: 4.0),
                          Flexible(
                              child: ReUsableTextField(
                            hintText: '${j + 1}',
                            controller: controller
                                .overHaulReport
                                .engineAssemblyReportCont
                                .ringClearancesInLiners[i][j],
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                          )),
                        ],
                      ),
                    ),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class PistonPins extends StatelessWidget {
  const PistonPins({
    super.key,
    required this.controller,
    required this.universalController,
  });

  final OverhaulReportController controller;
  final UniversalController universalController;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
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
              selectedOption:
                  controller.overHaulReport.engineAssemblyReportCont.pistonPins,
              heading: 'Piston Pins',
            ),
            const ContainerHeading(heading: 'Indicate New Pins'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers: controller
                  .overHaulReport.engineAssemblyReportCont.indicateNewPins,
            ),
            CustomRadioButton(
              options: const ['NEW', 'CUSTOMERS RECONDITIONED (CR)'],
              selectedOption:
                  controller.overHaulReport.engineAssemblyReportCont.pistons,
              heading: 'Pistons',
            ),
            const ContainerHeading(heading: 'Indicate New Pistons'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers: controller
                  .overHaulReport.engineAssemblyReportCont.indicateNewPistons,
            ),
          ],
        ),
      ),
    );
  }
}

class ConnectingRods extends StatelessWidget {
  const ConnectingRods({
    super.key,
    required this.controller,
    required this.universalController,
  });

  final OverhaulReportController controller;
  final UniversalController universalController;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
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
              selectedOption: controller
                  .overHaulReport.engineAssemblyReportCont.connectingRods,
              heading: 'Connecting Rods',
            ),
            const ContainerHeading(heading: 'Indicate Which Ones'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers: controller.overHaulReport.engineAssemblyReportCont
                  .connectingRodsIndicateWhichOne,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller.overHaulReport.engineAssemblyReportCont
                  .connectingRodBearingsReplaced,
              heading: 'Connecting rod bearings replaced?',
            ),
            ReUsableTextField(
              hintText: 'If not indicate why?',
              controller: controller.overHaulReport.engineAssemblyReportCont
                  .reasonIfNotConnectingRodBearingsReplaced,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller.overHaulReport.engineAssemblyReportCont
                  .rodBearingCapsTorqued,
              heading: 'Rod bearing caps torqued?',
            ),
            ReUsableTextField(
              hintText: 'Specs ft (lb)',
              controller: controller.overHaulReport.engineAssemblyReportCont
                  .rodBearingCapsTorquedSpec,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller.overHaulReport.engineAssemblyReportCont
                  .connectingRodSideClearanceChecked,
              heading: 'Connecting rod side clearance checked?',
            ),
            ReUsableTextField(
              hintText: 'Specs ft (lb)',
              controller: controller.overHaulReport.engineAssemblyReportCont
                  .connectingRodSideClearanceCheckedSpec,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const ContainerHeading(heading: 'Actual Readings'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers: controller
                  .overHaulReport.engineAssemblyReportCont.actualReading,
            ),
          ],
        ),
      ),
    );
  }
}

class EngineAssemblyReport extends StatelessWidget {
  const EngineAssemblyReport({
    super.key,
    required this.controller,
  });

  final OverhaulReportController controller;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      showBackgroundShadow: false,
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContainerHeading(heading: 'Engine Assembly Report Cont.'),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller
                  .overHaulReport.engineAssemblyReportCont.mainBearingsReplaced,
              heading: 'Main Bearings Replaced',
            ),
            HeadingAndTextfield(
                title: 'If Not Indicate Why?',
                controller: controller.overHaulReport.engineAssemblyReportCont
                    .reasonIfMainBearingsNotReplaced),
            HeadingAndTextfield(
                title: 'Numbers on Upper Shell',
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: controller.overHaulReport.engineAssemblyReportCont
                    .numbersOfUpperShell),
            HeadingAndTextfield(
                title: 'Numbers on Lower Shell',
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: controller.overHaulReport.engineAssemblyReportCont
                    .numbersOfLowerShell),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller
                  .overHaulReport.engineAssemblyReportCont.mainBearingTorqued,
              heading: 'Main Bearings Torqued (ft)',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              controller: controller.overHaulReport.engineAssemblyReportCont
                  .mainBearingTorquedSpec,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller.overHaulReport.engineAssemblyReportCont
                  .thrustBearingsReplaced,
              heading: 'Thrust Bearings Torqued (ft)',
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller
                  .overHaulReport.engineAssemblyReportCont.crossTiesTorqued,
              heading: 'Cross Ties Torqued? (ft)',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              controller: controller
                  .overHaulReport.engineAssemblyReportCont.crossTiesTorquedSpec,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller.overHaulReport.engineAssemblyReportCont
                  .counterWeightsTorqued,
              heading: 'Counter Weights Torqued? (ft)',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              controller: controller.overHaulReport.engineAssemblyReportCont
                  .counterWeightsTorquedSpec,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller.overHaulReport.engineAssemblyReportCont
                  .vibrationDampenerReplacedTorqued,
              heading: 'Vibration Dampener Replaced and Torqued? (ft)',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              controller: controller.overHaulReport.engineAssemblyReportCont
                  .vibrationDampenerReplacedTorquedSpec,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            // ReUsableTextField(
            //   hintText: 'Specs',
            //   controller: controller.engineAssemblyReportCont.vibrationDampenerTorquedSpecs2,
            // ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller.overHaulReport.engineAssemblyReportCont
                  .frontAndRearSealsReplaced,
              heading: 'Front and Rear Seals Replaced?',
            ),
            ReUsableTextField(
              hintText: 'Front',
              controller: controller.overHaulReport.engineAssemblyReportCont
                  .frontAndRearSealsReplacedDescFront,
            ),
            ReUsableTextField(
              hintText: 'Rear',
              controller: controller.overHaulReport.engineAssemblyReportCont
                  .frontAndRearSealsReplacedDescRear,
            ),
          ],
        ),
      ),
    );
  }
}

class EngineBlock extends StatelessWidget {
  const EngineBlock({
    super.key,
    required this.controller,
    required this.universalController,
  });

  final OverhaulReportController controller;
  final UniversalController universalController;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      showBackgroundShadow: false,
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContainerHeading(heading: 'Engine Block'),
            CustomRadioButton(
              options: const ['NEW', 'EXCHANGE', 'CUSTOMERS REFURBISHMENT'],
              selectedOption:
                  controller.overHaulReport.engineAssembly.engineBlocks,
              heading: 'Engine Block',
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption:
                  controller.overHaulReport.engineAssembly.lineBorePerformed,
              heading: 'Line Bore Performed (Crankshaft and Camshaft)',
            ),
            HeadingAndTextfield(
              title: 'Company',
              controller: controller
                  .overHaulReport.engineAssembly.lineBorePerformedCompany,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption:
                  controller.overHaulReport.engineAssembly.magCheckedForCracks,
              heading: 'Mag Checked for Cracks?',
            ),
            HeadingAndTextfield(
              title: 'Company',
              controller:
                  controller.overHaulReport.engineAssembly.magCheckedCompany,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption:
                  controller.overHaulReport.engineAssembly.linerFitsRepaired,
              heading: 'Liner Fits Repaired? (Upper (U) and Lower (L))',
            ),
            HeadingAndTextfield(
              title: 'Company',
              controller: controller
                  .overHaulReport.engineAssembly.linerFitsRepairedCompany,
            ),
            const ContainerHeading(heading: 'Indicate Which Ones'),
            DynamicTextFields(
              hintText: '',
              controllers: controller.overHaulReport.engineAssembly
                  .engineAssemblyReportIndicateWhichOne,
            ),
            const ContainerHeading(heading: 'Engine Crankshaft'),
            CustomRadioButton(
              options: const ['NEW', 'EXCHANGE', 'CUSTOMERS REFURBISHMENT'],
              selectedOption:
                  controller.overHaulReport.engineAssembly.engineCrankshaft,
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
                  controller: controller.overHaulReport.engineAssembly
                      .plastiGuageReadingsOneMainBearingSpec,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                )),
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Annual',
                  controller: controller.overHaulReport.engineAssembly
                      .plastiGuageReadingsOneMainBearingActual,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                )),
              ],
            ),
            const ContainerHeading(heading: 'Indicate Which Ones'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers: controller
                  .overHaulReport.engineAssembly.engineReportIndicateWhichOne,
            ),
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
                  controller:
                      controller.overHaulReport.engineAssembly.endPlaySpec,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                )),
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Actual',
                  controller:
                      controller.overHaulReport.engineAssembly.endPlayActual,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({
    super.key,
    required this.controller,
  });

  final OverhaulReportController controller;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      showBackgroundShadow: false,
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingAndTextfield(
              title: 'Customer Name',
              controller: controller.overHaulReport.customerEngineInfo.customer,
            ),
            HeadingAndTextfield(
              title: 'Location',
              controller: controller.overHaulReport.customerEngineInfo.location,
            ),
            // HeadingAndTextfield(
            //     title: 'Select Location',
            //     controller:
            //         controller.overHaulReport.customerEngineInfo.location,
            //     suffixIcon: InkWell(
            //       onTap: () => Get.to(() => SelectLocationScreen()),
            //       child: Icon(Icons.location_on_outlined,
            //           color: AppColors.blueTextColor),
            //     )),
            Row(
              children: [
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Work Order',
                  controller:
                      controller.overHaulReport.customerEngineInfo.workorder,
                  keyboardType: TextInputType.number,
                )),
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'LSD',
                  controller: controller.overHaulReport.customerEngineInfo.lsd,
                )),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Unit #',
                  controller: controller.overHaulReport.customerEngineInfo.unit,
                )),
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Unit Hours',
                  controller:
                      controller.overHaulReport.customerEngineInfo.unitHours,
                )),
              ],
            ),
            Obx(
              () => HeadingAndTextfield(
                title: 'Select Date',
                hintText:
                    controller.overHaulReport.customerEngineInfo.date.value,
                // hintText:
                //     '${controller.taskSelectedDate.value.day.toString().padLeft(2, '0')}-${controller.taskSelectedDate.value.month.toString().padLeft(2, '0')}-${controller.taskSelectedDate.value.year.toString().padLeft(2, '0')}',
                onTap: () => controller.selectDate(context),
                readOnly: true,
              ),
            ),
            // HeadingAndTextfield(
            //   title: 'Date',
            //   controller: TextEditingController(),
            // ),
            HeadingAndTextfield(
              title: 'Customer Email',
              controller:
                  controller.overHaulReport.customerEngineInfo.customerContact,
            ),
            Row(
              children: [
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Engine Make',
                  controller:
                      controller.overHaulReport.customerEngineInfo.engineMake,
                )),
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Engine Model',
                  controller:
                      controller.overHaulReport.customerEngineInfo.engineModel,
                )),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Engine Serial #',
                  controller:
                      controller.overHaulReport.customerEngineInfo.engineSerial,
                  keyboardType: TextInputType.number,
                )),
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Arrangement #',
                  controller: controller
                      .overHaulReport.customerEngineInfo.engineArrangement,
                )),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Mechanic #1',
                  controller:
                      controller.overHaulReport.customerEngineInfo.mechanic1,
                )),
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Mechanic #2',
                  controller:
                      controller.overHaulReport.customerEngineInfo.mechanic2,
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MechanicsQuestionare extends StatelessWidget {
  const MechanicsQuestionare({
    super.key,
    required this.controller,
  });

  final OverhaulReportController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
            maxLines: 3,
            text: 'Was the main bearing cap torque checked and verified?'),
        Row(
          children: [
            Flexible(
                child: HeadingAndTextfield(
                    title: 'Mechanic #1',
                    controller: controller
                        .overHaulReport
                        .engineAssemblyPartsExchangeCatalog
                        .mechanic1MainBearingCap)),
            Flexible(
                child: HeadingAndTextfield(
                    title: 'Mechanic #2',
                    controller: controller
                        .overHaulReport
                        .engineAssemblyPartsExchangeCatalog
                        .mechanic2MainBearingCap)),
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
                    controller: controller
                        .overHaulReport
                        .engineAssemblyPartsExchangeCatalog
                        .mechanic1ConnectingRodTorqued)),
            Flexible(
                child: HeadingAndTextfield(
                    title: 'Mechanic #2',
                    controller: controller
                        .overHaulReport
                        .engineAssemblyPartsExchangeCatalog
                        .mechanic2ConnectingRodTorqued)),
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
                    controller: controller
                        .overHaulReport
                        .engineAssemblyPartsExchangeCatalog
                        .mechanic1ConnectingRodSide)),
            Flexible(
                child: HeadingAndTextfield(
                    title: 'Mechanic #2',
                    controller: controller
                        .overHaulReport
                        .engineAssemblyPartsExchangeCatalog
                        .mechanic2ConnectingRodSide)),
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
                    controller: controller
                        .overHaulReport
                        .engineAssemblyPartsExchangeCatalog
                        .mechanic1AllInternalPlugs)),
            Flexible(
                child: HeadingAndTextfield(
                    title: 'Mechanic #2',
                    controller: controller
                        .overHaulReport
                        .engineAssemblyPartsExchangeCatalog
                        .mechanic2AllInternalPlugs)),
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
                    controller: controller
                        .overHaulReport
                        .engineAssemblyPartsExchangeCatalog
                        .mechanic1CrankShaftEndPlay)),
            Flexible(
                child: HeadingAndTextfield(
                    title: 'Mechanic #2',
                    controller: controller
                        .overHaulReport
                        .engineAssemblyPartsExchangeCatalog
                        .mechanic2CrankShaftEndPlay)),
          ],
        ),
        HeadingAndTextfield(
            title: 'Comments',
            hintText: 'Write your comments here...',
            maxLines: 5,
            controller: controller
                .overHaulReport.engineAssemblyPartsExchangeCatalog.comments),
      ],
    );
  }
}

class DynamicTextFields extends StatelessWidget {
  final List<TextEditingController> controllers;
  final int? numberOfControllers;
  final String? hintText;

  const DynamicTextFields(
      {super.key,
      this.hintText,
      this.numberOfControllers,
      required this.controllers});

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];

    // Generate rows dynamically
    for (int i = 0; i < controllers.length; i += 2) {
      rows.add(
        Row(
          children: [
            Flexible(
              child: NumberWithTextField(
                number: '${i + 1}',
                hintText: controllers[i].text.toString(),
                controller: controllers[i],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Flexible(
              child: NumberWithTextField(
                number: '${i + 2}',
                hintText: controllers[i + 1].text.toString(),
                controller: controllers[i + 1],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
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

Widget buildEngineAssemblyReportSection(OverhaulReportController controller) {
  final radioOptions = [
    'NEW',
    'EXCHANGE',
    'CUSTOMERS RECONDITIONED',
    'CUSTOMER RE-USED (CRU)'
  ];
  final headings = [
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
    'Fuel Pump',
    //Extra fields
    'Pre lube Pump',
    'Pre lube Motor',
    'Carburetors',
    "Fuel Regulators",
    "Pre Chamber",
    "Regulators",
    "Governor",
    "Governor Linkages",
    "Pre Chamber Cup",
    "Sparkplugs",
    "Sparkplug Carriers",
    "Magneto",
    "Coils",
    "Extension",
    "Ignition Harness"
  ];

  List<Rx<String?>> controllers = [
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.oilPump,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.oilWaterPump,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.auxWaterPump,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.starter,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.waterGate,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.trubo,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.oilFilters,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.airFilters,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.airBelts,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.accessoryDrive,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.interCooler,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.fuelInjectors,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.bridges,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.scavengePump,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.fuelFilters,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.fuelPump,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.preLubePump,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.preLubeMotor,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.carburetors,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.fuelRegulators,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.preChamber,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.regulators,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.governor,
    controller
        .overHaulReport.engineAssemblyPartsExchangeCatalog.governorLinkages,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.preChamberCup,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.sparkPlugs,
    controller
        .overHaulReport.engineAssemblyPartsExchangeCatalog.sparkPlugCarriers,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.magneto,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.coils,
    controller.overHaulReport.engineAssemblyPartsExchangeCatalog.extension,
    controller
        .overHaulReport.engineAssemblyPartsExchangeCatalog.ignitionHarness,
  ];

  return ReUsableContainer(
    showBackgroundShadow: false,
    color: Colors.grey.shade300,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < headings.length; i++)
            CustomRadioButton(
              options: radioOptions,
              selectedOption: controllers[i],
              heading: headings[i],
            )
        ],
      ),
    ),
  );
}
