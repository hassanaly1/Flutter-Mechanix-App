import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mechanix/models/user_model.dart';

class AuthController extends GetxController {
  RxBool isLoginScreen = true.obs;
  RxBool isSubscriptionPurchased = false.obs;
  late SubscriptionType subscriptionType;
  final Rx<SubscriptionType?> selectedSubscription = SubscriptionType.none.obs;

  void setSelectedSubscription(SubscriptionType subscriptionType) {
    selectedSubscription.value = subscriptionType;
  }

  void updateUserSubscription() {
    subscriptionType = selectedSubscription.value ?? SubscriptionType.none;
    isSubscriptionPurchased.value = true;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
}
