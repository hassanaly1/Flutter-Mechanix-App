import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/models/task_model.dart';

class ViewAllTasksScreen extends StatelessWidget {
  ViewAllTasksScreen({super.key});

  final UniversalController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: context.height * 0.02,
              horizontal: context.width * 0.05),
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        context.isLandscape ? context.width * 0.08 : 0.0),
                child: ReUsableTextField(
                  hintText: 'Search Task',
                  suffixIcon: const Icon(Icons.search_sharp),
                ),
              ),
              ReUsableContainer(
                  child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.calendar_month)),
                  CustomTextWidget(
                    text: DateFormat('yyyy-MM-dd').format(now),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {}, child: CustomTextWidget(text: 'Change'))
                ],
              )),
              controller.tasks.isEmpty
                  ? Center(
                      child: Column(
                      children: [
                        Image.asset('assets/images/view-task.png',
                            height: context.height * 0.15),
                        CustomTextWidget(
                          text: 'No Tasks Added',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.tasks.length,
                      itemBuilder: (context, index) => CustomTaskCard(
                        model: controller.tasks[index],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTaskCard extends StatelessWidget {
  final TaskModel model;
  const CustomTaskCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      color: Colors.white30,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: CustomTextWidget(
                    text: model.selectedAddress! == ""
                        ? 'Not Assigned'
                        : model.selectedAddress!,
                    fontSize: 12.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextWidget(
                      text: model.selectedDate == null
                          ? 'Not Assigned'
                          : '${model.selectedDate?.day.toString().padLeft(2, '0')} : ${model.selectedDate?.month.toString().padLeft(2, '0')} : ${model.selectedDate?.year.toString().padLeft(2, '0')}',
                      fontSize: 10.0,
                    ),
                    CustomTextWidget(
                      text: model.selectedTime == null
                          ? 'Not Assigned'
                          : '${model.selectedTime?.format(context).padLeft(2, '0')}',
                      fontSize: 10.0,
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/construction-worker.png',
                  height: 30.0,
                  color: AppColors.blueTextColor,
                ),
                const SizedBox(width: 4.0),
                Flexible(
                  child: CustomTextWidget(
                    text: model.nameOfJourneyMan!.isEmpty
                        ? 'Not Assigned'
                        : model.nameOfJourneyMan!,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            CustomTextWidget(
              text: 'Job Scope:',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
            CustomTextWidget(
              text: model.jobScope!.isEmpty ? 'Not Assigned' : model.jobScope!,
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
