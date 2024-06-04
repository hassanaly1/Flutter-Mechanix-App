import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/generator_task_controllers.dart';
import 'package:mechanix/helpers/appcolors.dart';

class StepperHeader extends StatelessWidget {
  const StepperHeader({
    super.key,
    required this.controller,
  });

  final GeneratorTaskController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(top: 2.0, left: 8.8, right: 8.0),
          child: EasyStepper(
            activeStep: controller.activePageIndex.value,
            onStepReached: (index) {
              controller.setActivePage(index);
            },

            borderThickness: 4,
            stepRadius: 35,
            disableScroll: true,
            padding: EdgeInsets.zero,
            internalPadding: 4.0,
            stepShape: StepShape.circle,
            // enableStepTapping: false,
            showLoadingAnimation: true,
            loadingAnimation: 'assets/lottie/loading-animation.json',
            unreachedStepBorderColor: AppColors.blueTextColor.withOpacity(0.3),
            finishedStepBorderType: BorderType.normal,
            finishedStepBorderColor: AppColors.primaryColor,
            finishedStepTextColor: AppColors.primaryColor,
            finishedStepBackgroundColor: AppColors.primaryColor,
            activeStepIconColor: AppColors.primaryColor,
            finishedStepIconColor: AppColors.blueTextColor,

            unreachedStepBackgroundColor: Colors.transparent,
            steps: [
              EasyStep(
                customStep: Opacity(
                  opacity: controller.activePageIndex.value >= 0 ? 1 : 0.3,
                  child: const Icon(FontAwesomeIcons.circleCheck),
                ),
              ),
              EasyStep(
                customStep: Opacity(
                  opacity: controller.activePageIndex.value >= 1 ? 1 : 0.3,
                  child: const Icon(FontAwesomeIcons.circleCheck),
                ),
              ),
              EasyStep(
                customStep: Opacity(
                  opacity: controller.activePageIndex.value >= 2 ? 1 : 0.3,
                  child: const Icon(FontAwesomeIcons.circleCheck),
                ),
              ),
              EasyStep(
                customStep: Opacity(
                  opacity: controller.activePageIndex.value >= 3 ? 1 : 0.3,
                  child: const Icon(FontAwesomeIcons.circleCheck),
                ),
              ),
            ],
          ),
        ));
  }
}
