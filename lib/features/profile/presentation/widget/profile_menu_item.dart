import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.color,
  });
  final String title;
  final IconData icon;
  final Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 16),
          Text(title),
          Spacer(),
          Icon(Icons.arrow_forward_ios_outlined),
        ],
      ),
    );
  }
}
