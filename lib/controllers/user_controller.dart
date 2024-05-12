import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  RxMap userInfo = {}.obs;
  final _storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    print('UserController Initialized');
    userInfo.value = _storage.read('user_info') ?? {};
    print('User Info: ${userInfo.value}');
  }

  updateUserInfo(Map<String, dynamic> userInfo) {
    this.userInfo.value = userInfo;
    GetStorage().write('user_info', userInfo);
  }
}
