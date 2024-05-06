import 'package:easy_sidemenu/easy_sidemenu.dart';

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
  final SideMenuController sideMenu;
  ViewAllTasksScreen({super.key, required this.sideMenu});

  final UniversalController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          sideMenu.changePage(0);
        },
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
                  child: ListTile(
                    visualDensity: VisualDensity.compact,
                    onTap: () {},
                    leading: Icon(Icons.calendar_month,
                        color: AppColors.blueTextColor),
                    title: CustomTextWidget(
                      text: DateFormat('yyyy-MM-dd').format(now),
                    ),
                    trailing: CustomTextWidget(
                      text: 'Change',
                      fontSize: 12.0,
                    ),
                  ),
                ),
                controller.tasks.isEmpty
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: context.height * 0.1),
                              Image.asset('assets/images/view-task.png',
                                  height: context.height * 0.15),
                              CustomTextWidget(
                                text: 'No Tasks found',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: controller.tasks.length,
                          itemBuilder: (context, index) => CustomTaskCard(
                            model: controller.tasks[index],
                          ),
                        ),
                      )
              ],
            ),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Flexible(
                //   child: CustomTextWidget(
                //     text: model.geolocation?.address! == ""
                //         ? 'Not Assigned'
                //         : model.geolocation?.address ?? '',
                //     fontSize: 12.0,
                //     decoration: TextDecoration.underline,
                //   ),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // CustomTextWidget(
                    //   text: model.date == null
                    //       ? 'Not Assigned'
                    //       : '${model.date?.day.toString().padLeft(2, '0')} : ${model.date?.month.toString().padLeft(2, '0')} : ${model.date?.year.toString().padLeft(2, '0')}',
                    //   fontSize: 10.0,
                    // ),
                    // CustomTextWidget(
                    //   text: model.time == null
                    //       ? 'Not Assigned'
                    //       : '${model.time?.format(context).padLeft(2, '0')}',
                    //   fontSize: 10.0,
                    // ),
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
                    text: model.nameJourneyMan!.isEmpty
                        ? 'Not Assigned'
                        : model.nameJourneyMan!,
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
