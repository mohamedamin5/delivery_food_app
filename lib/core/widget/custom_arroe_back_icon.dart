import 'package:flutter/material.dart';

class CustomArroeBackIcon extends StatefulWidget {
  const CustomArroeBackIcon({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  State<CustomArroeBackIcon> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CustomArroeBackIcon> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: size.width * 0.12,
        height: size.height * 0.055,
        decoration: BoxDecoration(
          color: Color(0xFFECF0F4),
          shape: BoxShape.circle,
        ),
        child: Center(child: Icon(Icons.arrow_back_ios)),
      ),
    );
  }
}
