import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/googlemap_controller.dart';
import 'package:mechanix/controllers/task_controllers.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/models/payload.dart';
import 'package:mechanix/views/add_task/custom_stepperbody2.dart';
import 'package:mechanix/views/add_task/widgets/heading&textfield.dart';
import 'package:mechanix/views/add_task/widgets/radio_button.dart';

class CustomStepperBody4 extends StatelessWidget {
  final SideMenuController sideMenu;
  CustomStepperBody4({
    super.key,
    required this.sideMenu,
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
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
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
              key: _partsFormkey,
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
                      if (_partsFormkey.currentState!.validate()) {
                        controller.partsList.add(
                          Part(
                            name: controller.partName.text.trim(),
                            description: controller.partDescription.text.trim(),
                            quantity: double.tryParse(
                                controller.partQuantity.text.trim()),
                            vendor: controller.partVendor.text.trim(),
                          ),
                        );
                        controller.partName.clear();
                        controller.partDescription.clear();
                        controller.partQuantity.clear();
                        controller.partVendor.clear();
                      }
                    },
                  )
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
          //   List of Parts
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
                    buttonText: 'SUBMIT',
                    onTap: () async => await controller.addTask().then((value) {
                          sideMenu.changePage(0);
                          // Get.off(() => const DashboardScreen());
                          Get.delete<AddTaskController>();
                          Get.delete<MapController>();
                        })),
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
