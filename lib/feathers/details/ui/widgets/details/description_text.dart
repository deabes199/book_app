import 'package:book_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        vertcalSpace(10),
        Text(
         description,
          style:const TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
