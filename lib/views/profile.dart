
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mechanix/controllers/universal_controller.dart';
import 'package:mechanix/data/auth_service.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/helpers/toast.dart';
import 'package:mechanix/views/auth/login.dart';

class ProfileSection extends StatefulWidget {
  final SideMenuController sideMenu;
  const ProfileSection({super.key, required this.sideMenu});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  final UniversalController universalController = Get.find();
  RxBool isLoading = false.obs;
  final GetStorage _storage = GetStorage();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  // XFile? userImage;
  // Uint8List? userImageInBytes;

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        widget.sideMenu.changePage(0);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: context.height,
          width: context.width * 0.25,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: updateUserImage,
                  child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      // backgroundImage:
                      //     MemoryImage(universalController.userImageInBytes!),
                      backgroundImage: universalController.userImageURL.value !=
                              ''
                          ? NetworkImage(
                              universalController.userImageURL.value ?? '')
                          : const AssetImage('assets/images/placeholder.png')
                              as ImageProvider),
                ),
                const SizedBox(height: 12.0),
                Obx(
                  () => CustomTextWidget(
                    text: (universalController.userInfo.value['first_name'] ??
                            '') +
                        ' ' +
                        (universalController.userInfo['last_name'] ?? ''),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                CustomTextWidget(
                  text: universalController.userInfo.value['email'] ?? '',
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  textColor: AppColors.lightTextColor,
                ),
                Obx(
                  () => Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: context.height * 0.03,
                        horizontal: context.width * 0.01),
                    child: Column(
                      children: [
                        ReUsableTextField(
                            controller: firstNameController,
                            hintText: universalController
                                    .userInfo.value['first_name'] ??
                                ''),
                        ReUsableTextField(
                            controller: lastNameController,
                            hintText: universalController
                                    .userInfo.value['last_name'] ??
                                ''),
                        ReUsableTextField(
                            hintText:
                                universalController.userInfo.value['email'] ??
                                    '',
                            readOnly: true),
                        Obx(
                          () => CustomButton(
                            isLoading: isLoading.value,
                            buttonText: 'Update',
                            onTap: () {
                              updateProfileInfo();
                            },
                            usePrimaryColor: true,
                            textColor: Colors.black87,
                          ),
                        ),
                        CustomButton(
                          isLoading: false,
                          buttonText: 'Logout',
                          onTap: () {
                            storage.remove('token');
                            storage.remove('user_info');
                            Get.offAll(() => LoginScreen());
                          },
                          textColor: Colors.white60,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProfileInfo() async {
    try {
      isLoading.value = true;
      bool success = await AuthService().updateProfile(
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          // userImageInBytes: universalController.userImageInBytes!,
          token: _storage.read('token'));
      isLoading.value = false;

      if (success) {
        setState(() {});
        // Profile update successful
      } else {
        // Profile update failed
        ToastMessage.showToastMessage(
            message: 'Something went wrong, try again',
            backgroundColor: Colors.green);
      }
    } catch (e) {
      ToastMessage.showToastMessage(
          message: 'Something went wrong, try again',
          backgroundColor: Colors.green);
      isLoading.value = false;
    }
  }

  Future<void> updateUserImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      universalController.userImage = image;
      universalController.userImageURL.value = image.path;
      universalController.userImageInBytes =
          (await universalController.userImage?.readAsBytes())!;
      debugPrint('UserImageInBytes: ${universalController.userImageInBytes}');

      UpdateUserImageResult result = await AuthService().updateUserImage(
        token: _storage.read('token'),
        engineImageInBytes: universalController.userImageInBytes!,
      );

      if (result.isSuccess) {
        if (result.userData != null) {
          debugPrint('AfterUpdateProfileLink: ${result.userData!['profile']}');
          universalController.setUserImageUrl = result.userData!['profile'];
          debugPrint('AfterUpdate: ${universalController.userImageURL.value}');
          ToastMessage.showToastMessage(
              message: 'Profile Image Updated', backgroundColor: Colors.green);
        } else {
          ToastMessage.showToastMessage(
              message: 'Profile Image Updated, but user data is missing',
              backgroundColor: Colors.yellow);
        }
      } else {
        ToastMessage.showToastMessage(
            message: 'Something went wrong, try again',
            backgroundColor: Colors.red);
      }

      setState(() {});
    } else {
      debugPrint('No image selected');
      ToastMessage.showToastMessage(
          message: 'No image selected', backgroundColor: Colors.red);
    }
  }
}
