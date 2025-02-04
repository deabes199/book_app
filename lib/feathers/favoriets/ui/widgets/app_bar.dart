import 'package:book_app/core/utils/app_assets.dart';
import 'package:book_app/core/utils/spacing.dart';
import 'package:book_app/feathers/favoriets/logic/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarFavorte extends StatelessWidget {
  const AppBarFavorte({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return context.read<FavoriteCubit>().favoritesList.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  vertcalSpace(200),
                  Image.asset(
                    AppAssets.notFound,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child:const Text(
                        'Back To Home',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ))
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const Text(
                    'Favorite Screen',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<FavoriteCubit>().clearAllItems();
                      },
                      icon:const Icon(Icons.delete))
                ],
              );
      },
    );
  }
}
