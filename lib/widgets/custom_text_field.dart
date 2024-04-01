import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.hintText,
      this.textInputType,
      this.onChanged,
      this.obscureText = false,
      required this.borderColor});
  final String? hintText;
  final bool? obscureText;
  final Function(String)? onChanged;
  final Color borderColor;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: obscureText!,
      style: const TextStyle(color: Colors.black),
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: borderColor),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}
