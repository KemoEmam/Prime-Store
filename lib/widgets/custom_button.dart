import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.label,
      this.onTap,
      required this.buttonColor,
      required this.textColor})
      : super(key: key);
  final String label;
  final VoidCallback? onTap;
  final Color buttonColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: textColor, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
