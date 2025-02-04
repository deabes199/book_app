import 'package:book_app/core/utils/spacing.dart';
import 'package:book_app/feathers/home/ui/widgets/home_app_bar.dart';
import 'package:book_app/feathers/home/ui/widgets/newest/newes_bloc_builder.dart';
import 'package:book_app/feathers/home/ui/widgets/recommendation/recommend_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vertcalSpace(12),
              const HomeAppBar(),
              vertcalSpace(20),
              const Text(
                'Recommended For You',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              vertcalSpace(10),
              RecommendationBlocBuilder(),
              const Text(
                'Newest Books',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              vertcalSpace(10),
              const NewesBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
