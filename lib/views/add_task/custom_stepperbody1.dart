import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/task_controllers.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/views/add_task/select_location.dart';
import 'package:mechanix/views/add_task/widgets/heading&textfield.dart';
import 'package:mechanix/views/add_task/widgets/radio_button.dart';

class CustomStepperBody1 extends StatelessWidget {
  CustomStepperBody1({
    super.key,
  });

  final UniversalController universalController = Get.find();
  final AddTaskController controller = Get.find();

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
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                HeadingAndTextfield(
                  title: 'Client\'s Name',
                  controller: controller.clientName,
                ),
                HeadingAndTextfield(
                  title: 'Client\'s Email',
                  controller: controller.clientEmail,
                ),
                HeadingAndTextfield(
                    title: 'Select Location',
                    controller: controller.selectedAddress,
                    suffixIcon: InkWell(
                      onTap: () => Get.to(() => SelectLocationScreen()),
                      child: Icon(Icons.location_on_outlined,
                          color: AppColors.blueTextColor),
                    )),
                Row(
                  children: [
                    Flexible(
                      child: HeadingAndTextfield(
                          title: 'Set Unit',
                          controller: controller.setUnits,
                          keyboardType: TextInputType.number),
                    ),
                    Flexible(
                      child: HeadingAndTextfield(
                          title: 'Unit Hours',
                          controller: controller.unitHours,
                          keyboardType: TextInputType.number),
                    )
                  ],
                ),
                Obx(
                  () => Row(
                    children: [
                      Flexible(
                        child: HeadingAndTextfield(
                          title: 'Select Date',
                          hintText:
                              controller.taskSelectedDate.value.toString(),
                          // hintText:
                          //     '${controller.taskSelectedDate.value.day.toString().padLeft(2, '0')}-${controller.taskSelectedDate.value.month.toString().padLeft(2, '0')}-${controller.taskSelectedDate.value.year.toString().padLeft(2, '0')}',
                          onTap: () => controller.selectDate(context),
                          readOnly: true,
                        ),
                      ),
                      Flexible(
                        child: HeadingAndTextfield(
                          title: 'Select Time',
                          hintText:
                              controller.taskSelectedTime.value.toString(),
                          // hintText:
                          //     '${controller.taskSelectedTime.value.format(context)..padLeft(2, '0')} ',
                          onTap: () => controller.selectTime(context),
                          readOnly: true,
                          // onChanged: (value) {
                          //   controller.selectTime(context);
                          // },
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'Engine Brand',
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                    ),
                    // CustomDropdown(
                    //   items: universalController.engines,
                    //   hintText: 'Select Engine Brand',
                    //   onTap: () {
                    //     debugPrint('Dropdown tapped');
                    //     universalController.engines.isEmpty
                    //         ? ToastMessage.showToastMessage(
                    //             message:
                    //                 'Please Add Engines first from the Engine section.',
                    //             backgroundColor: Colors.red)
                    //         : null;
                    //   },
                    //   onChanged: (value) {
                    //     controller.engineBrand.value = value!.name!;
                    //   },
                    // ),
                  ],
                ),
                HeadingAndTextfield(
                  title: 'Name of JOURNEYMAN',
                  controller: controller.nameOfJourneyMan,
                ),
                CustomRadioButton(
                  heading: 'Unit Online on Arrival?',
                  options: const ['YES', 'NO'],
                  selectedOption: controller.unitOnlineOnArrival,
                ),
                HeadingAndTextfield(
                  title: 'Job Scope',
                  maxLines: 5,
                  controller: controller.jobScope,
                ),
                HeadingAndTextfield(
                  title: 'Report Any Operations Problems',
                  maxLines: 5,
                  controller: controller.operationalProblems,
                ),
                Row(children: [
                  Flexible(
                      child: HeadingAndTextfield(
                          title: 'Model Number',
                          controller: controller.modelNumber,
                          keyboardType: TextInputType.number)),
                  Flexible(
                      child: HeadingAndTextfield(
                          title: 'Serial Number',
                          controller: controller.serialNumber,
                          keyboardType: TextInputType.number))
                ]),
                HeadingAndTextfield(
                    title: 'Arrangement Number',
                    controller: controller.arrangementNumber,
                    keyboardType: TextInputType.number),
                CustomRadioButton(
                  heading: 'Oil Sample (s) Taken?',
                  options: const ['YES', 'NO'],
                  selectedOption: controller.oilSamplesTaken,
                ),
              ],
            ),
          ),
          CustomButton(
              isLoading: false,
              buttonText: 'Next',
              onTap: () {
                controller.nextPage();
                controller.scrollUp();
              })
        ],
      ),
    );
  }
}

_openSelectEngineDialog(
    {required BuildContext context,
    required UniversalController controller,
    required AddTaskController taskController}) {
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
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: context.height * 0.02),
              decoration: const BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Column(
                children: [
                  CustomTextWidget(
                      text: 'Engines',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.engines.length,
                    itemBuilder: (context, index) {
                      final engine = controller.engines[index];
                      return null;
                      // return CustomEngineCard(
                      //   model: engine,
                      //   onTap: () {
                      //     taskController.engineBrand.value = engine.name ?? '';
                      //     Get.back();
                      //   },
                      // );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
