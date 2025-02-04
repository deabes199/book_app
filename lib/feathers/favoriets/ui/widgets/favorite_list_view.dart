import 'package:book_app/feathers/favoriets/logic/cubit/favorite_cubit.dart';
import 'package:book_app/feathers/favoriets/ui/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteListView extends StatelessWidget {
  const FavoriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.separated(
            itemCount: context.read<FavoriteCubit>().favoritesList.length,
            separatorBuilder: (context, index) {
              return const Padding(padding: EdgeInsets.only(bottom: 12));
            },
            itemBuilder: (context, index) {
              return FavoriteItem(
                model: context.read<FavoriteCubit>().favoritesList[index],
              );
            },
          ),
        );
      },
    );
  }
}
