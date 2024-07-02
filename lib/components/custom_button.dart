import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final Color backgroundColor;
  final String title;
  final FontStyle fontStyle;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    required this.title,
    this.fontStyle = FontStyle.normal,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.black,
          fontStyle: fontStyle,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
