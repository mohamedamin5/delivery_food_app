import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/themes/appcolor.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    required this.validator,
    required this.controller,
    required this.keyboardType,
  });
  final String? hintText;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Widget? prefixIcon;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _obscureText,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        prefixIcon: widget.prefixIcon,
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
