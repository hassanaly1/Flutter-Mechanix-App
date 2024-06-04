import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mechanix/controllers/custom_task_controller.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_button.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_container.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';
import 'package:mechanix/helpers/validator.dart';
import 'package:mechanix/views/add_task/widgets/checkbox.dart';
import 'package:mechanix/views/add_task/widgets/heading_and_textfield.dart';
import 'package:mechanix/views/add_task/widgets/radio_button.dart';
import 'package:mechanix/views/home.dart';

class CustomTaskBody extends StatelessWidget {
  final CustomTaskController controller = Get.find();
  final TextEditingController hintTextController = TextEditingController();
  final TextEditingController radioController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CustomTaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: CustomButton(
          isLoading: false,
          buttonText: 'Submit',
          onTap: () {},
        ),
        body: ListView(
          children: [
            IconButton(
              onPressed: () => _showAddElementPopup(context),
              icon: const Icon(FontAwesomeIcons.circlePlus),
            ),
            ReUsableContainer(
              showBackgroundShadow: false,
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var element in controller.formElements)
                        if (element.type == MyCustomTaskType.textfield)
                          HeadingAndTextfield(
                            title: element.heading ?? '',
                            controller: TextEditingController(),
                          )
                        else if (element.type == MyCustomTaskType.textArea)
                          HeadingAndTextfield(
                            title: element.heading ?? '',
                            controller: TextEditingController(),
                            maxLines: 5,
                          )
                        else if (element.type == MyCustomTaskType.radioButton)
                          CustomRadioButton(
                            options: element.options ?? [],
                            selectedOption: RxString(''),
                            heading: element.heading ?? '',
                          )
                        else if (element.type == MyCustomTaskType.checkbox)
                          CustomCheckboxWidget(
                            options: element.options ?? [],
                            heading: element.heading ?? '',
                            selectedValues: <String>[].obs,
                          )
                        else if (element.type == MyCustomTaskType.attachment)
                          HeadingAndTextfield(
                            title: element.heading ?? '',
                            readOnly: true,
                            onTap: () {
                              ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                            },
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddElementPopup(BuildContext context) {
    showCustomPopup(
      context: context,
      width: context.width * 0.3,
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAddTextFieldButton(context),
            _buildAddTextFieldButton(context, isTextArea: true),
            _buildAddRadioButtonButton(context),
            _buildAddCheckboxButton(context),
            _buildAddAttachmentButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAddTextFieldButton(BuildContext context,
      {bool isTextArea = false}) {
    return CustomButton(
      usePrimaryColor: true,
      buttonText: isTextArea ? 'Add Textarea' : 'Add Textfield',
      onTap: () {
        Get.back();
        _showTextFieldPopup(context, isTextArea: isTextArea);
      },
      isLoading: false,
    );
  }

  Widget _buildAddRadioButtonButton(BuildContext context) {
    return CustomButton(
      usePrimaryColor: true,
      buttonText: 'Add Radio Button',
      onTap: () {
        Get.back();
        _showRadioButtonPopup(context);
      },
      isLoading: false,
    );
  }

  Widget _buildAddCheckboxButton(BuildContext context) {
    return CustomButton(
      usePrimaryColor: true,
      buttonText: 'Add Checkbox',
      onTap: () {
        Get.back();
        _showRadioButtonPopup(context, isCheckbox: true);
      },
      isLoading: false,
    );
  }

  Widget _buildAddAttachmentButton(BuildContext context) {
    return CustomButton(
      usePrimaryColor: true,
      buttonText: 'Add Attachment',
      onTap: () {
        Get.back();
        _showAttachmentPopup(context);
      },
      isLoading: false,
    );
  }

  void _showTextFieldPopup(BuildContext context, {bool isTextArea = false}) {
    showCustomPopup(
      context: context,
      width: context.width * 0.3,
      widget: Column(
        children: [
          Form(
            key: _formKey,
            child: ReUsableTextField(
              hintText: 'Enter Textfield Name',
              controller: hintTextController,
              validator: (value) => AppValidator.validateEmptyText(
                fieldName: 'Textfield Name',
                value: value,
              ),
            ),
          ),
          CustomButton(
            usePrimaryColor: true,
            buttonText: 'Add Textfield',
            onTap: () {
              if (_formKey.currentState!.validate()) {
                controller.addFormElement(
                  MyCustomTaskModel(
                    heading: hintTextController.text,
                    type: isTextArea
                        ? MyCustomTaskType.textArea
                        : MyCustomTaskType.textfield,
                  ),
                );
                Get.back();
                hintTextController.clear();
              }
            },
            isLoading: false,
          ),
        ],
      ),
    );
  }

  void _showAttachmentPopup(BuildContext context) {
    showCustomPopup(
      context: context,
      width: context.width * 0.3,
      widget: Column(
        children: [
          Form(
            key: _formKey,
            child: ReUsableTextField(
              hintText: 'Enter Heading',
              controller: hintTextController,
              validator: (value) => AppValidator.validateEmptyText(
                fieldName: 'Heading',
                value: value,
              ),
            ),
          ),
          CustomButton(
            usePrimaryColor: true,
            buttonText: 'Add Attachment',
            onTap: () {
              if (_formKey.currentState!.validate()) {
                controller.addFormElement(
                  MyCustomTaskModel(
                    heading: hintTextController.text,
                    type: MyCustomTaskType.attachment,
                  ),
                );
                Get.back();
                hintTextController.clear();
              }
            },
            isLoading: false,
          ),
        ],
      ),
    );
  }

  void _showRadioButtonPopup(BuildContext context, {bool isCheckbox = false}) {
    var options = <String>[].obs;
    showCustomPopup(
      context: context,
      width: context.width * 0.3,
      widget: Obx(
        () => Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  ReUsableTextField(
                    hintText: 'Enter Heading',
                    controller: hintTextController,
                    validator: (value) => AppValidator.validateEmptyText(
                      fieldName: 'Heading',
                      value: value,
                    ),
                  ),
                  ReUsableTextField(
                    hintText: 'Enter Option',
                    controller: radioController,
                  ),
                  Wrap(
                    children: [
                      for (var option in options)
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            backgroundColor: AppColors.blueTextColor,
                            deleteIconColor: Colors.red,
                            deleteIcon: const Icon(Icons.clear, size: 20),
                            padding: const EdgeInsets.all(8.0),
                            onDeleted: () {
                              options.remove(option);
                            },
                            label: CustomTextWidget(
                                text: option, textColor: Colors.white70),
                          ),
                        ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      if (radioController.text.isEmpty) return;
                      options.add(radioController.text.trim());
                      radioController.clear();
                    },
                    child: CustomTextWidget(
                      text: 'Add Option',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              usePrimaryColor: true,
              buttonText: isCheckbox ? 'Add Checkbox' : 'Add Radio Button',
              onTap: () {
                if (_formKey.currentState!.validate() && options.isNotEmpty) {
                  controller.addFormElement(
                    MyCustomTaskModel(
                      heading: hintTextController.text,
                      type: isCheckbox
                          ? MyCustomTaskType.checkbox
                          : MyCustomTaskType.radioButton,
                      options: options,
                    ),
                  );
                  Get.back();
                  hintTextController.clear();
                }
              },
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
