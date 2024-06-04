import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/generator_task_controllers.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/views/add_task/generator_task/custom_stepperbody2.dart';
import 'package:mechanix/views/add_task/widgets/heading_and_textfield.dart';
import 'package:mechanix/views/add_task/widgets/radio_button.dart';

class CustomStepperBody3 extends StatelessWidget {
  final bool isTaskUpdating;

  CustomStepperBody3({
    super.key,
    required this.isTaskUpdating,
  });

  final GeneratorTaskController controller = Get.find();

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
        bottomNavigationBar: Row(
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
              child: CustomButton(
                  isLoading: false,
                  buttonText: 'Next',
                  onTap: () {
                    controller.nextPage();
                    controller.scrollUp();
                  }),
            ),
          ],
        ),
        body: ListView(
          children: [
            ReUsableContainer(
                color: AppColors.blueTextColor,
                borderRadius: 8.0,
                child: CustomTextWidget(
                  text: 'ENGINE TUNE UP AND SET POINT SPECIFICATIONS',
                  textColor: Colors.white,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                )),
            //Hot Compression Test
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Hot Compression Test'),
                  Row(
                    children: [
                      Flexible(
                        child: NumberWithTextField(
                          number: '1',
                          controller:
                              controller.hotCompressionTemperatureCtrl[0],
                        ),
                      ),
                      Flexible(
                        child: NumberWithTextField(
                          number: '2',
                          controller:
                              controller.hotCompressionTemperatureCtrl[1],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: NumberWithTextField(
                          number: '3',
                          controller:
                              controller.hotCompressionTemperatureCtrl[2],
                        ),
                      ),
                      Flexible(
                        child: NumberWithTextField(
                          number: '4',
                          controller:
                              controller.hotCompressionTemperatureCtrl[3],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: NumberWithTextField(
                          number: '5',
                          controller:
                              controller.hotCompressionTemperatureCtrl[4],
                        ),
                      ),
                      Flexible(
                        child: NumberWithTextField(
                          number: '6',
                          controller:
                              controller.hotCompressionTemperatureCtrl[5],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: NumberWithTextField(
                          number: '7',
                          controller:
                              controller.hotCompressionTemperatureCtrl[6],
                        ),
                      ),
                      Flexible(
                        child: NumberWithTextField(
                          number: '8',
                          controller:
                              controller.hotCompressionTemperatureCtrl[7],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: NumberWithTextField(
                          number: '9',
                          controller:
                              controller.hotCompressionTemperatureCtrl[8],
                        ),
                      ),
                      Flexible(
                        child: NumberWithTextField(
                          number: '10',
                          controller:
                              controller.hotCompressionTemperatureCtrl[9],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: NumberWithTextField(
                          number: '11',
                          controller:
                              controller.hotCompressionTemperatureCtrl[10],
                        ),
                      ),
                      Flexible(
                        child: NumberWithTextField(
                          number: '12',
                          controller:
                              controller.hotCompressionTemperatureCtrl[11],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: NumberWithTextField(
                          number: '13',
                          controller:
                              controller.hotCompressionTemperatureCtrl[12],
                        ),
                      ),
                      Flexible(
                        child: NumberWithTextField(
                          number: '14',
                          controller:
                              controller.hotCompressionTemperatureCtrl[13],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: NumberWithTextField(
                          number: '15',
                          controller:
                              controller.hotCompressionTemperatureCtrl[14],
                        ),
                      ),
                      Flexible(
                        child: NumberWithTextField(
                          number: '16',
                          controller:
                              controller.hotCompressionTemperatureCtrl[15],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //Value Set
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Value Set'),
                  TextfieldWithRadioButtons(
                    heading: 'Intake',
                    keyboardType: TextInputType.number,
                    val1: 'SOLID',
                    val2: 'HYDRAULIC',
                    textController: controller.intakeValueSet,
                    radioController: controller.intakeValueSetRadioValue,
                  ),
                  TextfieldWithRadioButtons(
                    heading: 'Exhaust',
                    keyboardType: TextInputType.number,
                    val1: 'SOLID',
                    val2: 'HYDRAULIC',
                    textController: controller.exhaustValueSet,
                    radioController: controller.exhaustValueSetRadioValue,
                  ),
                  CustomRadioButton(
                    heading: 'Major Value Recession Detected?',
                    options: const ['YES', 'NO'],
                    selectedOption: controller.majorValueRecessionDetected,
                  ),
                  CustomRadioButton(
                    heading: 'Boroscope Recommended?',
                    options: const ['YES', 'NO'],
                    selectedOption: controller.boroscopeRecommended,
                  ),
                  CustomRadioButton(
                    heading: 'Boroscope Inspection Completed?',
                    options: const ['YES', 'NO'],
                    selectedOption: controller.boroscopeInspectionCompleted,
                  ),
                ],
              ),
            ),
            //Sparkplugs
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Sparkplugs'),
                  CustomRadioButton(
                    heading: 'Install New Sparkplugs?',
                    options: const ['YES', 'NO', 'CLEAN', 'REGAP'],
                    selectedOption: controller.installNewSparkplugs,
                  ),
                  HeadingAndTextfield(
                    title: 'Sparkplug Gap',
                    controller: controller.sparkplugGap,
                    keyboardType: TextInputType.number,
                  ),
                  CustomRadioButton(
                    heading: 'Sparkplug Extension(s) Installed?',
                    options: const [
                      'YES',
                      'NO',
                      'REPLACED BOOTS',
                      'REPLACED O RINGS',
                      'NA'
                    ],
                    selectedOption: controller.sparkplugExtensionInstalled,
                  ),
                  CustomRadioButton(
                    heading: 'Any New Extensions Installed?',
                    options: const [
                      'YES',
                      'NO',
                      'NA',
                    ],
                    selectedOption: controller.newExtensionInstalled,
                  ),
                  ReUsableTextField(
                    hintText: 'List of Replaced Extensions',
                    controller: controller.listOfNewExtensionInstalled,
                  ),
                  CustomRadioButton(
                    heading: 'Sparkplug Wire Condition?',
                    options: const [
                      'POOR',
                      'FAIR',
                      'GOOD',
                    ],
                    selectedOption: controller.sparkplugWireCondition,
                  ),
                  ReUsableTextField(
                    hintText: 'List of Replaced Extensions',
                    controller: controller.listOfSparkplugWireCondition,
                  )
                ],
              ),
            ),
            //Connections
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Connections'),
                  CustomRadioButton(
                    heading: 'Cannon Plug Connectors Tight?',
                    options: const ['YES', 'NO'],
                    selectedOption: controller.cannonPlugConnectorsTight,
                  ),
                  HeadingAndTextfield(
                    title: 'List of Transformer Coils Replaced',
                    controller: controller.listOfTransformerCoilsReplaced,
                  ),
                ],
              ),
            ),
            //Crankcase
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Crankcase'),
                  CustomRadioButton(
                    heading: 'Crankcase Breather Inspection',
                    options: const ['YES', 'NO', 'NA'],
                    selectedOption: controller.crankcaseBreatherInspection,
                  ),
                  CustomRadioButton(
                    heading: 'New Breather Element Installed?',
                    options: const ['YES', 'NO', 'NA'],
                    selectedOption: controller.newBreatherElementInstalled,
                  ),
                ],
              ),
            ),
            // Belts and Coolers
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Belts and Coolers'),
                  CustomRadioButton(
                    heading:
                        'Check All Cooler Fan Jackshaft Drive Belts and Tensioner Condition',
                    options: const ['YES', 'NO', 'NA'],
                    selectedOption: controller.checkAllCanonFan,
                  ),
                  ReUsableTextField(
                    hintText: 'List of Replaced items',
                    controller: controller.listOfCheckAllCoolerFan,
                  )
                ],
              ),
            ),
            //Coolant System Check
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Coolant System Check'),
                  CustomRadioButton(
                    heading:
                        'Check all water pump weep holes for any signs of coolant leakage?',
                    options: const ['YES', 'NO', 'NA'],
                    selectedOption: controller.coolantSystemCheck,
                  ),
                ],
              ),
            ),
            //Lubrication System Check
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Lubrication System Check'),
                  CustomRadioButton(
                    heading:
                        'Grease all points and check all auto greasers for function?',
                    options: const ['YES', 'NO', 'REPLACED'],
                    selectedOption: controller.lubricationSystemCheck,
                  ),
                ],
              ),
            ),
            //Cooling System Check
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Cooling System Check'),
                  CustomRadioButton(
                    heading:
                        'Grease all points and check all auto greasers for function?',
                    options: const ['YES', 'NO', 'REPLACED'],
                    selectedOption: controller.coolingSystemCheck,
                  ),
                ],
              ),
            ),
            //Fuel System Inspection
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Fuel System Inspection'),
                  CustomRadioButton(
                    heading: 'Check fuel gas filter(s)?',
                    options: const [
                      'YES',
                      'NO',
                      'REPLACED',
                      'RETURN TO SERVICE',
                      'REPLACED NEW'
                    ],
                    selectedOption: controller.checkFuelGasFilter,
                  ),
                  CustomRadioButton(
                    heading: 'Fuel gas filters found?',
                    options: const [
                      'DRY',
                      'WET',
                      'DIRTY',
                      'WAXY',
                    ],
                    selectedOption: controller.fuelGasFilterFound,
                  ),
                ],
              ),
            ),
            //Air Filter Inspection
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Air Filter Inspection'),
                  CustomRadioButton(
                    heading: 'Air filter(s) inspection?',
                    options: const [
                      'YES',
                      'NO',
                      'REPLACED',
                      'RETURN TO SERVICE',
                      'REPLACED NEW'
                    ],
                    selectedOption: controller.airFilterInspection,
                  ),
                ],
              ),
            ),
            //Turbocharger Inspection
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Turbocharger Inspection'),
                  CustomRadioButton(
                    heading:
                        'Check turbo air side for excessive endplay, axial play, and carbon scraping?',
                    options: const ['YES', 'NO', 'NA'],
                    selectedOption: controller.turboChargerInspection,
                  ),
                ],
              ),
            ),
            //Carburetor and Fuel Injection Inspection
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(
                      heading: 'Carburetor and Fuel Injection Inspection'),
                  CustomRadioButton(
                    heading: 'Carburetor internal cleaning & inspection?',
                    options: const [
                      'YES',
                      'NO',
                      'RETURN TO SERVICE',
                      'REPLACED INTERNALS NEW'
                    ],
                    selectedOption:
                        controller.carburetorInternalCleaningInspection,
                  ),
                ],
              ),
            ),
            //Engine Oil Maintenance
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Engine Oil Maintenance'),
                  CustomRadioButton(
                    heading: 'Engine oil filter change?',
                    options: const [
                      'YES',
                      'NO',
                      'STAINLESS',
                      'SOCK',
                      'CANISTER'
                    ],
                    selectedOption: controller.engineOilFilterChange,
                  ),
                  CustomRadioButton(
                    heading: 'Engine oil filter change?',
                    options: const ['CLEAN', 'METAL FLAKE', 'COOLANT', 'NA'],
                    selectedOption: controller.engineOilFilterChange2,
                  ),
                  CustomRadioButton(
                    heading: 'Oil cooler drained?',
                    options: const ['YES', 'NO', 'NA'],
                    selectedOption: controller.oilCoolerDrained,
                  ),
                ],
              ),
            ),
            //Hydraulic System Check
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Hydraulic System Check'),
                  CustomRadioButton(
                    heading: 'Hydraulic oil filter change?',
                    options: const ['YES', 'NO'],
                    selectedOption: controller.hydraulicOilFilterChange,
                  ),
                  CustomRadioButton(
                    heading: 'Hydraulic oil new?',
                    options: const ['YES', 'NO'],
                    selectedOption: controller.hydraulicOilNew,
                  ),
                ],
              ),
            ),
            //Miscellaneous Checks
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Miscellaneous Checks'),
                  CustomRadioButton(
                      heading: 'Engine oil system primed & oil level correct?',
                      options: const ['YES', 'NO'],
                      selectedOption: controller.engineOilSystemPrimed),
                  CustomRadioButton(
                      heading: 'Oil drain isolation valves shut in?',
                      options: const ['YES', 'NO'],
                      selectedOption: controller.oilDrainIsolationValvesShutIn),
                  CustomRadioButton(
                      heading: 'Day tank filters installed new?',
                      options: const ['YES', 'NO', 'NA'],
                      selectedOption: controller.dayTankFiltersInstalledNew),
                  CustomRadioButton(
                      heading: 'Day tank values open?',
                      options: const ['YES', 'NO'],
                      selectedOption: controller.dayTankValvesOpen),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
