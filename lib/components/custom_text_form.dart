import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final String labelText;
  final TextEditingController controller;
  final Color? labelTextColor;

  const CustomTextForm({
    super.key,
    this.hintText = '',
    this.validator,
    required this.labelText,
    required this.controller,
    this.labelTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 12.sp,
        fontFamily: "SpaceMono",
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(2.h),
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 10.sp,
          fontFamily: "SpaceMono",
          fontWeight: FontWeight.bold,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          fontFamily: "SpaceMono",
          fontWeight: FontWeight.bold,
          color: labelTextColor,
        ),
      ),
      validator: validator,
    );
  }
}
