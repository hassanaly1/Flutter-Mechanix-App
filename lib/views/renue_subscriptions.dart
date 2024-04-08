import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/controllers/auth_controllers.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/models/user_model.dart';

class RenewalSubscriptions extends StatelessWidget {
  final SideMenuController sideMenu;
  RenewalSubscriptions({super.key, required this.sideMenu});
  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        sideMenu.changePage(0);
      },
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
              height: context.height,
              width: context.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: context.isLandscape
                            ? context.height * 0.1
                            : context.height * 0.03),
                    CustomTextWidget(
                      text: 'Subscriptions',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomTextWidget(
                      text:
                          'Buy Subscriptions according to your business needs',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      fontStyle: FontStyle.italic,
                      maxLines: 4,
                    ),
                    SizedBox(height: context.height * 0.03),
                    Obx(
                      () => Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          PlanContainer(
                            plan: 'Basic Plan',
                            duration: 'Monthly',
                            amount: '4.99',
                            isSelected: controller.selectedSubscription.value ==
                                SubscriptionType.basic,
                            onSelected: controller.setSelectedSubscription,
                            gradient: const LinearGradient(
                              colors: [Colors.white30, Colors.teal],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          PlanContainer(
                            plan: 'Standard Plan',
                            duration: 'Quarterly',
                            amount: '9.99',
                            isSelected: controller.selectedSubscription.value ==
                                SubscriptionType.standard,
                            onSelected: controller.setSelectedSubscription,
                            gradient: const LinearGradient(
                              colors: [Colors.white30, Colors.deepOrange],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          PlanContainer(
                            plan: 'Gold Plan',
                            duration: 'Bi-Annual',
                            amount: '19.99',
                            isSelected: controller.selectedSubscription.value ==
                                SubscriptionType.gold,
                            onSelected: controller.setSelectedSubscription,
                            gradient: const LinearGradient(
                              colors: [Colors.white30, Colors.deepPurpleAccent],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          PlanContainer(
                            plan: 'Premium Plan',
                            duration: 'Annually',
                            amount: '29.99',
                            isSelected: controller.selectedSubscription.value ==
                                SubscriptionType.premium,
                            onSelected: controller.setSelectedSubscription,
                            gradient: const LinearGradient(
                              colors: [Colors.white30, Colors.blueAccent],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: 200,
                      child: CustomButton(
                        buttonText: 'Purchase',
                        onTap: () {
                          if (controller.selectedSubscription.value ==
                              SubscriptionType.none) {
                            ToastMessage.showToastMessage(
                                message:
                                    'Please select the Subscription first.',
                                backgroundColor: AppColors.blueTextColor);
                          } else {
                            controller.updateUserSubscription();
                            debugPrint(
                                'Current SubscriptionType: ${controller.subscriptionType}');
                            // Get.offAll(
                            //       () => const DashboardScreen(),
                            //   transition: Transition.size,
                            //   duration: const Duration(seconds: 1),
                            // );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class PlanContainer extends StatelessWidget {
  final String plan;
  final String duration;
  final String amount;
  final bool isSelected;
  final Gradient? gradient;
  final Function(SubscriptionType) onSelected;

  const PlanContainer({
    super.key,
    required this.plan,
    required this.duration,
    required this.amount,
    required this.isSelected,
    required this.onSelected,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Notify the parent widget about the selection
        onSelected(_getSubscriptionTypeFromPlan(plan));
        print(_getSubscriptionTypeFromPlan(plan));
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.22,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
            border: Border.all(
              color: isSelected ? Colors.black54 : Colors.transparent,
              width: 2.0,
            ),
            gradient: gradient,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 1.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color: Colors.white54,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: duration,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  decoration: TextDecoration.underline,
                ),
                const SizedBox(height: 20.0),
                CustomTextWidget(
                  text: plan,
                  fontWeight: FontWeight.w500,
                ),
                CustomTextWidget(
                  text: '\$ $amount / $duration',
                  fontWeight: FontWeight.w300,
                  textColor: AppColors.textColor,
                  fontSize: 12.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SubscriptionType _getSubscriptionTypeFromPlan(String planName) {
    switch (planName.toLowerCase()) {
      case 'basic plan':
        return SubscriptionType.basic;
      case 'standard plan':
        return SubscriptionType.standard;
      case 'gold plan':
        return SubscriptionType.gold;
      case 'premium plan':
        return SubscriptionType.premium;
      default:
        return SubscriptionType.none;
    }
  }
}
