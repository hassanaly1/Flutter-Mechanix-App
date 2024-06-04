import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';

class HomeScreen extends StatelessWidget {
  final SideMenuController sideMenu;

  const HomeScreen({
    super.key,
    required this.sideMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(
            horizontal: context.isLandscape
                ? context.width * 0.00
                : context.width * 0.05),
        // decoration: reusableContainerDecoration(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DashboardCard(
                isRotated: false,
                onTap: () {
                  showCustomPopup(
                      context: context,
                      width: context.width * 0.9,
                      sideMenu: sideMenu,
                      widget: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWidget(
                                text:
                                    'Select Task you want to start.\nYou can start only one at a time.',
                                fontSize: 12.0,
                                maxLines: 5,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500),
                            const SizedBox(height: 12.0),
                            CustomButton(
                                isLoading: false,
                                usePrimaryColor: true,
                                buttonText: 'Create Custom Task',
                                fontSize: 12.0,
                                onTap: () {
                                  sideMenu.changePage(1);
                                  Get.back();
                                }),
                            CustomButton(
                                isLoading: false,
                                usePrimaryColor: true,
                                buttonText: 'Create Generator Task',
                                fontSize: 12.0,
                                onTap: () {
                                  sideMenu.changePage(2);
                                  Get.back();
                                }),
                            CustomButton(
                                isLoading: false,
                                usePrimaryColor: true,
                                buttonText: 'Create Compressor Task',
                                fontSize: 12.0,
                                onTap: () {
                                  sideMenu.changePage(3);
                                  Get.back();
                                }),
                            CustomButton(
                                isLoading: false,
                                usePrimaryColor: true,
                                buttonText: 'Create OverHaul Report V8',
                                fontSize: 12.0,
                                onTap: () {
                                  sideMenu.changePage(4);
                                  Get.back();
                                }),
                            CustomButton(
                                isLoading: false,
                                usePrimaryColor: true,
                                buttonText: 'Create OverHaul Report V12',
                                fontSize: 12.0,
                                onTap: () {
                                  sideMenu.changePage(5);
                                  Get.back();
                                }),
                            CustomButton(
                                isLoading: false,
                                usePrimaryColor: true,
                                buttonText: 'Create OverHaul Report V16',
                                fontSize: 12.0,
                                onTap: () {
                                  sideMenu.changePage(6);
                                  Get.back();
                                }),
                            CustomButton(
                                isLoading: false,
                                usePrimaryColor: true,
                                buttonText:
                                    'Start OverHaul Report Assembly L7042GL C-14871',
                                fontSize: 12.0,
                                onTap: () {
                                  sideMenu.changePage(7);
                                  Get.back();
                                }),
                          ],
                        ),
                      ));
                },
                title: 'New Report',
                subtitle: 'Equipment Repair',
                image: 'assets/images/start-task.png',
              ),
              DashboardCard(
                isRotated: false,
                onTap: () => sideMenu.changePage(9),
                title: 'Engines',
                subtitle:
                    'Click here to add new Engines and view their details.',
                image: 'assets/images/engines.png',
              ),
              DashboardCard(
                isRotated: false,
                onTap: () => sideMenu.changePage(8),
                title: 'View Reports',
                subtitle:
                    'Click here to view all submitted repair forms and their details.',
                image: 'assets/images/view-task.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final VoidCallback? onTap;
  final bool isRotated;

  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.isRotated,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        onTap: onTap,
        child: ReUsableContainer(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4.0),
          child: isRotated
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(image, height: context.height * 0.18),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: title,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            maxLines: 2,
                          ),
                          CustomTextWidget(
                            text: subtitle,
                            maxLines: 5,
                            fontSize: 12.0,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: title,
                            fontSize: context.isLandscape ? 20.0 : 16.0,
                            fontWeight: FontWeight.w700,
                            maxLines: 2,
                          ),
                          CustomTextWidget(
                            text: subtitle,
                            maxLines: 5,
                            fontSize: context.isLandscape ? 12.0 : 10.0,
                          )
                        ],
                      ),
                    ),
                    Image.asset(image, height: context.height * 0.18)
                  ],
                ),
        ),
      ),
    );
  }
}

void showCustomPopup(
    {required BuildContext context,
    SideMenuController? sideMenu,
    required double? width,
    required Widget widget}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    transitionDuration: const Duration(milliseconds: 300),
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
                    width: width,
                    // height: context.height * 0.3,
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: context.height * 0.02),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(255, 220, 105, 0.4),
                          Color.fromRGBO(86, 127, 255, 0.4),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            spreadRadius: 5.0),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0)
                      ],
                    ),
                    child: widget,
                  ))));
    },
  );
}
