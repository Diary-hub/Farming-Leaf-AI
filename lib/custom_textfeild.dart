import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;
  final TextEditingController controller;
  const CustomTextFeild({
    super.key,
    required this.icon,
    required this.obscureText,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: Colors.black.withOpacity(.1),
          ),
          hintText: hintText),
      cursorColor: Colors.black.withOpacity(.5),
    );
  }
}
