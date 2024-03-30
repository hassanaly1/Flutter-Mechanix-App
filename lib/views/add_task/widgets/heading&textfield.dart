import 'package:flutter/cupertino.dart';
import 'package:mechanix/helpers/custom_text.dart';
import 'package:mechanix/helpers/reusable_textfield.dart';

class HeadingAndTextfield extends StatelessWidget {
  final String title;
  final double? fontSize;
  final String? hintText;
  final bool? readOnly;
  final VoidCallback? onTap;
  void Function(String)? onChanged;
  int? maxLines;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  TextEditingController? controller;
  final String? Function(String?)? validator;
  HeadingAndTextfield(
      {super.key,
      required this.title,
      this.hintText,
      this.onTap,
      this.readOnly,
      this.validator,
      this.controller,
      this.onChanged,
      this.maxLines,
      this.suffixIcon,
      this.prefixIcon,
      this.keyboardType,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
            maxLines: 2,
          ),
          ReUsableTextField(
            controller: controller,
            onChanged: onChanged,
            onTap: onTap,
            readOnly: readOnly,
            hintText: hintText ?? title,
            maxLines: maxLines,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            keyboardType: keyboardType,
            validator: validator,
          )
        ],
      ),
    );
  }
}

class HeadingAndTextfieldInRow extends StatelessWidget {
  final String title;
  final String hintText;
  final bool? readOnly;
  int? maxLines;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  TextEditingController? controller;
  final String? Function(String?)? validator;
  HeadingAndTextfieldInRow(
      {super.key,
      required this.title,
      required this.hintText,
      this.readOnly,
      this.validator,
      this.controller,
      this.maxLines,
      this.suffixIcon,
      this.prefixIcon,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: Row(
        children: [
          CustomTextWidget(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
            maxLines: 2,
          ),
          const SizedBox(width: 10.0),
          Flexible(
            child: ReUsableTextField(
              controller: controller,
              readOnly: readOnly,
              hintText: hintText,
              maxLines: maxLines,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              keyboardType: keyboardType,
              validator: validator,
            ),
          )
        ],
      ),
    );
  }
}
