import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.title, required this.subTitle});
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: '$title : ',
        style: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: subTitle,
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
      )
    ]));
  }
}
