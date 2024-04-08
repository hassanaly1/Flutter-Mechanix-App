import 'package:get/get.dart';

class User {
  String? name;
  String? email;
  String? profilePicture;
  SubscriptionType? subscriptionType;
  bool isActive;
  DateTime? startDate;
  DateTime? endDate;

  User({
    this.name,
    this.email,
    this.profilePicture,
    this.subscriptionType,
    this.isActive = false,
    this.startDate,
    this.endDate,
  });
}

enum SubscriptionType { none, basic, standard, gold, premium }

// Making the enum observable
extension SubscriptionTypeExtension on SubscriptionType {
  Rx<SubscriptionType> get obs => Rx<SubscriptionType>(this);
  String get displayName {
    switch (this) {
      case SubscriptionType.none:
        return 'None';
      case SubscriptionType.basic:
        return 'Basic';
      case SubscriptionType.standard:
        return 'Standard';
      case SubscriptionType.gold:
        return 'Gold';
      case SubscriptionType.premium:
        return 'Premium';
    }
  }
}
