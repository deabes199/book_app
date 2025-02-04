import 'package:book_app/core/routes/routes.dart';
import 'package:book_app/core/widgets/custom_circle_button.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
                children: [
                  CustomCircleButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.searchScreen);
                    },
                    icon: Icons.search,
                    iconSize: 30,
                  ),
                  const Spacer(),
                  CustomCircleButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.favoirteScreen);
                    },
                    icon: Icons.favorite,
                    iconSize: 30,
                  ),
                ],
              );
  }
}