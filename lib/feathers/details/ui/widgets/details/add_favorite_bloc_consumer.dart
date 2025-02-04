import 'package:book_app/core/widgets/custom_circle_button.dart';
import 'package:book_app/feathers/favoriets/data/models/favorite_model.dart';
import 'package:book_app/feathers/favoriets/logic/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFavoriteBlocConsumer extends StatelessWidget {
  const AddFavoriteBlocConsumer({super.key, required this.book});
  final FavoriteModel book;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state is AddItemState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.grey,
              content: Text('Added To Favorite'),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomCircleButton(
          icon: Icons.favorite,
          iconColor: context.read<FavoriteCubit>().isBookInFavorite(book)
              ? Colors.red
              : Colors.grey,
          iconSize: 35,
          onPressed: () {
            context.read<FavoriteCubit>().addItemInFavorite(book);
          },
        );
      },
    );
  }
}
