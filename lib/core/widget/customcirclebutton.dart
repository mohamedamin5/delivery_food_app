import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleButton extends StatelessWidget {
  final double size;
  final Color bgColor;
  final Widget icon;
  final VoidCallback? onTap;

  const CustomCircleButton({
    super.key,
    this.size = 46,
    required this.bgColor,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.h,
        width: size.w,
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Center(child: icon),
      ),
    );
  }
}
