import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';

class ReportsScreen extends StatelessWidget {
  final SideMenuController sideMenu;
  ReportsScreen({super.key, required this.sideMenu});
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
                controller.reports.isEmpty
                    ? Center(
                        child: Column(
                        children: [
                          Image.asset('assets/images/view-task.png',
                              height: context.height * 0.15),
                          CustomTextWidget(
                            text: 'No Reports Added',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) =>
                            const CustomReportCard(),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomReportCard extends StatelessWidget {
  const CustomReportCard({
    super.key,
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
                CustomTextWidget(
                  text: 'Report ID: RP-2024001',
                  fontSize: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextWidget(
                      text: 'Date: March 10, 2024',
                      fontSize: 10.0,
                    ),
                    CustomTextWidget(
                      text: 'Time: 09:30 AM',
                      fontSize: 10.0,
                    ),
                  ],
                )
              ],
            ),
            CustomTextWidget(
              text: 'Machine ID: MAC-12345',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
            CustomTextWidget(
              text: 'Technician: John Doe',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
