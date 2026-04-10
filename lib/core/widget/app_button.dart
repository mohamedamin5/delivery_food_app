import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/themes/appcolor.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.height,
  });

  final String text;
  final void Function()? onTap;
  final double height;
  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      ),
    );
  }
}
