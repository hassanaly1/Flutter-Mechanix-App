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
  final ReportV8Controller controller;

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
              controllers:
                  controller.engineAssemblyReportCont.injectorTrimCodes,
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

  final ReportV8Controller controller;

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
              controller: controller.engineAssemblyReportCont.valveIntake,
            ),
            ReUsableTextField(
              hintText: 'Exhaust',
              controller: controller.engineAssemblyReportCont.valveExhaust,
            ),
            ReUsableTextField(
              hintText: 'Injector',
              controller: controller.engineAssemblyReportCont.valveInjector,
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

  final ReportV8Controller controller;

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
              selectedOption: controller.engineAssemblyReportCont.bridges,
              heading: 'Bridges',
            ),
            ReUsableTextField(
              hintText: 'Setting',
              controller: controller.engineAssemblyReportCont.bridgesSettings,
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

  final ReportV8Controller controller;

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
              selectedOption: controller.engineAssemblyReportCont.camFollowers,
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

  final ReportV8Controller controller;

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
              selectedOption: controller.engineAssemblyReportCont.camshaft,
              heading: 'Camshaft',
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption:
                  controller.engineAssemblyReportCont.camshaftBearingReplaced,
              heading: 'Camshaft bearings replaced?',
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption:
                  controller.engineAssemblyReportCont.camshaftBearingTorqued,
              heading: 'Camshaft bearings torqued?',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              controller: controller
                  .engineAssemblyReportCont.camshaftBearingTorquedSpec,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption:
                  controller.engineAssemblyReportCont.camshaftEndPlayChecked,
              heading: 'Camshaft end play checked?',
            ),
            Row(
              children: [
                Flexible(
                    child: ReUsableTextField(
                  hintText: 'Specs',
                  controller: controller
                      .engineAssemblyReportCont.camshaftEndPlayCheckedSpec,
                )),
                Flexible(
                    child: ReUsableTextField(
                  hintText: 'Actual',
                  controller: controller
                      .engineAssemblyReportCont.camshaftEndPlayCheckActual,
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

  final ReportV8Controller controller;

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
              selectedOption: controller.engineAssemblyReportCont.pushRods,
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

  final ReportV8Controller controller;
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
                  controller.engineAssemblyReportCont.rockerShaftAssemblies,
              heading: 'Rocker Shaft Assemblies',
            ),
            const ContainerHeading(heading: 'Indicate Rocker Shaft Assemblies'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers: controller.engineAssemblyReportCont
                  .rockerShaftAssembliesIndicateWhichOne,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption:
                  controller.engineAssemblyReportCont.rockerShaftAssembliesBool,
              heading: 'Rocker Assembly torqued?',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              controller:
                  controller.engineAssemblyReportCont.rockerShaftAssembliesSpec,
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

  final ReportV8Controller controller;
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
              selectedOption: controller.engineAssemblyReportCont.cylinderHeads,
              heading: 'Cylinder Heads',
            ),
            const ContainerHeading(heading: 'Indicate Cylinder Heads'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers:
                  controller.engineAssemblyReportCont.indicateCylinderHeads,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption:
                  controller.engineAssemblyReportCont.cylinderHeadsBool,
              heading: 'Cylinder Heads',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              controller: controller.engineAssemblyReportCont.cylinderHeadSpec,
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

  final ReportV8Controller controller;
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
                  controller.engineAssemblyReportCont.cylinderLiners,
              heading: 'Cylinder Liners',
            ),
            const ContainerHeading(heading: 'Indicate New Liners'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers:
                  controller.engineAssemblyReportCont.indicateNewLiners,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption:
                  controller.engineAssemblyReportCont.linerORingsReplaced,
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

  final ReportV8Controller controller;

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
                    controller.engineAssemblyReportCont.ringClearancesInPistons
                        .length;
                i++)
              Row(
                children: [
                  CustomTextWidget(text: '${i + 1}'),
                  for (int j = 0;
                      j <
                          controller.engineAssemblyReportCont
                              .ringClearancesInPistons[i].length;
                      j++)
                    Expanded(
                      child: Row(
                        children: [
                          const SizedBox(width: 4.0),
                          Flexible(
                              child: ReUsableTextField(
                            hintText: '# ${j + 1}',
                            controller: controller.engineAssemblyReportCont
                                .ringClearancesInPistons[i][j],
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

  final ReportV8Controller controller;

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
                    controller
                        .engineAssemblyReportCont.ringClearancesInLiners.length;
                i++)
              Row(
                children: [
                  CustomTextWidget(text: '${i + 1}'),
                  for (int j = 0;
                      j <
                          controller.engineAssemblyReportCont
                              .ringClearancesInLiners[i].length;
                      j++)
                    Expanded(
                      child: Row(
                        children: [
                          const SizedBox(width: 4.0),
                          Flexible(
                              child: ReUsableTextField(
                            hintText: '# ${j + 1}',
                            controller: controller.engineAssemblyReportCont
                                .ringClearancesInLiners[i][j],
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

  final ReportV8Controller controller;
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
              selectedOption: controller.engineAssemblyReportCont.pistonPins,
              heading: 'Piston Pins',
            ),
            const ContainerHeading(heading: 'Indicate New Pins'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers: controller.engineAssemblyReportCont.indicateNewPins,
            ),
            CustomRadioButton(
              options: const ['NEW', 'CUSTOMERS RECONDITIONED (CR)'],
              selectedOption: controller.engineAssemblyReportCont.pistons,
              heading: 'Pistons',
            ),
            const ContainerHeading(heading: 'Indicate New Pistons'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers:
                  controller.engineAssemblyReportCont.indicateNewPistons,
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

  final ReportV8Controller controller;
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
                  controller.engineAssemblyReportCont.connectingRods,
              heading: 'Connecting Rods',
            ),
            const ContainerHeading(heading: 'Indicate Which Ones'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers: controller
                  .engineAssemblyReportCont.connectingRodsIndicateWhichOne,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller
                  .engineAssemblyReportCont.connectingRodBearingsReplaced,
              heading: 'Connecting rod bearings replaced?',
            ),
            ReUsableTextField(
              hintText: 'If not indicate why?',
              controller: controller.engineAssemblyReportCont
                  .reasonIfNotConnectingRodBearingsReplaced,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption:
                  controller.engineAssemblyReportCont.rodBearingCapsTorqued,
              heading: 'Rod bearing caps torqued?',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              controller:
                  controller.engineAssemblyReportCont.rodBearingCapsTorquedSpec,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller
                  .engineAssemblyReportCont.connectingRodSideClearanceChecked,
              heading: 'Connecting rod side clearance checked?',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              controller: controller.engineAssemblyReportCont
                  .connectingRodSideClearanceCheckedSpec,
            ),
            const ContainerHeading(heading: 'Actual Readings'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers: controller.engineAssemblyReportCont.actualReading,
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

  final ReportV8Controller controller;

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
              selectedOption:
                  controller.engineAssemblyReportCont.mainBearingsReplaced,
              heading: 'Main Bearings Replaced',
            ),
            HeadingAndTextfield(
                title: 'If Not Indicate Why?',
                controller: controller
                    .engineAssemblyReportCont.reasonIfMainBearingsNotReplaced),
            HeadingAndTextfield(
                title: 'Numbers on Upper Shell',
                controller:
                    controller.engineAssemblyReportCont.numbersOfUpperShell),
            HeadingAndTextfield(
                title: 'Numbers on Lower Shell',
                controller:
                    controller.engineAssemblyReportCont.numbersOfLowerShell),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption:
                  controller.engineAssemblyReportCont.mainBearingTorqued,
              heading: 'Main Bearings Torqued',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              controller:
                  controller.engineAssemblyReportCont.mainBearingTorquedSpec,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption:
                  controller.engineAssemblyReportCont.thrustBearingsReplaced,
              heading: 'Thrust Bearings Torqued',
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption:
                  controller.engineAssemblyReportCont.crossTiesTorqued,
              heading: 'Cross Ties Torqued?',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              controller:
                  controller.engineAssemblyReportCont.crossTiesTorquedSpec,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption:
                  controller.engineAssemblyReportCont.counterWeightsTorqued,
              heading: 'Counter Weights Torqued?',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              controller:
                  controller.engineAssemblyReportCont.counterWeightsTorquedSpec,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller
                  .engineAssemblyReportCont.vibrationDampenerReplacedTorqued,
              heading: 'Vibration Dampener Replaced and Torqued?',
            ),
            ReUsableTextField(
              hintText: 'Specs',
              controller: controller.engineAssemblyReportCont
                  .vibrationDampenerReplacedTorquedSpec,
            ),
            // ReUsableTextField(
            //   hintText: 'Specs',
            //   controller: controller.engineAssemblyReportCont.vibrationDampenerTorquedSpecs2,
            // ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption:
                  controller.engineAssemblyReportCont.frontAndRearSealsReplaced,
              heading: 'Front and Rear Seals Replaced?',
            ),
            ReUsableTextField(
              hintText: 'Front',
              controller: controller
                  .engineAssemblyReportCont.frontAndRearSealsReplacedDescFront,
            ),
            ReUsableTextField(
              hintText: 'Rear',
              controller: controller
                  .engineAssemblyReportCont.frontAndRearSealsReplacedDescRear,
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

  final ReportV8Controller controller;
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
              selectedOption: controller.engineAssembly.engineBlocks,
              heading: 'Engine Block',
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller.engineAssembly.lineBorePerformed,
              heading: 'Line Bore Performed (Crankshaft and Camshaft)',
            ),
            HeadingAndTextfield(
              title: 'Company',
              controller: controller.engineAssembly.lineBorePerformedCompany,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller.engineAssembly.magCheckedForCracks,
              heading: 'Mag Checked for Cracks?',
            ),
            HeadingAndTextfield(
              title: 'Company',
              controller: controller.engineAssembly.magCheckedCompany,
            ),
            CustomRadioButton(
              options: const ['YES', 'NO'],
              selectedOption: controller.engineAssembly.linerFitsRepaired,
              heading: 'Liner Fits Repaired? (Upper (U) and Lower (L))',
            ),
            HeadingAndTextfield(
              title: 'Company',
              controller: controller.engineAssembly.linerFitsRepairedCompany,
            ),
            const ContainerHeading(heading: 'Indicate Which Ones'),
            DynamicTextFields(
              hintText: '',
              controllers: controller
                  .engineAssembly.engineAssemblyReportIndicateWhichOne,
            ),
            const ContainerHeading(heading: 'Engine Crankshaft'),
            CustomRadioButton(
              options: const ['NEW', 'EXCHANGE', 'CUSTOMERS REFURBISHMENT'],
              selectedOption: controller.engineAssembly.engineCrankshaft,
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
                  controller: controller
                      .engineAssembly.plastiGuageReadingsOneMainBearingSpec,
                )),
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Annual',
                  controller: controller
                      .engineAssembly.plastiGuageReadingsOneMainBearingActual,
                )),
              ],
            ),
            const ContainerHeading(heading: 'Indicate Which Ones'),
            DynamicTextFields(
              hintText: '',
              numberOfControllers:
                  universalController.numberOfControllers.value,
              controllers:
                  controller.engineAssembly.engineReportIndicateWhichOne,
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
                  controller: controller.engineAssembly.endPlaySpec,
                )),
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Actual',
                  controller: controller.engineAssembly.endPlayActual,
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

  final ReportV8Controller controller;

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
              controller: controller.customerEngineInfo.customer,
            ),
            HeadingAndTextfield(
              title: 'Location',
              controller: controller.customerEngineInfo.location,
            ),
            Row(
              children: [
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Work Order',
                  controller: controller.customerEngineInfo.workorder,
                )),
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'LSD',
                  controller: controller.customerEngineInfo.lsd,
                )),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Unit #',
                  controller: controller.customerEngineInfo.unit,
                )),
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Unit Hours',
                  controller: controller.customerEngineInfo.unitHours,
                )),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Date',
                  controller: TextEditingController(),
                )),
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Customer Contact',
                  controller: controller.customerEngineInfo.customerContact,
                )),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Engine Make',
                  controller: controller.customerEngineInfo.engineMake,
                )),
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Engine Model',
                  controller: controller.customerEngineInfo.engineModel,
                )),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Engine Serial #',
                  controller: controller.customerEngineInfo.engineSerial,
                )),
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Engine Arrangement',
                  controller: controller.customerEngineInfo.engineArrangement,
                )),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Mechanic #1',
                  controller: controller.customerEngineInfo.mechanic1,
                )),
                Flexible(
                    child: HeadingAndTextfield(
                  title: 'Mechanic #2',
                  controller: controller.customerEngineInfo.mechanic2,
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

  final ReportV8Controller controller;

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
                    controller: controller.engineAssemblyPartsExchangeCatalog
                        .mechanic1MainBearingCap)),
            Flexible(
                child: HeadingAndTextfield(
                    title: 'Mechanic #2',
                    controller: controller.engineAssemblyPartsExchangeCatalog
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
                    controller: controller.engineAssemblyPartsExchangeCatalog
                        .mechanic1ConnectingRodTorqued)),
            Flexible(
                child: HeadingAndTextfield(
                    title: 'Mechanic #2',
                    controller: controller.engineAssemblyPartsExchangeCatalog
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
                    controller: controller.engineAssemblyPartsExchangeCatalog
                        .mechanic1ConnectingRodSide)),
            Flexible(
                child: HeadingAndTextfield(
                    title: 'Mechanic #2',
                    controller: controller.engineAssemblyPartsExchangeCatalog
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
                    controller: controller.engineAssemblyPartsExchangeCatalog
                        .mechanic1AllInternalPlugs)),
            Flexible(
                child: HeadingAndTextfield(
                    title: 'Mechanic #2',
                    controller: controller.engineAssemblyPartsExchangeCatalog
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
                    controller: controller.engineAssemblyPartsExchangeCatalog
                        .mechanic1CrankShaftEndPlay)),
            Flexible(
                child: HeadingAndTextfield(
                    title: 'Mechanic #2',
                    controller: controller.engineAssemblyPartsExchangeCatalog
                        .mechanic2CrankShaftEndPlay)),
          ],
        ),
        HeadingAndTextfield(
            title: 'Comments',
            hintText: 'Write your comments here...',
            maxLines: 5,
            controller: controller.engineAssemblyPartsExchangeCatalog.comments),
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
              ),
            ),
            Flexible(
              child: NumberWithTextField(
                number: '${i + 2}',
                hintText: controllers[i + 1].text.toString(),
                controller: controllers[i + 1],
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

Widget buildEngineAssemblyReportSection(ReportV8Controller controller) {
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
    controller.engineAssemblyPartsExchangeCatalog.oilPump,
    controller.engineAssemblyPartsExchangeCatalog.oilWaterPump,
    controller.engineAssemblyPartsExchangeCatalog.auxWaterPump,
    controller.engineAssemblyPartsExchangeCatalog.starter,
    controller.engineAssemblyPartsExchangeCatalog.waterGate,
    controller.engineAssemblyPartsExchangeCatalog.trubo,
    controller.engineAssemblyPartsExchangeCatalog.oilFilters,
    controller.engineAssemblyPartsExchangeCatalog.airFilters,
    controller.engineAssemblyPartsExchangeCatalog.airBelts,
    controller.engineAssemblyPartsExchangeCatalog.accessoryDrive,
    controller.engineAssemblyPartsExchangeCatalog.interCooler,
    controller.engineAssemblyPartsExchangeCatalog.fuelInjectors,
    controller.engineAssemblyPartsExchangeCatalog.bridges,
    controller.engineAssemblyPartsExchangeCatalog.scavengePump,
    controller.engineAssemblyPartsExchangeCatalog.fuelFilters,
    controller.engineAssemblyPartsExchangeCatalog.fuelPump,
    controller.engineAssemblyPartsExchangeCatalog.preLubePump,
    controller.engineAssemblyPartsExchangeCatalog.preLubeMotor,
    controller.engineAssemblyPartsExchangeCatalog.carburetors,
    controller.engineAssemblyPartsExchangeCatalog.fuelRegulators,
    controller.engineAssemblyPartsExchangeCatalog.preChamber,
    controller.engineAssemblyPartsExchangeCatalog.regulators,
    controller.engineAssemblyPartsExchangeCatalog.governor,
    controller.engineAssemblyPartsExchangeCatalog.governorLinkages,
    controller.engineAssemblyPartsExchangeCatalog.preChamberCup,
    controller.engineAssemblyPartsExchangeCatalog.sparkPlugs,
    controller.engineAssemblyPartsExchangeCatalog.sparkPlugCarriers,
    controller.engineAssemblyPartsExchangeCatalog.magneto,
    controller.engineAssemblyPartsExchangeCatalog.coils,
    controller.engineAssemblyPartsExchangeCatalog.extension,
    controller.engineAssemblyPartsExchangeCatalog.ignitionHarness,
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
