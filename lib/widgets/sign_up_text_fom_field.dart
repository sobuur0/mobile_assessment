import 'package:flutter/material.dart';

class SignUpTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscureText;
  final String? Function(String?) validator;
  final Widget? suffixIcon;

  const SignUpTextFormField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.obscureText,
    required this.validator,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(
        color: Colors.blueAccent,
        fontSize: 16.0,
      ),
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: const Color(0xFFF5F5F5),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Color(0xFFF5F5F5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.blueAccent,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFF5F5F5),
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
