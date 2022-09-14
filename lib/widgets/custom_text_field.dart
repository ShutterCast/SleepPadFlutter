import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final Icon? icon;
  final Widget? suffixicon;
  final int? maxLines;
  final int? maxLength;

  final FormFieldValidator<String?>? validator;
  final TextInputAction? textInputAction;
  const CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.textInputType,
    required this.hintText,
    this.icon,
    this.suffixicon,
    this.isPass = false,
    this.validator,
    this.maxLines,
    this.textInputAction,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return TextFormField(
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: textEditingController,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: suffixicon,
        prefixIcon: icon,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        counterText: "",
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
