import 'package:flutter/material.dart';
import 'package:rest_api_example/common/const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.autofocus = false,
    required this.onChanged,
  });

  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: inputBorderColor,
      ),
    );
    return TextFormField(
      cursorColor: primaryColor,
      autofocus: autofocus,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(
          color: bodyTextColor,
          fontSize: 14.0,
        ),
        fillColor: inputBGColor,
        filled: true,
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: const BorderSide(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
