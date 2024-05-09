import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/task_controllers.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/views/add_task/widgets/checkbox.dart';
import 'package:mechanix/views/add_task/widgets/heading_and_textfield.dart';
import 'package:mechanix/views/add_task/widgets/radio_button.dart';

class CustomStepperBody2 extends StatelessWidget {
  CustomStepperBody2({
    super.key,
  });

  final AddTaskController controller = Get.find();

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
                text: 'ENGINE RUNNING CHECKS',
                textAlign: TextAlign.center,
                textColor: Colors.white,
              )),
          //Engine Load Factor
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Engine Load Factor'),
                Row(
                  children: [
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'Engine Load',
                      controller: controller.engineLoad,
                      keyboardType: TextInputType.number,
                    )),
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'Engine RPM',
                      controller: controller.engineRPM,
                      keyboardType: TextInputType.number,
                    ))
                  ],
                ),
                HeadingAndTextfield(
                  title: 'Ignition Timing, BTDC',
                  controller: controller.ignitionTiming,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          //Exhaust Gas Sample
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Exhaust Gas Sample'),
                CustomCheckboxWidget(
                  question: 'Exhaust Gas Sample (As Found)',
                  options: const ['OXYGEN', 'CO', 'NOX'],
                  selectedValues: controller.exhaustGasSampleFound,
                ),
                Row(
                  children: [
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'LB (Left Bank)',
                      controller: controller.leftBankFound,
                      keyboardType: TextInputType.number,
                    )),
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'RB(Right Bank)',
                      controller: controller.rightBankFound,
                      keyboardType: TextInputType.number,
                    ))
                  ],
                ),
                CustomCheckboxWidget(
                  question: 'Exhaust Gas Sample (As ADJUSTED )',
                  options: const ['OXYGEN', 'CO', 'NOX'],
                  selectedValues: controller.exhaustGasSampleAdjusted,
                ),
                Row(
                  children: [
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'LB (Left Bank)',
                      controller: controller.leftBankAdjusted,
                      keyboardType: TextInputType.number,
                    )),
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'RB(Right Bank)',
                      controller: controller.rightBankAdjusted,
                      keyboardType: TextInputType.number,
                    ))
                  ],
                ),
              ],
            ),
          ),
          //Fuel Quality
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Fuel Quality in Use'),
                HeadingAndTextfield(
                  title: 'BTU Value',
                  controller: controller.btuValue,
                  keyboardType: TextInputType.number,
                ),
                CustomRadioButton(
                    options: const ['C', 'F'],
                    selectedOption: controller.selectedBtuValue,
                    heading: 'BTU Value')
              ],
            ),
          ),
          //Cylinder Exhaust Pyrometer
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Cylinder Exhaust Pyrometer Temperature Readings'),
                Row(
                  children: [
                    Flexible(
                      child: NumberWithTextField(
                        number: '1',
                        controller:
                            controller.cylinderExhaustPyrometerTemperature1,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '2',
                        controller:
                            controller.cylinderExhaustPyrometerTemperature2,
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
                            controller.cylinderExhaustPyrometerTemperature3,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '4',
                        controller:
                            controller.cylinderExhaustPyrometerTemperature4,
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
                            controller.cylinderExhaustPyrometerTemperature5,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '6',
                        controller:
                            controller.cylinderExhaustPyrometerTemperature6,
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
                            controller.cylinderExhaustPyrometerTemperature7,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '8',
                        controller:
                            controller.cylinderExhaustPyrometerTemperature8,
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
                            controller.cylinderExhaustPyrometerTemperature9,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '10',
                        controller:
                            controller.cylinderExhaustPyrometerTemperature10,
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
                            controller.cylinderExhaustPyrometerTemperature11,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '12',
                        controller:
                            controller.cylinderExhaustPyrometerTemperature12,
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
                            controller.cylinderExhaustPyrometerTemperature13,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '14',
                        controller:
                            controller.cylinderExhaustPyrometerTemperature14,
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
                            controller.cylinderExhaustPyrometerTemperature15,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '16',
                        controller:
                            controller.cylinderExhaustPyrometerTemperature16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Turbo Temperatures
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Turbo Temperatures'),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          CustomRadioButton(
                              options: const ['C', 'F'],
                              selectedOption: controller.lbTurboIn,
                              heading: 'LB TURBO IN'),
                          ReUsableTextField(
                            hintText: 'Temperature',
                            controller: controller.lbTurboInTemp,
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          CustomRadioButton(
                              options: const ['C', 'F'],
                              selectedOption: controller.rbTurboIn,
                              heading: 'RB TURBO IN'),
                          ReUsableTextField(
                            hintText: 'Temperature',
                            controller: controller.rbTurboInTemp,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.black54),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          CustomRadioButton(
                              options: const ['C', 'F'],
                              selectedOption: controller.lbTurboOut,
                              heading: 'LB TURBO OUT'),
                          ReUsableTextField(
                            hintText: 'Temperature',
                            controller: controller.lbTurboOutTemp,
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          CustomRadioButton(
                              options: const ['C', 'F'],
                              selectedOption: controller.rbTurboOut,
                              heading: 'RB TURBO OUT'),
                          ReUsableTextField(
                            hintText: 'Temperature',
                            controller: controller.rbTurboOutTemp,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //MissFireDetected
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Misfires Detected'),
                CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: controller.missFireDetected,
                    heading: 'Misfires Detected?')
              ],
            ),
          ),
          //BurnTimes
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Burn Temperature Test'),
                Row(
                  children: [
                    Flexible(
                      child: NumberWithTextField(
                        number: '1',
                        controller: controller.burnTemperature1,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '2',
                        controller: controller.burnTemperature2,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: NumberWithTextField(
                        number: '3',
                        controller: controller.burnTemperature3,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '4',
                        controller: controller.burnTemperature4,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: NumberWithTextField(
                        number: '5',
                        controller: controller.burnTemperature5,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '6',
                        controller: controller.burnTemperature6,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: NumberWithTextField(
                        number: '7',
                        controller: controller.burnTemperature7,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '8',
                        controller: controller.burnTemperature8,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: NumberWithTextField(
                        number: '9',
                        controller: controller.burnTemperature9,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '10',
                        controller: controller.burnTemperature10,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: NumberWithTextField(
                        number: '11',
                        controller: controller.burnTemperature11,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '12',
                        controller: controller.burnTemperature12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: NumberWithTextField(
                        number: '13',
                        controller: controller.burnTemperature13,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '14',
                        controller: controller.burnTemperature14,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: NumberWithTextField(
                        number: '15',
                        controller: controller.burnTemperature15,
                      ),
                    ),
                    Flexible(
                      child: NumberWithTextField(
                        number: '16',
                        controller: controller.burnTemperature16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Throttle  & Fuel Value Position

          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(
                    heading: 'Throttle & Fuel Valve Position'),
                HeadingAndTextfield(
                  title: 'Throttle Actuator Position',
                  controller: controller.throttleActuatorPosition,
                  keyboardType: TextInputType.number,
                ),
                HeadingAndTextfield(
                  title: 'Fuel Value',
                  controller: controller.fuelValue,
                  keyboardType: TextInputType.number,
                )
              ],
            ),
          ),
          //Engine Oil
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Engine Oil'),
                HeadingAndTextfield(
                  title: 'Engine Oil Pressure (PSI)',
                  controller: controller.engineOilPressure,
                  keyboardType: TextInputType.number,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'Oil Pressure Differential Across Oil Filter',
                      fontWeight: FontWeight.w600,
                    ),
                    Obx(
                      () => Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: ReUsableTextField(
                                hintText: 'Value',
                                keyboardType: TextInputType.number,
                                controller:
                                    controller.oilPressureDifferentialTextField,
                                onChanged: (value) {
                                  controller.oilPressureDifferential.value =
                                      value;
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: AppColors.blueTextColor,
                                  value: 'NA',
                                  groupValue:
                                      controller.oilPressureDifferential.value,
                                  onChanged: (value) {
                                    if (value == 'NA') {
                                      controller.oilPressureDifferential.value =
                                          value!;
                                      controller
                                          .oilPressureDifferentialTextField
                                          .text = '';
                                    }
                                  },
                                ),
                                CustomTextWidget(text: 'NA', fontSize: 14.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                InOutWidget(
                  heading: 'Oil temperature',
                  inController: controller.oilTemperatureIn,
                  outController: controller.oilTemperatureOut,
                ),
                CustomRadioButton(
                    options: const [
                      'LOW',
                      'GOOD',
                      'HIGH',
                    ],
                    selectedOption: controller.oilLevelEngine,
                    heading: 'Oil Level Engine')
              ],
            ),
          ),
          //Engine Coolent
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Engine Coolant'),
                TextfieldWithRadioButtons(
                  heading: 'Engine Coolant Pressure',
                  keyboardType: TextInputType.number,
                  val1: 'PSI',
                  val2: 'KPA',
                  textController: controller.engineCoolantPressure,
                  radioController: controller.engineCoolantPressureRadioValue,
                ),
                CustomRadioButton(
                    options: const [
                      'LOW',
                      'GOOD',
                      'HIGH',
                    ],
                    selectedOption: controller.jacketWaterLevel,
                    heading: 'Jacket Water Level')
              ],
            ),
          ),
          //Auxiliary Coolant
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Auxiliary Coolant'),
                CustomRadioButton(
                    options: const [
                      'LOW',
                      'GOOD',
                      'HIGH',
                    ],
                    selectedOption: controller.auxiliaryCoolantlevel1,
                    heading: 'Auxiliary Coolant level')
              ],
            ),
          ),
          //JacketWaterTemperatures
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Jacket Water Temperatures'),
                InOutWidget(
                  heading: 'Jacketwater Temperatures In & Out (C/F)',
                  inController: controller.jacketWaterTemperaturesIn,
                  outController: controller.jacketWaterTemperaturesOut,
                ),
                InOutWidget(
                  heading: 'Aux. Coolant Temperatures In & Out (C/F)',
                  inController: controller.auxCoolantTemperaturesIn,
                  outController: controller.auxCoolantTemperaturesOut,
                ),
              ],
            ),
          ),
          //Air Intakes
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Air Intake'),
                TextfieldWithRadioButtons(
                  heading: 'Inlet Air Temp',
                  keyboardType: TextInputType.number,
                  val1: 'C',
                  val2: 'F',
                  textController: controller.inletAirTemp,
                  radioController: controller.inletAirTempRadio,
                ),
                TextfieldWithRadioButtons(
                  heading: 'Inlet Air Pressure',
                  keyboardType: TextInputType.number,
                  val1: 'PSI',
                  val2: 'KPA',
                  textController: controller.inletAirPressure,
                  radioController: controller.inletAirPressureRadio,
                ),
                HeadingAndTextfield(
                  title: 'Primary Fuel Pressure (PSI)',
                  controller: controller.primaryFuelPressure,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          //Air/Fuel Ratio & Crankcase Pressure
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Air/Fuel Ratio & Crankcase Pressure'),
                HeadingAndTextfield(
                  title: 'Actual Air to Fuel Ratio (%)',
                  keyboardType: TextInputType.number,
                  controller: controller.actualAirToFuelRatio,
                ),
                HeadingAndTextfield(
                  title: 'Crankcase Pressure / Vacuum',
                  controller: controller.crankcasePressure,
                  keyboardType: TextInputType.number,
                ),
                TextfieldWithRadioButtons(
                  heading: 'Airfilter Restriction',
                  keyboardType: TextInputType.number,
                  val1: 'RB',
                  val2: 'LB',
                  textController: controller.airFilterRestriction,
                  radioController: controller.airFilterRestrictionRadio,
                ),
                CustomRadioButton(
                    options: const ['LOW', 'GOOD', 'HIGH', 'NA'],
                    selectedOption: controller.hydraulicOil,
                    heading: 'Hydraulic Oil')
              ],
            ),
          ),
          //Leaks Found
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Leaks Found'),
                CustomRadioButton(
                    options: const ['YES', 'NO'],
                    selectedOption: controller.isLeakageFound,
                    heading: 'Any Leaks Found?'),
                Obx(
                  () => Visibility(
                      visible: controller.isLeakageFound.value == "YES",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(text: 'If yes then describe'),
                          CheckboxWithTextfield(
                            heading: 'Oil',
                            isSelected: controller.hasOilLeakage,
                            controller: controller.oilDescription,
                          ),
                          CheckboxWithTextfield(
                            heading: 'Coolant',
                            isSelected: controller.hasCoolantLeakage,
                            controller: controller.coolantDescription,
                          ),
                          CheckboxWithTextfield(
                            heading: 'Gass',
                            isSelected: controller.hasGasLeakage,
                            controller: controller.gasDescription,
                          ),
                          CheckboxWithTextfield(
                            heading: 'Exhaust',
                            isSelected: controller.hasExhaustGasLeakage,
                            controller: controller.exhaustDescription,
                          ),
                          CheckboxWithTextfield(
                            heading: 'Air',
                            isSelected: controller.hasAirLeakage,
                            controller: controller.airDescription,
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
          //Excessive vibration & odd noises
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Excessive vibration & odd noises'),
                CustomRadioButton(
                  options: const ['YES', 'NO'],
                  selectedOption: controller.excessiveVibrationAndOddNoises,
                  heading: 'Excessive vibration & odd noises?',
                ),
                Obx(
                  () => Visibility(
                    visible: controller.excessiveVibrationAndOddNoises.value ==
                        "YES",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(text: 'If yes then describe'),
                        ReUsableTextField(
                          maxLines: 3,
                          hintText: 'Describe Excessive Vibration & Odd Noises',
                          showBackgroundShadow:
                              controller.excessiveVibrationAndOddNoises.value ==
                                  'YES',
                          readOnly:
                              controller.excessiveVibrationAndOddNoises.value ==
                                  'NO',
                          controller: controller
                              .excessiveVibrationAndOddNoisesDescription,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Problems with Driver
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Problems with Driver'),
                CustomRadioButton(
                  options: const ['YES', 'NO'],
                  selectedOption: controller.problemsWithDriver,
                  heading: 'Problem found with Driver during running checks?',
                ),
                Obx(
                  () => Visibility(
                    visible: controller.problemsWithDriver.value == 'YES',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(text: 'If yes then describe'),
                        ReUsableTextField(
                          maxLines: 3,
                          hintText:
                              'Describe Problem found with Driver during running checks',
                          showBackgroundShadow:
                              controller.problemsWithDriver.value == 'YES',
                          readOnly: controller.problemsWithDriver.value == 'NO',
                          controller: controller.problemsWithDriverDescription,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                child: CustomButton(
                    isLoading: false,
                    buttonText: 'Next',
                    onTap: () {
                      controller.nextPage();
                      controller.scrollUp();
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NumberWithTextField extends StatelessWidget {
  final String number;
  final TextEditingController? controller;
  const NumberWithTextField({super.key, required this.number, this.controller});

  @override
  Widget build(BuildContext context) {
    return HeadingAndTextfieldInRow(
      title: number,
      hintText: 'Temperature',
      controller: controller,
      keyboardType: TextInputType.number,
    );
  }
}

class CheckboxWithTextfield extends StatelessWidget {
  final String heading;
  final TextEditingController? controller;
  final RxBool isSelected;
  const CheckboxWithTextfield(
      {super.key,
      required this.heading,
      this.controller,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          SizedBox(
            width: 100,
            child: Column(
              children: [
                CustomTextWidget(text: heading),
                Checkbox(
                  value: isSelected.value,
                  onChanged: (value) {
                    isSelected.value = value!;
                  },
                ),
              ],
            ),
          ),
          Flexible(
              child: ReUsableTextField(
            hintText: 'Description',
            maxLines: 2,
            controller: controller,
            showBackgroundShadow: isSelected.value ? true : false,
            readOnly: isSelected.value ? false : true,
          ))
        ],
      ),
    );
  }
}

class TextfieldWithRadioButtons extends StatelessWidget {
  final String heading;
  final String val1;
  final String val2;
  final TextEditingController? textController;
  final RxString? radioController;
  final TextInputType? keyboardType;
  const TextfieldWithRadioButtons({
    super.key,
    required this.heading,
    this.textController,
    this.radioController,
    required this.val1,
    required this.val2,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: heading,
          fontWeight: FontWeight.w600,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ReUsableTextField(
                hintText: 'Value',
                controller: textController,
                keyboardType: keyboardType,
              ),
            ),
            Flexible(
              child: CustomRadioButton(
                  options: [val1],
                  selectedOption: radioController!,
                  heading: ''),
            ),
            Flexible(
              child: CustomRadioButton(
                  options: [val2],
                  selectedOption: radioController!,
                  heading: ''),
            ),
          ],
        ),
      ],
    );
  }
}

class InOutWidget extends StatelessWidget {
  final String heading;
  final TextEditingController? inController;
  final TextEditingController? outController;
  const InOutWidget(
      {super.key,
      required this.heading,
      this.inController,
      this.outController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: heading,
          fontWeight: FontWeight.w600,
          maxLines: 2,
        ),
        Row(
          children: [
            Flexible(
              child: HeadingAndTextfieldInRow(
                title: 'In',
                hintText: 'Value',
                controller: inController,
                keyboardType: TextInputType.number,
              ),
            ),
            Flexible(
              child: HeadingAndTextfieldInRow(
                title: 'Out',
                hintText: 'Value',
                controller: outController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ContainerHeading extends StatelessWidget {
  final String heading;
  const ContainerHeading({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: CustomTextWidget(
        text: heading,
        maxLines: 2,
        textAlign: TextAlign.center,
      )),
    );
  }
}
