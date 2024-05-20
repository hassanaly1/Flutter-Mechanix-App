import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanix/helpers/appcolors.dart';
import 'package:mechanix/helpers/custom_text.dart';

class CustomRadioButton extends StatelessWidget {
  final String heading;
  final List<String> options;
  final RxString selectedOption;

  const CustomRadioButton({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6.0),
        CustomTextWidget(
          text: heading,
          fontWeight: FontWeight.w600,
          maxLines: 2,
        ),
        Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: options.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Radio(
                      visualDensity: VisualDensity.compact,
                      activeColor: AppColors.blueTextColor,
                      value: option,
                      groupValue: selectedOption.value,
                      onChanged: (value) {
                        selectedOption.value = value.toString();
                      },
                    ),
                    CustomTextWidget(text: option, fontSize: 11.0),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
