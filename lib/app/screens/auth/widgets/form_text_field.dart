import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String label;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final String? errorText;
  const FormTextField({
    super.key,
    required this.label,
    required this.onChanged,
    required this.errorText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        labelStyle: const TextStyle(color: Colors.blue),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
