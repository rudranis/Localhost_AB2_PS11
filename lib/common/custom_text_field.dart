import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData? icon;
  final bool isPassword;
  final TextEditingController controller;

  const CustomInputField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.icon,
    this.isPassword = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70),
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: icon != null ? Icon(icon, color: Colors.white) : null,
        filled: true,
        fillColor: Colors.blueGrey.shade700,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
