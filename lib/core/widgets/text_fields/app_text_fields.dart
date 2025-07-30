import 'package:flutter/material.dart';

class AppTextFields extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final int? maxLines;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;

  const AppTextFields({
    this.controller,
    required this.hintText,
    this.prefixIcon,
    this.maxLines,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        //hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        labelText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        //   borderRadius: BorderRadius.circular(12),
        // ),
      ),
    );
  }
}
