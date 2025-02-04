import 'package:book_app/core/utils/spacing.dart';
import 'package:book_app/feathers/favoriets/ui/widgets/app_bar.dart';
import 'package:book_app/feathers/favoriets/ui/widgets/favorite_list_view.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              const AppBarFavorte(),
              vertcalSpace(20),
              const FavoriteListView()
            ],
          ),
        ),
      ),
    );
  }
}
