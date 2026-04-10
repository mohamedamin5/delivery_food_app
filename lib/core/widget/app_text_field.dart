import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/themes/appcolor.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    required this.validator,
  });
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: _obscureText,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        hintText: widget.hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
