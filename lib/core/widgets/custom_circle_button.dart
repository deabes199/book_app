import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton(
      {super.key,
      this.radius,
      required this.icon,
      this.iconColor,
      this.background,
      this.iconSize,
      this.onPressed});
  final double? radius;
  final IconData icon;
  final Color? iconColor;
  final Color? background;
  final double? iconSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 30,
      backgroundColor: background ?? Colors.grey.shade300,
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: iconColor ?? Colors.black,
            size: iconSize ?? 25,
          )),
    );
  }
}