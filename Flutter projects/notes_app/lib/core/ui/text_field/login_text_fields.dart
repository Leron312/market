import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.errorText,
    required this.labelText,
    this.onChanged,
    this.needObscureText = false,
  });

  final String? errorText;
  final String labelText;
  final void Function(String)? onChanged;
  final bool needObscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black12,
      obscureText: needObscureText,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.black12),
        labelText: labelText,
        errorText: errorText,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
