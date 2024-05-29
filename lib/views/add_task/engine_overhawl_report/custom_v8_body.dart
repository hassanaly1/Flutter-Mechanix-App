import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/report_v8_controller.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/models/compressor_model.dart';
import 'package:mechanix/views/add_task/engine_overhawl_report/reusable_widgets.dart';
import 'package:mechanix/views/add_task/generator_task/custom_stepperbody2.dart';
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
  late OverhaulReportController controller;

  @override
  void initState() {
    controller = Get.find<OverhaulReportController>();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final OverhaulReportController controller = Get.find();
    final UniversalController universalController = Get.find();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
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
          () => CustomButton(
              isLoading: controller.isLoading.value,
              buttonText: widget.isTaskUpdating ? 'Update' : 'Submit',
              onTap: () async {
                widget.isTaskUpdating
                    ? await controller.updateOverhaulReportTask()
                    : await controller
                        .addOverhaulReportTask(widget.sideMenuController);
              }),
        ),
        body: ListView(
          children: [
            ///Submit

            /// General Info
            GeneralInfo(controller: controller),

            /// Engine Block
            EngineBlock(
                controller: controller,
                universalController: universalController),

            /// Engine Assembly Report
            EngineAssemblyReport(controller: controller),

            /// Connecting Rods
            ConnectingRods(
                controller: controller,
                universalController: universalController),

            /// Piston Pins
            PistonPins(
                controller: controller,
                universalController: universalController),

            /// Ring Clearances in Liners
            RingClearancesInLiners(controller: controller),

            /// Ring Clearances in Pistons
            RingClearancesInPistons(controller: controller),

            /// Cylinder Liners
            CylinderLiners(
                controller: controller,
                universalController: universalController),

            /// Cylinder Heads
            CylinderHeads(
                controller: controller,
                universalController: universalController),

            /// Rocker Shaft Assemblies
            RockerShaftAssemblies(
                controller: controller,
                universalController: universalController),

            /// Push Rods
            PushRods(controller: controller),

            /// Camshaft
            Camshaft(controller: controller),

            /// Cam Followers
            CamFollowers(controller: controller),

            /// Bridges
            Bridges(controller: controller),

            /// Valves
            Valves(controller: controller),

            /// Injector Trim Codes
            InjectorTrimCodes(
                universalController: universalController,
                controller: controller),

            ///Gear Train
            GearTrain(controller: controller),

            ///Engine Assembly Report Cont
            buildEngineAssemblyReportSection(controller),

            ///Mechanics Questions
            MechanicsQuestionare(controller: controller),

            // ///Submit
            // Obx(
            //   () => CustomButton(
            //       isLoading: controller.isLoading.value,
            //       buttonText: widget.isTaskUpdating ? 'Update' : 'Submit',
            //       onTap: () async {
            //         await controller
            //             .addOverhaulReportTask(widget.sideMenuController);
            //       }),
            // )
          ],
        ),
      ),
    );
  }
}

class GearTrain extends StatelessWidget {
  const GearTrain({
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
            const ContainerHeading(heading: 'Gear Train'),
            CustomRadioButton(
              options: const ['NEW', 'RE-USED'],
              selectedOption: controller.overHaulReport.gearTrain.gear,
              heading: 'Gear',
            ),
            ReUsableTextField(
              hintText: 'Back Lash',
              controller: controller.overHaulReport.gearTrain.gearBacklash,
            ),
            CustomRadioButton(
              options: const ['NEW', 'RE-USED'],
              selectedOption: controller.overHaulReport.gearTrain.camGear,
              heading: 'Cam Gear (s)',
            ),
            ReUsableTextField(
              hintText: 'Back Lash',
              controller: controller.overHaulReport.gearTrain.camGearBacklash,
            ),
            CustomRadioButton(
              options: const ['NEW', 'RE-USED'],
              selectedOption: controller.overHaulReport.gearTrain.accessoryGear,
              heading: 'Accessory Gear (s)',
            ),
            ReUsableTextField(
              hintText: 'Back Lash',
              controller:
                  controller.overHaulReport.gearTrain.accessoryGearBacklash,
            ),
            CustomRadioButton(
              options: const ['NEW', 'RE-USED'],
              selectedOption: controller.overHaulReport.gearTrain.idlerGear,
              heading: 'Idler Gear (s)',
            ),
            ReUsableTextField(
              hintText: 'Back Lash',
              controller: controller.overHaulReport.gearTrain.idlerGearBacklash,
            ),
            CustomRadioButton(
              options: const ['NEW', 'RE-USED'],
              selectedOption:
                  controller.overHaulReport.gearTrain.indicateBacklash,
              heading: 'Indicate Backlash',
            ),
            ReUsableTextField(
              hintText: 'Back Lash',
              controller:
                  controller.overHaulReport.gearTrain.indicateBacklashBacklash,
            ),
            CustomRadioButton(
              options: const ['NEW', 'RE-USED'],
              selectedOption:
                  controller.overHaulReport.gearTrain.betweenEachMatingGears,
              heading: 'Between each Mating gears',
            ),
            ReUsableTextField(
              hintText: 'Back Lash',
              controller: controller
                  .overHaulReport.gearTrain.betweenEachMatingGearsBacklash,
            ),
            CustomRadioButton(
              options: const ['NEW', 'RE-USED'],
              selectedOption: controller.overHaulReport.gearTrain.spindleTorque,
              heading: 'Spindle Torque',
            ),
            ReUsableTextField(
              hintText: 'Back Lash',
              controller:
                  controller.overHaulReport.gearTrain.spindleTorqueBacklash,
            ),
          ],
        ),
      ),
    );
  }
}
